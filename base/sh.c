// Shell.

#include "types.h"
#include "user.h"
#include "fcntl.h"

// Parsed command representation
#define EXEC  1
#define REDIR 2
#define PIPE  3
#define LIST  4
#define BACK  5

#define MAXARGS 10
#define MAX_BG_PROCS 10 

int bg_pids[MAX_BG_PROCS];
int bg_count = 0;

char commandhist[10][100]; //stores command history
void addhist(char* newest);
void printhist();
void runhist(int num);

int areEqual(char *x, char* y) { //checks strings instead of pointers
  int unequal = 0;
  while (*x != '\0' || *y != '\0') {
    if (*x == *y) {
      x++;
      y++;
    }
    else {
      unequal = 1;
      break;
    }
  }
  return unequal;
}

struct cmd {
  int type;
};

struct execcmd {
  int type;
  char *argv[MAXARGS];
  char *eargv[MAXARGS];
};

struct redircmd {
  int type;
  struct cmd *cmd;
  char *file;
  char *efile;
  int mode;
  int fd;
};

struct pipecmd {
  int type;
  struct cmd *left;
  struct cmd *right;
};

struct listcmd {
  int type;
  struct cmd *left;
  struct cmd *right;
};

struct backcmd {
  int type;
  struct cmd *cmd;
};

//waitpid() implementation
  int waitpid(int pid) {
  int wpid;
  while ((wpid = wait()) >= 0) {
    if (wpid == pid) {
      return wpid;
    }
  }
  return -1;
}

int fork1(void);  // Fork but panics on failure.
void panic(char*);
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
  int p[2];
  struct backcmd *bcmd;
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;
  
  if(cmd == 0)
    exit();

  switch(cmd->type){
  default:
    panic("runcmd");

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
      exit();
    char* placeholder1 = "hist";
    char* placeholder2 = "print";
    if(areEqual(ecmd->argv[0], placeholder1) == 0) { //checks if the cmd is a hist cmd
      if(ecmd->argv[1] == 0) { //no argument = failure
	printf(2, "exec %s failed\n", ecmd->argv[0]);
	break;
      }
      else if (areEqual(ecmd->argv[1], placeholder2) == 0) { //checks if the cmd is a hist print cmd
	printhist(); //prints hist 
      }
      else {
	runhist(atoi(ecmd->argv[1])); //runs hist
      }
    }
    else {
      exec(ecmd->argv[0], ecmd->argv);
      printf(2, "exec %s failed\n", ecmd->argv[0]);
    }
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd); //close the necessary fd
    if(open(rcmd->file, rcmd->mode) < 0){ //open the necessary file (will automatically fill empty fd)
      printf(2, "failed\n"); //if it didn't work for some reason (?)
      exit();
    }
    else {
      runcmd(rcmd->cmd); //run the command now that redirc has been set up
    }
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    if (fork1() == 0) { //in child
      runcmd(lcmd->left); //run the left function
    }
    wait(); //wait for execution completion (in parent)
    runcmd(lcmd->right); //then run the right
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd; //This struct has left and right
    pipe(p);

    if(fork1() == 0) {
      close(1); //Closes standard output
      dup(p[1]); //Duplicates write end of pipe, writing will send to pipe now
      close(p[0]);
      close(p[1]); //No longer necessary after duplication
      runcmd(pcmd -> left); //Command execution
    }
    //Same process as above but for standard input
    if(fork1() == 0) {
      close(0); 
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd -> right);
    }

    close(p[0]);
    close(p[1]);
    wait();
    wait();
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
      int pid = fork1();  //Declare and get the PID of the child process
      if(pid == 0) {
      runcmd(bcmd->cmd);  //Execute the background command in the child
       } else {
        //Parent process records the PID of the background process
       if (bg_count < MAX_BG_PROCS) {
      bg_pids[bg_count++] = pid;
    } else {
      printf(2, "Too many background processes\n");
    }
  }
  break;
    }
  exit();
  }

int
getcmd(char *buf, int nbuf)
{
  printf(2, "$ ");
  memset(buf, 0, nbuf);
  gets(buf, nbuf);
  if(buf[0] == 0) // EOF
    return -1;
  return 0;
}

int
main(void)
{
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      close(fd);
      break;
    }
  }
  int pid;

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    //If the command is background fork and execute asynchronously.
    if((pid = fork1()) == 0) {
      runcmd(parsecmd(buf));
    } else if (pid > 0) {
      //Parent process handles background processes
      addhist(buf);
      wait();  //Wait for the non background process to finish

      //Reap background processes
      for (int i = 0; i < bg_count; i++) {
        int bg_pid = bg_pids[i];
        int status = waitpid(bg_pid);
        if (status >= 0) {
          // Remove the reaped process from the list.
          for (int j = i; j < bg_count - 1; j++) {
            bg_pids[j] = bg_pids[j + 1];
          }
          bg_count--;
          i--;  //Adjust index in array
        }
      }
    }
  }
  exit();
}

void
panic(char *s)
{
  printf(2, "%s\n", s);
  exit();
}

int
fork1(void)
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
  return pid;
}

//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = EXEC;
  return (struct cmd*)cmd;
}

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
  cmd->cmd = subcmd;
  cmd->file = file;
  cmd->efile = efile;
  cmd->mode = mode;
  cmd->fd = fd;
  return (struct cmd*)cmd;
}

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = PIPE;
  cmd->left = left;
  cmd->right = right;
  return (struct cmd*)cmd;
}

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = LIST;
  cmd->left = left;
  cmd->right = right;
  return (struct cmd*)cmd;
}

struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = BACK;
  cmd->cmd = subcmd;
  return (struct cmd*)cmd;
}
//PAGEBREAK!
// Parsing

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
  char *s;
  int ret;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
  case '|':
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
    *eq = s;

  while(s < es && strchr(whitespace, *s))
    s++;
  *ps = s;
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
  char *s;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  *ps = s;
  return *s && strchr(toks, *s);
}

struct cmd *parseline(char**, char*);
struct cmd *parsepipe(char**, char*);
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
  cmd = parseline(&s, es);
  peek(&s, es, "");
  if(s != es){
    printf(2, "leftovers: %s\n", s);
    panic("syntax");
  }
  nulterminate(cmd);
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
  cmd = parseredirs(cmd, ps, es);
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
  int i;
  struct backcmd *bcmd;
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
    *rcmd->efile = 0;
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    nulterminate(pcmd->left);
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}

void addhist(char* newest) {
  if(!(newest[0] == 'h' && newest[1] == 'i' && newest[2] == 's' && newest[3] == 't' && newest[4])) { //checks if not hist (so it can add to history)
    for (int i = 9; i > 0; i--) {
      strcpy(commandhist[i], commandhist[i-1]); //shifts command history down
    }
    strcpy(commandhist[0], newest);
    commandhist[0][strlen(commandhist[0]) - 1] = 0; //save newest
  }
  else { //if command IS a hist, must check for complex (multiple) command
    int insert = 0;
    for (int i = 0; i < strlen(newest); i++) {
      if (newest[i] == ';' || newest[i] == '>' || newest[i] == '<' || newest[i] == '|') { //checks if there are compounded commands, if so, save to history
	insert = 1;
      }
    }
    if (insert) {
      for (int i = 9; i > 0; i--) {
	strcpy(commandhist[i], commandhist[i-1]);
      }
      strcpy(commandhist[0], newest);
      commandhist[0][strlen(commandhist[0]) - 1] = 0;
    }
  }
}

void printhist() {
  for (int i = 0; i < 10; i++) {
    printf(2, "Previous command %d: %s\n", i+1, commandhist[i]); //prints command history
  }
}

void runhist(int num) {
  if (num > 0 && num < 11) { //ensures number is within 10 command history
    if(fork1() == 0) {
      runcmd(parsecmd(commandhist[num - 1])); //runs corresponding command
    }
  }
  wait();
}
