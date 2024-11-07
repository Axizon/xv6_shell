
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	push   -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	56                   	push   %esi
       e:	53                   	push   %ebx
       f:	51                   	push   %ecx
      10:	83 ec 0c             	sub    $0xc,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      13:	eb 0c                	jmp    21 <main+0x21>
      15:	8d 76 00             	lea    0x0(%esi),%esi
    if(fd >= 3){
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f 1c 01 00 00    	jg     13d <main+0x13d>
  while((fd = open("console", O_RDWR)) >= 0){
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 18 17 00 00       	push   $0x1718
      2b:	e8 f3 11 00 00       	call   1223 <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
  printf(2, "$ ");
      37:	83 ec 08             	sub    $0x8,%esp
      3a:	68 68 16 00 00       	push   $0x1668
      3f:	6a 02                	push   $0x2
      41:	e8 fa 12 00 00       	call   1340 <printf>
  memset(buf, 0, nbuf);
      46:	83 c4 0c             	add    $0xc,%esp
      49:	6a 64                	push   $0x64
      4b:	6a 00                	push   $0x0
      4d:	68 e0 22 00 00       	push   $0x22e0
      52:	e8 09 10 00 00       	call   1060 <memset>
  gets(buf, nbuf);
      57:	58                   	pop    %eax
      58:	5a                   	pop    %edx
      59:	6a 64                	push   $0x64
      5b:	68 e0 22 00 00       	push   $0x22e0
      60:	e8 5b 10 00 00       	call   10c0 <gets>
  if(buf[0] == 0) // EOF
      65:	0f b6 05 e0 22 00 00 	movzbl 0x22e0,%eax
      6c:	83 c4 10             	add    $0x10,%esp
      6f:	84 c0                	test   %al,%al
      71:	0f 84 29 01 00 00    	je     1a0 <main+0x1a0>
  }
  int pid;

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      77:	3c 63                	cmp    $0x63,%al
      79:	75 0d                	jne    88 <main+0x88>
      7b:	80 3d e1 22 00 00 64 	cmpb   $0x64,0x22e1
      82:	0f 84 c6 00 00 00    	je     14e <main+0x14e>
int
fork1(void)
{
  int pid;

  pid = fork();
      88:	e8 4e 11 00 00       	call   11db <fork>
  if(pid == -1)
      8d:	83 f8 ff             	cmp    $0xffffffff,%eax
      90:	0f 84 0f 01 00 00    	je     1a5 <main+0x1a5>
    if((pid = fork1()) == 0) {
      96:	85 c0                	test   %eax,%eax
      98:	74 56                	je     f0 <main+0xf0>
    } else if (pid > 0) {
      9a:	7e 9b                	jle    37 <main+0x37>
      addhist(buf);
      9c:	83 ec 0c             	sub    $0xc,%esp
      9f:	68 e0 22 00 00       	push   $0x22e0
      a4:	e8 a7 0a 00 00       	call   b50 <addhist>
      wait();  //Wait for the non background process to finish
      a9:	e8 3d 11 00 00       	call   11eb <wait>
      for (int i = 0; i < bg_count; i++) {
      ae:	83 c4 10             	add    $0x10,%esp
      b1:	83 3d 88 22 00 00 00 	cmpl   $0x0,0x2288
      b8:	0f 8e 79 ff ff ff    	jle    37 <main+0x37>
      be:	31 f6                	xor    %esi,%esi
        int bg_pid = bg_pids[i];
      c0:	8b 1c b5 a0 22 00 00 	mov    0x22a0(,%esi,4),%ebx
  while ((wpid = wait()) >= 0) {
      c7:	eb 0b                	jmp    d4 <main+0xd4>
      c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if (wpid == pid) {
      d0:	39 c3                	cmp    %eax,%ebx
      d2:	74 34                	je     108 <main+0x108>
  while ((wpid = wait()) >= 0) {
      d4:	e8 12 11 00 00       	call   11eb <wait>
      d9:	85 c0                	test   %eax,%eax
      db:	79 f3                	jns    d0 <main+0xd0>
          for (int j = i; j < bg_count - 1; j++) {
      dd:	8b 15 88 22 00 00    	mov    0x2288,%edx
            bg_pids[j] = bg_pids[j + 1];
      e3:	83 c6 01             	add    $0x1,%esi
      for (int i = 0; i < bg_count; i++) {
      e6:	39 f2                	cmp    %esi,%edx
      e8:	7f d6                	jg     c0 <main+0xc0>
      ea:	e9 48 ff ff ff       	jmp    37 <main+0x37>
      ef:	90                   	nop
      runcmd(parsecmd(buf));
      f0:	83 ec 0c             	sub    $0xc,%esp
      f3:	68 e0 22 00 00       	push   $0x22e0
      f8:	e8 e3 09 00 00       	call   ae0 <parsecmd>
      fd:	89 04 24             	mov    %eax,(%esp)
     100:	e8 eb 0b 00 00       	call   cf0 <runcmd>
     105:	8d 76 00             	lea    0x0(%esi),%esi
          for (int j = i; j < bg_count - 1; j++) {
     108:	a1 88 22 00 00       	mov    0x2288,%eax
     10d:	8d 50 ff             	lea    -0x1(%eax),%edx
     110:	89 f0                	mov    %esi,%eax
     112:	39 f2                	cmp    %esi,%edx
     114:	7e 1f                	jle    135 <main+0x135>
     116:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     11d:	8d 76 00             	lea    0x0(%esi),%esi
            bg_pids[j] = bg_pids[j + 1];
     120:	83 c0 01             	add    $0x1,%eax
     123:	8b 0c 85 a0 22 00 00 	mov    0x22a0(,%eax,4),%ecx
     12a:	89 0c 85 9c 22 00 00 	mov    %ecx,0x229c(,%eax,4)
          for (int j = i; j < bg_count - 1; j++) {
     131:	39 d0                	cmp    %edx,%eax
     133:	75 eb                	jne    120 <main+0x120>
          bg_count--;
     135:	89 15 88 22 00 00    	mov    %edx,0x2288
          i--;  //Adjust index in array
     13b:	eb a9                	jmp    e6 <main+0xe6>
      close(fd);
     13d:	83 ec 0c             	sub    $0xc,%esp
     140:	50                   	push   %eax
     141:	e8 c5 10 00 00       	call   120b <close>
      break;
     146:	83 c4 10             	add    $0x10,%esp
     149:	e9 e9 fe ff ff       	jmp    37 <main+0x37>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     14e:	80 3d e2 22 00 00 20 	cmpb   $0x20,0x22e2
     155:	0f 85 2d ff ff ff    	jne    88 <main+0x88>
      buf[strlen(buf)-1] = 0;  // chop \n
     15b:	83 ec 0c             	sub    $0xc,%esp
     15e:	68 e0 22 00 00       	push   $0x22e0
     163:	e8 c8 0e 00 00       	call   1030 <strlen>
      if(chdir(buf+3) < 0)
     168:	c7 04 24 e3 22 00 00 	movl   $0x22e3,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
     16f:	c6 80 df 22 00 00 00 	movb   $0x0,0x22df(%eax)
      if(chdir(buf+3) < 0)
     176:	e8 d8 10 00 00       	call   1253 <chdir>
     17b:	83 c4 10             	add    $0x10,%esp
     17e:	85 c0                	test   %eax,%eax
     180:	0f 89 b1 fe ff ff    	jns    37 <main+0x37>
        printf(2, "cannot cd %s\n", buf+3);
     186:	51                   	push   %ecx
     187:	68 e3 22 00 00       	push   $0x22e3
     18c:	68 20 17 00 00       	push   $0x1720
     191:	6a 02                	push   $0x2
     193:	e8 a8 11 00 00       	call   1340 <printf>
     198:	83 c4 10             	add    $0x10,%esp
     19b:	e9 97 fe ff ff       	jmp    37 <main+0x37>
  exit();
     1a0:	e8 3e 10 00 00       	call   11e3 <exit>
    panic("fork");
     1a5:	83 ec 0c             	sub    $0xc,%esp
     1a8:	68 6b 16 00 00       	push   $0x166b
     1ad:	e8 ce 00 00 00       	call   280 <panic>
     1b2:	66 90                	xchg   %ax,%ax
     1b4:	66 90                	xchg   %ax,%ax
     1b6:	66 90                	xchg   %ax,%ax
     1b8:	66 90                	xchg   %ax,%ax
     1ba:	66 90                	xchg   %ax,%ax
     1bc:	66 90                	xchg   %ax,%ax
     1be:	66 90                	xchg   %ax,%ax

000001c0 <areEqual>:
int areEqual(char *x, char* y) { //checks strings instead of pointers
     1c0:	55                   	push   %ebp
  while (*x != '\0' || *y != '\0') {
     1c1:	31 c0                	xor    %eax,%eax
int areEqual(char *x, char* y) { //checks strings instead of pointers
     1c3:	89 e5                	mov    %esp,%ebp
     1c5:	56                   	push   %esi
     1c6:	53                   	push   %ebx
     1c7:	8b 75 08             	mov    0x8(%ebp),%esi
     1ca:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     1cd:	8d 76 00             	lea    0x0(%esi),%esi
  while (*x != '\0' || *y != '\0') {
     1d0:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
    if (*x == *y) {
     1d4:	0f b6 0c 03          	movzbl (%ebx,%eax,1),%ecx
  while (*x != '\0' || *y != '\0') {
     1d8:	84 d2                	test   %dl,%dl
     1da:	75 14                	jne    1f0 <areEqual+0x30>
     1dc:	31 c0                	xor    %eax,%eax
     1de:	84 c9                	test   %cl,%cl
     1e0:	0f 95 c0             	setne  %al
}
     1e3:	5b                   	pop    %ebx
     1e4:	5e                   	pop    %esi
     1e5:	5d                   	pop    %ebp
     1e6:	c3                   	ret
     1e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1ee:	66 90                	xchg   %ax,%ax
    if (*x == *y) {
     1f0:	83 c0 01             	add    $0x1,%eax
     1f3:	38 ca                	cmp    %cl,%dl
     1f5:	74 d9                	je     1d0 <areEqual+0x10>
      unequal = 1;
     1f7:	b8 01 00 00 00       	mov    $0x1,%eax
  return unequal;
     1fc:	eb e5                	jmp    1e3 <areEqual+0x23>
     1fe:	66 90                	xchg   %ax,%ax

00000200 <waitpid>:
  int waitpid(int pid) {
     200:	55                   	push   %ebp
     201:	89 e5                	mov    %esp,%ebp
     203:	53                   	push   %ebx
     204:	83 ec 04             	sub    $0x4,%esp
     207:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while ((wpid = wait()) >= 0) {
     20a:	eb 08                	jmp    214 <waitpid+0x14>
     20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (wpid == pid) {
     210:	39 d8                	cmp    %ebx,%eax
     212:	74 1c                	je     230 <waitpid+0x30>
  while ((wpid = wait()) >= 0) {
     214:	e8 d2 0f 00 00       	call   11eb <wait>
     219:	85 c0                	test   %eax,%eax
     21b:	79 f3                	jns    210 <waitpid+0x10>
}
     21d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  return -1;
     220:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
     225:	c9                   	leave
     226:	c3                   	ret
     227:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     22e:	66 90                	xchg   %ax,%ax
     230:	89 d8                	mov    %ebx,%eax
     232:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     235:	c9                   	leave
     236:	c3                   	ret
     237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     23e:	66 90                	xchg   %ax,%ax

00000240 <getcmd>:
{
     240:	55                   	push   %ebp
     241:	89 e5                	mov    %esp,%ebp
     243:	56                   	push   %esi
     244:	53                   	push   %ebx
     245:	8b 5d 08             	mov    0x8(%ebp),%ebx
     248:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     24b:	83 ec 08             	sub    $0x8,%esp
     24e:	68 68 16 00 00       	push   $0x1668
     253:	6a 02                	push   $0x2
     255:	e8 e6 10 00 00       	call   1340 <printf>
  memset(buf, 0, nbuf);
     25a:	83 c4 0c             	add    $0xc,%esp
     25d:	56                   	push   %esi
     25e:	6a 00                	push   $0x0
     260:	53                   	push   %ebx
     261:	e8 fa 0d 00 00       	call   1060 <memset>
  gets(buf, nbuf);
     266:	58                   	pop    %eax
     267:	5a                   	pop    %edx
     268:	56                   	push   %esi
     269:	53                   	push   %ebx
     26a:	e8 51 0e 00 00       	call   10c0 <gets>
  if(buf[0] == 0) // EOF
     26f:	83 c4 10             	add    $0x10,%esp
     272:	80 3b 01             	cmpb   $0x1,(%ebx)
     275:	19 c0                	sbb    %eax,%eax
}
     277:	8d 65 f8             	lea    -0x8(%ebp),%esp
     27a:	5b                   	pop    %ebx
     27b:	5e                   	pop    %esi
     27c:	5d                   	pop    %ebp
     27d:	c3                   	ret
     27e:	66 90                	xchg   %ax,%ax

00000280 <panic>:
{
     280:	55                   	push   %ebp
     281:	89 e5                	mov    %esp,%ebp
     283:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     286:	ff 75 08             	push   0x8(%ebp)
     289:	68 f2 16 00 00       	push   $0x16f2
     28e:	6a 02                	push   $0x2
     290:	e8 ab 10 00 00       	call   1340 <printf>
  exit();
     295:	e8 49 0f 00 00       	call   11e3 <exit>
     29a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002a0 <fork1>:
{
     2a0:	55                   	push   %ebp
     2a1:	89 e5                	mov    %esp,%ebp
     2a3:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     2a6:	e8 30 0f 00 00       	call   11db <fork>
  if(pid == -1)
     2ab:	83 f8 ff             	cmp    $0xffffffff,%eax
     2ae:	74 02                	je     2b2 <fork1+0x12>
  return pid;
}
     2b0:	c9                   	leave
     2b1:	c3                   	ret
    panic("fork");
     2b2:	83 ec 0c             	sub    $0xc,%esp
     2b5:	68 6b 16 00 00       	push   $0x166b
     2ba:	e8 c1 ff ff ff       	call   280 <panic>
     2bf:	90                   	nop

000002c0 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     2c0:	55                   	push   %ebp
     2c1:	89 e5                	mov    %esp,%ebp
     2c3:	53                   	push   %ebx
     2c4:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     2c7:	6a 54                	push   $0x54
     2c9:	e8 b2 12 00 00       	call   1580 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     2ce:	83 c4 0c             	add    $0xc,%esp
     2d1:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
     2d3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     2d5:	6a 00                	push   $0x0
     2d7:	50                   	push   %eax
     2d8:	e8 83 0d 00 00       	call   1060 <memset>
  cmd->type = EXEC;
     2dd:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     2e3:	89 d8                	mov    %ebx,%eax
     2e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     2e8:	c9                   	leave
     2e9:	c3                   	ret
     2ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002f0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     2f0:	55                   	push   %ebp
     2f1:	89 e5                	mov    %esp,%ebp
     2f3:	53                   	push   %ebx
     2f4:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     2f7:	6a 18                	push   $0x18
     2f9:	e8 82 12 00 00       	call   1580 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     2fe:	83 c4 0c             	add    $0xc,%esp
     301:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     303:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     305:	6a 00                	push   $0x0
     307:	50                   	push   %eax
     308:	e8 53 0d 00 00       	call   1060 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     30d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     310:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     316:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     319:	8b 45 0c             	mov    0xc(%ebp),%eax
     31c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     31f:	8b 45 10             	mov    0x10(%ebp),%eax
     322:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     325:	8b 45 14             	mov    0x14(%ebp),%eax
     328:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     32b:	8b 45 18             	mov    0x18(%ebp),%eax
     32e:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     331:	89 d8                	mov    %ebx,%eax
     333:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     336:	c9                   	leave
     337:	c3                   	ret
     338:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     33f:	90                   	nop

00000340 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     340:	55                   	push   %ebp
     341:	89 e5                	mov    %esp,%ebp
     343:	53                   	push   %ebx
     344:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     347:	6a 0c                	push   $0xc
     349:	e8 32 12 00 00       	call   1580 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     34e:	83 c4 0c             	add    $0xc,%esp
     351:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     353:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     355:	6a 00                	push   $0x0
     357:	50                   	push   %eax
     358:	e8 03 0d 00 00       	call   1060 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     35d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     360:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     366:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     369:	8b 45 0c             	mov    0xc(%ebp),%eax
     36c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     36f:	89 d8                	mov    %ebx,%eax
     371:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     374:	c9                   	leave
     375:	c3                   	ret
     376:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     37d:	8d 76 00             	lea    0x0(%esi),%esi

00000380 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     380:	55                   	push   %ebp
     381:	89 e5                	mov    %esp,%ebp
     383:	53                   	push   %ebx
     384:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     387:	6a 0c                	push   $0xc
     389:	e8 f2 11 00 00       	call   1580 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     38e:	83 c4 0c             	add    $0xc,%esp
     391:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     393:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     395:	6a 00                	push   $0x0
     397:	50                   	push   %eax
     398:	e8 c3 0c 00 00       	call   1060 <memset>
  cmd->type = LIST;
  cmd->left = left;
     39d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     3a0:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     3a6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     3a9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3ac:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     3af:	89 d8                	mov    %ebx,%eax
     3b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3b4:	c9                   	leave
     3b5:	c3                   	ret
     3b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3bd:	8d 76 00             	lea    0x0(%esi),%esi

000003c0 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     3c0:	55                   	push   %ebp
     3c1:	89 e5                	mov    %esp,%ebp
     3c3:	53                   	push   %ebx
     3c4:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3c7:	6a 08                	push   $0x8
     3c9:	e8 b2 11 00 00       	call   1580 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3ce:	83 c4 0c             	add    $0xc,%esp
     3d1:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
     3d3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3d5:	6a 00                	push   $0x0
     3d7:	50                   	push   %eax
     3d8:	e8 83 0c 00 00       	call   1060 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     3dd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     3e0:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     3e6:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     3e9:	89 d8                	mov    %ebx,%eax
     3eb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3ee:	c9                   	leave
     3ef:	c3                   	ret

000003f0 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     3f0:	55                   	push   %ebp
     3f1:	89 e5                	mov    %esp,%ebp
     3f3:	57                   	push   %edi
     3f4:	56                   	push   %esi
     3f5:	53                   	push   %ebx
     3f6:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     3f9:	8b 45 08             	mov    0x8(%ebp),%eax
{
     3fc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     3ff:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
     402:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     404:	39 df                	cmp    %ebx,%edi
     406:	72 0f                	jb     417 <gettoken+0x27>
     408:	eb 25                	jmp    42f <gettoken+0x3f>
     40a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     410:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     413:	39 fb                	cmp    %edi,%ebx
     415:	74 18                	je     42f <gettoken+0x3f>
     417:	0f be 07             	movsbl (%edi),%eax
     41a:	83 ec 08             	sub    $0x8,%esp
     41d:	50                   	push   %eax
     41e:	68 84 1e 00 00       	push   $0x1e84
     423:	e8 58 0c 00 00       	call   1080 <strchr>
     428:	83 c4 10             	add    $0x10,%esp
     42b:	85 c0                	test   %eax,%eax
     42d:	75 e1                	jne    410 <gettoken+0x20>
  if(q)
     42f:	85 f6                	test   %esi,%esi
     431:	74 02                	je     435 <gettoken+0x45>
    *q = s;
     433:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     435:	0f b6 07             	movzbl (%edi),%eax
  switch(*s){
     438:	3c 3c                	cmp    $0x3c,%al
     43a:	0f 8f d0 00 00 00    	jg     510 <gettoken+0x120>
     440:	3c 3a                	cmp    $0x3a,%al
     442:	0f 8f bc 00 00 00    	jg     504 <gettoken+0x114>
     448:	84 c0                	test   %al,%al
     44a:	75 44                	jne    490 <gettoken+0xa0>
     44c:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     44e:	8b 4d 14             	mov    0x14(%ebp),%ecx
     451:	85 c9                	test   %ecx,%ecx
     453:	74 05                	je     45a <gettoken+0x6a>
    *eq = s;
     455:	8b 45 14             	mov    0x14(%ebp),%eax
     458:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     45a:	39 df                	cmp    %ebx,%edi
     45c:	72 09                	jb     467 <gettoken+0x77>
     45e:	eb 1f                	jmp    47f <gettoken+0x8f>
    s++;
     460:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     463:	39 fb                	cmp    %edi,%ebx
     465:	74 18                	je     47f <gettoken+0x8f>
     467:	0f be 07             	movsbl (%edi),%eax
     46a:	83 ec 08             	sub    $0x8,%esp
     46d:	50                   	push   %eax
     46e:	68 84 1e 00 00       	push   $0x1e84
     473:	e8 08 0c 00 00       	call   1080 <strchr>
     478:	83 c4 10             	add    $0x10,%esp
     47b:	85 c0                	test   %eax,%eax
     47d:	75 e1                	jne    460 <gettoken+0x70>
  *ps = s;
     47f:	8b 45 08             	mov    0x8(%ebp),%eax
     482:	89 38                	mov    %edi,(%eax)
  return ret;
}
     484:	8d 65 f4             	lea    -0xc(%ebp),%esp
     487:	89 f0                	mov    %esi,%eax
     489:	5b                   	pop    %ebx
     48a:	5e                   	pop    %esi
     48b:	5f                   	pop    %edi
     48c:	5d                   	pop    %ebp
     48d:	c3                   	ret
     48e:	66 90                	xchg   %ax,%ax
  switch(*s){
     490:	79 66                	jns    4f8 <gettoken+0x108>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     492:	39 df                	cmp    %ebx,%edi
     494:	72 39                	jb     4cf <gettoken+0xdf>
  if(eq)
     496:	8b 55 14             	mov    0x14(%ebp),%edx
     499:	85 d2                	test   %edx,%edx
     49b:	0f 84 b3 00 00 00    	je     554 <gettoken+0x164>
    *eq = s;
     4a1:	8b 45 14             	mov    0x14(%ebp),%eax
     4a4:	89 38                	mov    %edi,(%eax)
  while(s < es && strchr(whitespace, *s))
     4a6:	e9 a9 00 00 00       	jmp    554 <gettoken+0x164>
     4ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     4af:	90                   	nop
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     4b0:	0f be 07             	movsbl (%edi),%eax
     4b3:	83 ec 08             	sub    $0x8,%esp
     4b6:	50                   	push   %eax
     4b7:	68 7c 1e 00 00       	push   $0x1e7c
     4bc:	e8 bf 0b 00 00       	call   1080 <strchr>
     4c1:	83 c4 10             	add    $0x10,%esp
     4c4:	85 c0                	test   %eax,%eax
     4c6:	75 1f                	jne    4e7 <gettoken+0xf7>
      s++;
     4c8:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     4cb:	39 fb                	cmp    %edi,%ebx
     4cd:	74 77                	je     546 <gettoken+0x156>
     4cf:	0f be 07             	movsbl (%edi),%eax
     4d2:	83 ec 08             	sub    $0x8,%esp
     4d5:	50                   	push   %eax
     4d6:	68 84 1e 00 00       	push   $0x1e84
     4db:	e8 a0 0b 00 00       	call   1080 <strchr>
     4e0:	83 c4 10             	add    $0x10,%esp
     4e3:	85 c0                	test   %eax,%eax
     4e5:	74 c9                	je     4b0 <gettoken+0xc0>
    ret = 'a';
     4e7:	be 61 00 00 00       	mov    $0x61,%esi
     4ec:	e9 5d ff ff ff       	jmp    44e <gettoken+0x5e>
     4f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     4f8:	3c 26                	cmp    $0x26,%al
     4fa:	74 08                	je     504 <gettoken+0x114>
     4fc:	8d 48 d8             	lea    -0x28(%eax),%ecx
     4ff:	80 f9 01             	cmp    $0x1,%cl
     502:	77 8e                	ja     492 <gettoken+0xa2>
  ret = *s;
     504:	0f be f0             	movsbl %al,%esi
    s++;
     507:	83 c7 01             	add    $0x1,%edi
    break;
     50a:	e9 3f ff ff ff       	jmp    44e <gettoken+0x5e>
     50f:	90                   	nop
  switch(*s){
     510:	3c 3e                	cmp    $0x3e,%al
     512:	75 1c                	jne    530 <gettoken+0x140>
    if(*s == '>'){
     514:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     518:	74 1f                	je     539 <gettoken+0x149>
    s++;
     51a:	83 c7 01             	add    $0x1,%edi
  ret = *s;
     51d:	be 3e 00 00 00       	mov    $0x3e,%esi
     522:	e9 27 ff ff ff       	jmp    44e <gettoken+0x5e>
     527:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     52e:	66 90                	xchg   %ax,%ax
  switch(*s){
     530:	3c 7c                	cmp    $0x7c,%al
     532:	74 d0                	je     504 <gettoken+0x114>
     534:	e9 59 ff ff ff       	jmp    492 <gettoken+0xa2>
      s++;
     539:	83 c7 02             	add    $0x2,%edi
      ret = '+';
     53c:	be 2b 00 00 00       	mov    $0x2b,%esi
     541:	e9 08 ff ff ff       	jmp    44e <gettoken+0x5e>
  if(eq)
     546:	8b 45 14             	mov    0x14(%ebp),%eax
     549:	85 c0                	test   %eax,%eax
     54b:	74 05                	je     552 <gettoken+0x162>
    *eq = s;
     54d:	8b 45 14             	mov    0x14(%ebp),%eax
     550:	89 18                	mov    %ebx,(%eax)
      s++;
     552:	89 df                	mov    %ebx,%edi
    ret = 'a';
     554:	be 61 00 00 00       	mov    $0x61,%esi
     559:	e9 21 ff ff ff       	jmp    47f <gettoken+0x8f>
     55e:	66 90                	xchg   %ax,%ax

00000560 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     560:	55                   	push   %ebp
     561:	89 e5                	mov    %esp,%ebp
     563:	57                   	push   %edi
     564:	56                   	push   %esi
     565:	53                   	push   %ebx
     566:	83 ec 0c             	sub    $0xc,%esp
     569:	8b 7d 08             	mov    0x8(%ebp),%edi
     56c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     56f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     571:	39 f3                	cmp    %esi,%ebx
     573:	72 12                	jb     587 <peek+0x27>
     575:	eb 28                	jmp    59f <peek+0x3f>
     577:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     57e:	66 90                	xchg   %ax,%ax
    s++;
     580:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     583:	39 de                	cmp    %ebx,%esi
     585:	74 18                	je     59f <peek+0x3f>
     587:	0f be 03             	movsbl (%ebx),%eax
     58a:	83 ec 08             	sub    $0x8,%esp
     58d:	50                   	push   %eax
     58e:	68 84 1e 00 00       	push   $0x1e84
     593:	e8 e8 0a 00 00       	call   1080 <strchr>
     598:	83 c4 10             	add    $0x10,%esp
     59b:	85 c0                	test   %eax,%eax
     59d:	75 e1                	jne    580 <peek+0x20>
  *ps = s;
     59f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     5a1:	0f be 03             	movsbl (%ebx),%eax
     5a4:	31 d2                	xor    %edx,%edx
     5a6:	84 c0                	test   %al,%al
     5a8:	75 0e                	jne    5b8 <peek+0x58>
}
     5aa:	8d 65 f4             	lea    -0xc(%ebp),%esp
     5ad:	89 d0                	mov    %edx,%eax
     5af:	5b                   	pop    %ebx
     5b0:	5e                   	pop    %esi
     5b1:	5f                   	pop    %edi
     5b2:	5d                   	pop    %ebp
     5b3:	c3                   	ret
     5b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
     5b8:	83 ec 08             	sub    $0x8,%esp
     5bb:	50                   	push   %eax
     5bc:	ff 75 10             	push   0x10(%ebp)
     5bf:	e8 bc 0a 00 00       	call   1080 <strchr>
     5c4:	83 c4 10             	add    $0x10,%esp
     5c7:	31 d2                	xor    %edx,%edx
     5c9:	85 c0                	test   %eax,%eax
     5cb:	0f 95 c2             	setne  %dl
}
     5ce:	8d 65 f4             	lea    -0xc(%ebp),%esp
     5d1:	5b                   	pop    %ebx
     5d2:	89 d0                	mov    %edx,%eax
     5d4:	5e                   	pop    %esi
     5d5:	5f                   	pop    %edi
     5d6:	5d                   	pop    %ebp
     5d7:	c3                   	ret
     5d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5df:	90                   	nop

000005e0 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     5e0:	55                   	push   %ebp
     5e1:	89 e5                	mov    %esp,%ebp
     5e3:	57                   	push   %edi
     5e4:	56                   	push   %esi
     5e5:	53                   	push   %ebx
     5e6:	83 ec 2c             	sub    $0x2c,%esp
     5e9:	8b 75 0c             	mov    0xc(%ebp),%esi
     5ec:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     5ef:	90                   	nop
     5f0:	83 ec 04             	sub    $0x4,%esp
     5f3:	68 8d 16 00 00       	push   $0x168d
     5f8:	53                   	push   %ebx
     5f9:	56                   	push   %esi
     5fa:	e8 61 ff ff ff       	call   560 <peek>
     5ff:	83 c4 10             	add    $0x10,%esp
     602:	85 c0                	test   %eax,%eax
     604:	0f 84 f6 00 00 00    	je     700 <parseredirs+0x120>
    tok = gettoken(ps, es, 0, 0);
     60a:	6a 00                	push   $0x0
     60c:	6a 00                	push   $0x0
     60e:	53                   	push   %ebx
     60f:	56                   	push   %esi
     610:	e8 db fd ff ff       	call   3f0 <gettoken>
     615:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     617:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     61a:	50                   	push   %eax
     61b:	8d 45 e0             	lea    -0x20(%ebp),%eax
     61e:	50                   	push   %eax
     61f:	53                   	push   %ebx
     620:	56                   	push   %esi
     621:	e8 ca fd ff ff       	call   3f0 <gettoken>
     626:	83 c4 20             	add    $0x20,%esp
     629:	83 f8 61             	cmp    $0x61,%eax
     62c:	0f 85 d9 00 00 00    	jne    70b <parseredirs+0x12b>
      panic("missing file for redirection");
    switch(tok){
     632:	83 ff 3c             	cmp    $0x3c,%edi
     635:	74 69                	je     6a0 <parseredirs+0xc0>
     637:	83 ff 3e             	cmp    $0x3e,%edi
     63a:	74 05                	je     641 <parseredirs+0x61>
     63c:	83 ff 2b             	cmp    $0x2b,%edi
     63f:	75 af                	jne    5f0 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     641:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     644:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     647:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     64a:	89 55 d0             	mov    %edx,-0x30(%ebp)
     64d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     650:	6a 18                	push   $0x18
     652:	e8 29 0f 00 00       	call   1580 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     657:	83 c4 0c             	add    $0xc,%esp
     65a:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     65c:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     65e:	6a 00                	push   $0x0
     660:	50                   	push   %eax
     661:	e8 fa 09 00 00       	call   1060 <memset>
  cmd->type = REDIR;
     666:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     66c:	8b 45 08             	mov    0x8(%ebp),%eax
      break;
     66f:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     672:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     675:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     678:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     67b:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->mode = mode;
     67e:	c7 47 10 01 02 00 00 	movl   $0x201,0x10(%edi)
  cmd->efile = efile;
     685:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->fd = fd;
     688:	c7 47 14 01 00 00 00 	movl   $0x1,0x14(%edi)
      break;
     68f:	89 7d 08             	mov    %edi,0x8(%ebp)
     692:	e9 59 ff ff ff       	jmp    5f0 <parseredirs+0x10>
     697:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     69e:	66 90                	xchg   %ax,%ax
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     6a0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     6a3:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     6a6:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     6a9:	89 55 d0             	mov    %edx,-0x30(%ebp)
     6ac:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     6af:	6a 18                	push   $0x18
     6b1:	e8 ca 0e 00 00       	call   1580 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     6b6:	83 c4 0c             	add    $0xc,%esp
     6b9:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     6bb:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     6bd:	6a 00                	push   $0x0
     6bf:	50                   	push   %eax
     6c0:	e8 9b 09 00 00       	call   1060 <memset>
  cmd->cmd = subcmd;
     6c5:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->file = file;
     6c8:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      break;
     6cb:	89 7d 08             	mov    %edi,0x8(%ebp)
  cmd->efile = efile;
     6ce:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->type = REDIR;
     6d1:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
      break;
     6d7:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     6da:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     6dd:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     6e0:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->mode = mode;
     6e3:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
  cmd->fd = fd;
     6ea:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
      break;
     6f1:	e9 fa fe ff ff       	jmp    5f0 <parseredirs+0x10>
     6f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     6fd:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
  return cmd;
}
     700:	8b 45 08             	mov    0x8(%ebp),%eax
     703:	8d 65 f4             	lea    -0xc(%ebp),%esp
     706:	5b                   	pop    %ebx
     707:	5e                   	pop    %esi
     708:	5f                   	pop    %edi
     709:	5d                   	pop    %ebp
     70a:	c3                   	ret
      panic("missing file for redirection");
     70b:	83 ec 0c             	sub    $0xc,%esp
     70e:	68 70 16 00 00       	push   $0x1670
     713:	e8 68 fb ff ff       	call   280 <panic>
     718:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     71f:	90                   	nop

00000720 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     720:	55                   	push   %ebp
     721:	89 e5                	mov    %esp,%ebp
     723:	57                   	push   %edi
     724:	56                   	push   %esi
     725:	53                   	push   %ebx
     726:	83 ec 30             	sub    $0x30,%esp
     729:	8b 5d 08             	mov    0x8(%ebp),%ebx
     72c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     72f:	68 90 16 00 00       	push   $0x1690
     734:	56                   	push   %esi
     735:	53                   	push   %ebx
     736:	e8 25 fe ff ff       	call   560 <peek>
     73b:	83 c4 10             	add    $0x10,%esp
     73e:	85 c0                	test   %eax,%eax
     740:	0f 85 aa 00 00 00    	jne    7f0 <parseexec+0xd0>
  cmd = malloc(sizeof(*cmd));
     746:	83 ec 0c             	sub    $0xc,%esp
     749:	89 c7                	mov    %eax,%edi
     74b:	6a 54                	push   $0x54
     74d:	e8 2e 0e 00 00       	call   1580 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     752:	83 c4 0c             	add    $0xc,%esp
     755:	6a 54                	push   $0x54
     757:	6a 00                	push   $0x0
     759:	89 45 d0             	mov    %eax,-0x30(%ebp)
     75c:	50                   	push   %eax
     75d:	e8 fe 08 00 00       	call   1060 <memset>
  cmd->type = EXEC;
     762:	8b 45 d0             	mov    -0x30(%ebp),%eax

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     765:	83 c4 0c             	add    $0xc,%esp
  cmd->type = EXEC;
     768:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  ret = parseredirs(ret, ps, es);
     76e:	56                   	push   %esi
     76f:	53                   	push   %ebx
     770:	50                   	push   %eax
     771:	e8 6a fe ff ff       	call   5e0 <parseredirs>
  while(!peek(ps, es, "|)&;")){
     776:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
     779:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     77c:	eb 15                	jmp    793 <parseexec+0x73>
     77e:	66 90                	xchg   %ax,%ax
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     780:	83 ec 04             	sub    $0x4,%esp
     783:	56                   	push   %esi
     784:	53                   	push   %ebx
     785:	ff 75 d4             	push   -0x2c(%ebp)
     788:	e8 53 fe ff ff       	call   5e0 <parseredirs>
     78d:	83 c4 10             	add    $0x10,%esp
     790:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     793:	83 ec 04             	sub    $0x4,%esp
     796:	68 a7 16 00 00       	push   $0x16a7
     79b:	56                   	push   %esi
     79c:	53                   	push   %ebx
     79d:	e8 be fd ff ff       	call   560 <peek>
     7a2:	83 c4 10             	add    $0x10,%esp
     7a5:	85 c0                	test   %eax,%eax
     7a7:	75 5f                	jne    808 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     7a9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     7ac:	50                   	push   %eax
     7ad:	8d 45 e0             	lea    -0x20(%ebp),%eax
     7b0:	50                   	push   %eax
     7b1:	56                   	push   %esi
     7b2:	53                   	push   %ebx
     7b3:	e8 38 fc ff ff       	call   3f0 <gettoken>
     7b8:	83 c4 10             	add    $0x10,%esp
     7bb:	85 c0                	test   %eax,%eax
     7bd:	74 49                	je     808 <parseexec+0xe8>
    if(tok != 'a')
     7bf:	83 f8 61             	cmp    $0x61,%eax
     7c2:	75 62                	jne    826 <parseexec+0x106>
    cmd->argv[argc] = q;
     7c4:	8b 45 e0             	mov    -0x20(%ebp),%eax
     7c7:	8b 55 d0             	mov    -0x30(%ebp),%edx
     7ca:	89 44 ba 04          	mov    %eax,0x4(%edx,%edi,4)
    cmd->eargv[argc] = eq;
     7ce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     7d1:	89 44 ba 2c          	mov    %eax,0x2c(%edx,%edi,4)
    argc++;
     7d5:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARGS)
     7d8:	83 ff 0a             	cmp    $0xa,%edi
     7db:	75 a3                	jne    780 <parseexec+0x60>
      panic("too many args");
     7dd:	83 ec 0c             	sub    $0xc,%esp
     7e0:	68 99 16 00 00       	push   $0x1699
     7e5:	e8 96 fa ff ff       	call   280 <panic>
     7ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     7f0:	89 75 0c             	mov    %esi,0xc(%ebp)
     7f3:	89 5d 08             	mov    %ebx,0x8(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     7f6:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7f9:	5b                   	pop    %ebx
     7fa:	5e                   	pop    %esi
     7fb:	5f                   	pop    %edi
     7fc:	5d                   	pop    %ebp
    return parseblock(ps, es);
     7fd:	e9 ae 01 00 00       	jmp    9b0 <parseblock>
     802:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  cmd->argv[argc] = 0;
     808:	8b 45 d0             	mov    -0x30(%ebp),%eax
     80b:	c7 44 b8 04 00 00 00 	movl   $0x0,0x4(%eax,%edi,4)
     812:	00 
  cmd->eargv[argc] = 0;
     813:	c7 44 b8 2c 00 00 00 	movl   $0x0,0x2c(%eax,%edi,4)
     81a:	00 
}
     81b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     81e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     821:	5b                   	pop    %ebx
     822:	5e                   	pop    %esi
     823:	5f                   	pop    %edi
     824:	5d                   	pop    %ebp
     825:	c3                   	ret
      panic("syntax");
     826:	83 ec 0c             	sub    $0xc,%esp
     829:	68 92 16 00 00       	push   $0x1692
     82e:	e8 4d fa ff ff       	call   280 <panic>
     833:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     83a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000840 <parsepipe>:
{
     840:	55                   	push   %ebp
     841:	89 e5                	mov    %esp,%ebp
     843:	57                   	push   %edi
     844:	56                   	push   %esi
     845:	53                   	push   %ebx
     846:	83 ec 14             	sub    $0x14,%esp
     849:	8b 75 08             	mov    0x8(%ebp),%esi
     84c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     84f:	57                   	push   %edi
     850:	56                   	push   %esi
     851:	e8 ca fe ff ff       	call   720 <parseexec>
  if(peek(ps, es, "|")){
     856:	83 c4 0c             	add    $0xc,%esp
     859:	68 ac 16 00 00       	push   $0x16ac
  cmd = parseexec(ps, es);
     85e:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     860:	57                   	push   %edi
     861:	56                   	push   %esi
     862:	e8 f9 fc ff ff       	call   560 <peek>
     867:	83 c4 10             	add    $0x10,%esp
     86a:	85 c0                	test   %eax,%eax
     86c:	75 12                	jne    880 <parsepipe+0x40>
}
     86e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     871:	89 d8                	mov    %ebx,%eax
     873:	5b                   	pop    %ebx
     874:	5e                   	pop    %esi
     875:	5f                   	pop    %edi
     876:	5d                   	pop    %ebp
     877:	c3                   	ret
     878:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     87f:	90                   	nop
    gettoken(ps, es, 0, 0);
     880:	6a 00                	push   $0x0
     882:	6a 00                	push   $0x0
     884:	57                   	push   %edi
     885:	56                   	push   %esi
     886:	e8 65 fb ff ff       	call   3f0 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     88b:	58                   	pop    %eax
     88c:	5a                   	pop    %edx
     88d:	57                   	push   %edi
     88e:	56                   	push   %esi
     88f:	e8 ac ff ff ff       	call   840 <parsepipe>
  cmd = malloc(sizeof(*cmd));
     894:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = pipecmd(cmd, parsepipe(ps, es));
     89b:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     89d:	e8 de 0c 00 00       	call   1580 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     8a2:	83 c4 0c             	add    $0xc,%esp
     8a5:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     8a7:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     8a9:	6a 00                	push   $0x0
     8ab:	50                   	push   %eax
     8ac:	e8 af 07 00 00       	call   1060 <memset>
  cmd->left = left;
     8b1:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     8b4:	83 c4 10             	add    $0x10,%esp
     8b7:	89 f3                	mov    %esi,%ebx
  cmd->type = PIPE;
     8b9:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
}
     8bf:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     8c1:	89 7e 08             	mov    %edi,0x8(%esi)
}
     8c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8c7:	5b                   	pop    %ebx
     8c8:	5e                   	pop    %esi
     8c9:	5f                   	pop    %edi
     8ca:	5d                   	pop    %ebp
     8cb:	c3                   	ret
     8cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008d0 <parseline>:
{
     8d0:	55                   	push   %ebp
     8d1:	89 e5                	mov    %esp,%ebp
     8d3:	57                   	push   %edi
     8d4:	56                   	push   %esi
     8d5:	53                   	push   %ebx
     8d6:	83 ec 24             	sub    $0x24,%esp
     8d9:	8b 75 08             	mov    0x8(%ebp),%esi
     8dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     8df:	57                   	push   %edi
     8e0:	56                   	push   %esi
     8e1:	e8 5a ff ff ff       	call   840 <parsepipe>
  while(peek(ps, es, "&")){
     8e6:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     8e9:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     8eb:	eb 3b                	jmp    928 <parseline+0x58>
     8ed:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     8f0:	6a 00                	push   $0x0
     8f2:	6a 00                	push   $0x0
     8f4:	57                   	push   %edi
     8f5:	56                   	push   %esi
     8f6:	e8 f5 fa ff ff       	call   3f0 <gettoken>
  cmd = malloc(sizeof(*cmd));
     8fb:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     902:	e8 79 0c 00 00       	call   1580 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     907:	83 c4 0c             	add    $0xc,%esp
     90a:	6a 08                	push   $0x8
     90c:	6a 00                	push   $0x0
     90e:	50                   	push   %eax
     90f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     912:	e8 49 07 00 00       	call   1060 <memset>
  cmd->type = BACK;
     917:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  cmd->cmd = subcmd;
     91a:	83 c4 10             	add    $0x10,%esp
  cmd->type = BACK;
     91d:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
  cmd->cmd = subcmd;
     923:	89 5a 04             	mov    %ebx,0x4(%edx)
     926:	89 d3                	mov    %edx,%ebx
  while(peek(ps, es, "&")){
     928:	83 ec 04             	sub    $0x4,%esp
     92b:	68 ae 16 00 00       	push   $0x16ae
     930:	57                   	push   %edi
     931:	56                   	push   %esi
     932:	e8 29 fc ff ff       	call   560 <peek>
     937:	83 c4 10             	add    $0x10,%esp
     93a:	85 c0                	test   %eax,%eax
     93c:	75 b2                	jne    8f0 <parseline+0x20>
  if(peek(ps, es, ";")){
     93e:	83 ec 04             	sub    $0x4,%esp
     941:	68 aa 16 00 00       	push   $0x16aa
     946:	57                   	push   %edi
     947:	56                   	push   %esi
     948:	e8 13 fc ff ff       	call   560 <peek>
     94d:	83 c4 10             	add    $0x10,%esp
     950:	85 c0                	test   %eax,%eax
     952:	75 0c                	jne    960 <parseline+0x90>
}
     954:	8d 65 f4             	lea    -0xc(%ebp),%esp
     957:	89 d8                	mov    %ebx,%eax
     959:	5b                   	pop    %ebx
     95a:	5e                   	pop    %esi
     95b:	5f                   	pop    %edi
     95c:	5d                   	pop    %ebp
     95d:	c3                   	ret
     95e:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     960:	6a 00                	push   $0x0
     962:	6a 00                	push   $0x0
     964:	57                   	push   %edi
     965:	56                   	push   %esi
     966:	e8 85 fa ff ff       	call   3f0 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     96b:	58                   	pop    %eax
     96c:	5a                   	pop    %edx
     96d:	57                   	push   %edi
     96e:	56                   	push   %esi
     96f:	e8 5c ff ff ff       	call   8d0 <parseline>
  cmd = malloc(sizeof(*cmd));
     974:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = listcmd(cmd, parseline(ps, es));
     97b:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     97d:	e8 fe 0b 00 00       	call   1580 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     982:	83 c4 0c             	add    $0xc,%esp
     985:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     987:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     989:	6a 00                	push   $0x0
     98b:	50                   	push   %eax
     98c:	e8 cf 06 00 00       	call   1060 <memset>
  cmd->left = left;
     991:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     994:	83 c4 10             	add    $0x10,%esp
     997:	89 f3                	mov    %esi,%ebx
  cmd->type = LIST;
     999:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
}
     99f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     9a1:	89 7e 08             	mov    %edi,0x8(%esi)
}
     9a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9a7:	5b                   	pop    %ebx
     9a8:	5e                   	pop    %esi
     9a9:	5f                   	pop    %edi
     9aa:	5d                   	pop    %ebp
     9ab:	c3                   	ret
     9ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009b0 <parseblock>:
{
     9b0:	55                   	push   %ebp
     9b1:	89 e5                	mov    %esp,%ebp
     9b3:	57                   	push   %edi
     9b4:	56                   	push   %esi
     9b5:	53                   	push   %ebx
     9b6:	83 ec 10             	sub    $0x10,%esp
     9b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     9bc:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     9bf:	68 90 16 00 00       	push   $0x1690
     9c4:	56                   	push   %esi
     9c5:	53                   	push   %ebx
     9c6:	e8 95 fb ff ff       	call   560 <peek>
     9cb:	83 c4 10             	add    $0x10,%esp
     9ce:	85 c0                	test   %eax,%eax
     9d0:	74 4a                	je     a1c <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     9d2:	6a 00                	push   $0x0
     9d4:	6a 00                	push   $0x0
     9d6:	56                   	push   %esi
     9d7:	53                   	push   %ebx
     9d8:	e8 13 fa ff ff       	call   3f0 <gettoken>
  cmd = parseline(ps, es);
     9dd:	58                   	pop    %eax
     9de:	5a                   	pop    %edx
     9df:	56                   	push   %esi
     9e0:	53                   	push   %ebx
     9e1:	e8 ea fe ff ff       	call   8d0 <parseline>
  if(!peek(ps, es, ")"))
     9e6:	83 c4 0c             	add    $0xc,%esp
     9e9:	68 cc 16 00 00       	push   $0x16cc
  cmd = parseline(ps, es);
     9ee:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     9f0:	56                   	push   %esi
     9f1:	53                   	push   %ebx
     9f2:	e8 69 fb ff ff       	call   560 <peek>
     9f7:	83 c4 10             	add    $0x10,%esp
     9fa:	85 c0                	test   %eax,%eax
     9fc:	74 2b                	je     a29 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     9fe:	6a 00                	push   $0x0
     a00:	6a 00                	push   $0x0
     a02:	56                   	push   %esi
     a03:	53                   	push   %ebx
     a04:	e8 e7 f9 ff ff       	call   3f0 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     a09:	83 c4 0c             	add    $0xc,%esp
     a0c:	56                   	push   %esi
     a0d:	53                   	push   %ebx
     a0e:	57                   	push   %edi
     a0f:	e8 cc fb ff ff       	call   5e0 <parseredirs>
}
     a14:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a17:	5b                   	pop    %ebx
     a18:	5e                   	pop    %esi
     a19:	5f                   	pop    %edi
     a1a:	5d                   	pop    %ebp
     a1b:	c3                   	ret
    panic("parseblock");
     a1c:	83 ec 0c             	sub    $0xc,%esp
     a1f:	68 b0 16 00 00       	push   $0x16b0
     a24:	e8 57 f8 ff ff       	call   280 <panic>
    panic("syntax - missing )");
     a29:	83 ec 0c             	sub    $0xc,%esp
     a2c:	68 bb 16 00 00       	push   $0x16bb
     a31:	e8 4a f8 ff ff       	call   280 <panic>
     a36:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a3d:	8d 76 00             	lea    0x0(%esi),%esi

00000a40 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     a40:	55                   	push   %ebp
     a41:	89 e5                	mov    %esp,%ebp
     a43:	53                   	push   %ebx
     a44:	83 ec 04             	sub    $0x4,%esp
     a47:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     a4a:	85 db                	test   %ebx,%ebx
     a4c:	0f 84 7e 00 00 00    	je     ad0 <nulterminate+0x90>
    return 0;

  switch(cmd->type){
     a52:	83 3b 05             	cmpl   $0x5,(%ebx)
     a55:	77 20                	ja     a77 <nulterminate+0x37>
     a57:	8b 03                	mov    (%ebx),%eax
     a59:	ff 24 85 30 17 00 00 	jmp    *0x1730(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     a60:	83 ec 0c             	sub    $0xc,%esp
     a63:	ff 73 04             	push   0x4(%ebx)
     a66:	e8 d5 ff ff ff       	call   a40 <nulterminate>
    nulterminate(lcmd->right);
     a6b:	58                   	pop    %eax
     a6c:	ff 73 08             	push   0x8(%ebx)
     a6f:	e8 cc ff ff ff       	call   a40 <nulterminate>
    break;
     a74:	83 c4 10             	add    $0x10,%esp
    return 0;
     a77:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     a79:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a7c:	c9                   	leave
     a7d:	c3                   	ret
     a7e:	66 90                	xchg   %ax,%ax
    nulterminate(bcmd->cmd);
     a80:	83 ec 0c             	sub    $0xc,%esp
     a83:	ff 73 04             	push   0x4(%ebx)
     a86:	e8 b5 ff ff ff       	call   a40 <nulterminate>
    break;
     a8b:	83 c4 10             	add    $0x10,%esp
     a8e:	eb e7                	jmp    a77 <nulterminate+0x37>
    for(i=0; ecmd->argv[i]; i++)
     a90:	8b 4b 04             	mov    0x4(%ebx),%ecx
     a93:	8d 43 08             	lea    0x8(%ebx),%eax
     a96:	85 c9                	test   %ecx,%ecx
     a98:	74 dd                	je     a77 <nulterminate+0x37>
     a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     aa0:	8b 50 24             	mov    0x24(%eax),%edx
    for(i=0; ecmd->argv[i]; i++)
     aa3:	83 c0 04             	add    $0x4,%eax
      *ecmd->eargv[i] = 0;
     aa6:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     aa9:	8b 50 fc             	mov    -0x4(%eax),%edx
     aac:	85 d2                	test   %edx,%edx
     aae:	75 f0                	jne    aa0 <nulterminate+0x60>
     ab0:	eb c5                	jmp    a77 <nulterminate+0x37>
     ab2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    nulterminate(rcmd->cmd);
     ab8:	83 ec 0c             	sub    $0xc,%esp
     abb:	ff 73 04             	push   0x4(%ebx)
     abe:	e8 7d ff ff ff       	call   a40 <nulterminate>
    *rcmd->efile = 0;
     ac3:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     ac6:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     ac9:	c6 00 00             	movb   $0x0,(%eax)
    break;
     acc:	eb a9                	jmp    a77 <nulterminate+0x37>
     ace:	66 90                	xchg   %ax,%ax
    return 0;
     ad0:	31 c0                	xor    %eax,%eax
     ad2:	eb a5                	jmp    a79 <nulterminate+0x39>
     ad4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     adb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     adf:	90                   	nop

00000ae0 <parsecmd>:
{
     ae0:	55                   	push   %ebp
     ae1:	89 e5                	mov    %esp,%ebp
     ae3:	57                   	push   %edi
     ae4:	56                   	push   %esi
  cmd = parseline(&s, es);
     ae5:	8d 7d 08             	lea    0x8(%ebp),%edi
{
     ae8:	53                   	push   %ebx
     ae9:	83 ec 18             	sub    $0x18,%esp
  es = s + strlen(s);
     aec:	8b 5d 08             	mov    0x8(%ebp),%ebx
     aef:	53                   	push   %ebx
     af0:	e8 3b 05 00 00       	call   1030 <strlen>
  cmd = parseline(&s, es);
     af5:	59                   	pop    %ecx
     af6:	5e                   	pop    %esi
  es = s + strlen(s);
     af7:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     af9:	53                   	push   %ebx
     afa:	57                   	push   %edi
     afb:	e8 d0 fd ff ff       	call   8d0 <parseline>
  peek(&s, es, "");
     b00:	83 c4 0c             	add    $0xc,%esp
     b03:	68 11 17 00 00       	push   $0x1711
  cmd = parseline(&s, es);
     b08:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     b0a:	53                   	push   %ebx
     b0b:	57                   	push   %edi
     b0c:	e8 4f fa ff ff       	call   560 <peek>
  if(s != es){
     b11:	8b 45 08             	mov    0x8(%ebp),%eax
     b14:	83 c4 10             	add    $0x10,%esp
     b17:	39 d8                	cmp    %ebx,%eax
     b19:	75 13                	jne    b2e <parsecmd+0x4e>
  nulterminate(cmd);
     b1b:	83 ec 0c             	sub    $0xc,%esp
     b1e:	56                   	push   %esi
     b1f:	e8 1c ff ff ff       	call   a40 <nulterminate>
}
     b24:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b27:	89 f0                	mov    %esi,%eax
     b29:	5b                   	pop    %ebx
     b2a:	5e                   	pop    %esi
     b2b:	5f                   	pop    %edi
     b2c:	5d                   	pop    %ebp
     b2d:	c3                   	ret
    printf(2, "leftovers: %s\n", s);
     b2e:	52                   	push   %edx
     b2f:	50                   	push   %eax
     b30:	68 ce 16 00 00       	push   $0x16ce
     b35:	6a 02                	push   $0x2
     b37:	e8 04 08 00 00       	call   1340 <printf>
    panic("syntax");
     b3c:	c7 04 24 92 16 00 00 	movl   $0x1692,(%esp)
     b43:	e8 38 f7 ff ff       	call   280 <panic>
     b48:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b4f:	90                   	nop

00000b50 <addhist>:

void addhist(char* newest) {
     b50:	55                   	push   %ebp
     b51:	89 e5                	mov    %esp,%ebp
     b53:	57                   	push   %edi
     b54:	56                   	push   %esi
     b55:	53                   	push   %ebx
     b56:	83 ec 0c             	sub    $0xc,%esp
     b59:	8b 75 08             	mov    0x8(%ebp),%esi
  if(!(newest[0] == 'h' && newest[1] == 'i' && newest[2] == 's' && newest[3] == 't' && newest[4])) { //checks if not hist (so it can add to history)
     b5c:	80 3e 68             	cmpb   $0x68,(%esi)
     b5f:	74 5f                	je     bc0 <addhist+0x70>
     b61:	bb 24 22 00 00       	mov    $0x2224,%ebx
     b66:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b6d:	8d 76 00             	lea    0x0(%esi),%esi
    for (int i = 9; i > 0; i--) {
      strcpy(commandhist[i], commandhist[i-1]); //shifts command history down
     b70:	83 ec 08             	sub    $0x8,%esp
     b73:	89 d8                	mov    %ebx,%eax
     b75:	83 eb 64             	sub    $0x64,%ebx
     b78:	53                   	push   %ebx
     b79:	50                   	push   %eax
     b7a:	e8 21 04 00 00       	call   fa0 <strcpy>
    for (int i = 9; i > 0; i--) {
     b7f:	83 c4 10             	add    $0x10,%esp
     b82:	81 fb a0 1e 00 00    	cmp    $0x1ea0,%ebx
     b88:	75 e6                	jne    b70 <addhist+0x20>
    }
    if (insert) {
      for (int i = 9; i > 0; i--) {
	strcpy(commandhist[i], commandhist[i-1]);
      }
      strcpy(commandhist[0], newest);
     b8a:	83 ec 08             	sub    $0x8,%esp
     b8d:	56                   	push   %esi
     b8e:	68 a0 1e 00 00       	push   $0x1ea0
     b93:	e8 08 04 00 00       	call   fa0 <strcpy>
      commandhist[0][strlen(commandhist[0]) - 1] = 0;
     b98:	c7 04 24 a0 1e 00 00 	movl   $0x1ea0,(%esp)
     b9f:	e8 8c 04 00 00       	call   1030 <strlen>
     ba4:	83 c4 10             	add    $0x10,%esp
     ba7:	c6 80 9f 1e 00 00 00 	movb   $0x0,0x1e9f(%eax)
    }
  }
}
     bae:	8d 65 f4             	lea    -0xc(%ebp),%esp
     bb1:	5b                   	pop    %ebx
     bb2:	5e                   	pop    %esi
     bb3:	5f                   	pop    %edi
     bb4:	5d                   	pop    %ebp
     bb5:	c3                   	ret
     bb6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bbd:	8d 76 00             	lea    0x0(%esi),%esi
  if(!(newest[0] == 'h' && newest[1] == 'i' && newest[2] == 's' && newest[3] == 't' && newest[4])) { //checks if not hist (so it can add to history)
     bc0:	80 7e 01 69          	cmpb   $0x69,0x1(%esi)
     bc4:	75 9b                	jne    b61 <addhist+0x11>
     bc6:	80 7e 02 73          	cmpb   $0x73,0x2(%esi)
     bca:	75 95                	jne    b61 <addhist+0x11>
     bcc:	80 7e 03 74          	cmpb   $0x74,0x3(%esi)
     bd0:	75 8f                	jne    b61 <addhist+0x11>
     bd2:	80 7e 04 00          	cmpb   $0x0,0x4(%esi)
     bd6:	74 89                	je     b61 <addhist+0x11>
    for (int i = 0; i < strlen(newest); i++) {
     bd8:	31 ff                	xor    %edi,%edi
    int insert = 0;
     bda:	31 db                	xor    %ebx,%ebx
     bdc:	eb 21                	jmp    bff <addhist+0xaf>
      if (newest[i] == ';' || newest[i] == '>' || newest[i] == '<' || newest[i] == '|') { //checks if there are compounded commands, if so, save to history
     bde:	0f b6 04 3e          	movzbl (%esi,%edi,1),%eax
     be2:	3c 3e                	cmp    $0x3e,%al
     be4:	0f 94 c2             	sete   %dl
     be7:	3c 7c                	cmp    $0x7c,%al
     be9:	0f 94 c1             	sete   %cl
     bec:	08 ca                	or     %cl,%dl
     bee:	75 07                	jne    bf7 <addhist+0xa7>
     bf0:	83 e8 3b             	sub    $0x3b,%eax
     bf3:	3c 01                	cmp    $0x1,%al
     bf5:	77 05                	ja     bfc <addhist+0xac>
	insert = 1;
     bf7:	bb 01 00 00 00       	mov    $0x1,%ebx
    for (int i = 0; i < strlen(newest); i++) {
     bfc:	83 c7 01             	add    $0x1,%edi
     bff:	83 ec 0c             	sub    $0xc,%esp
     c02:	56                   	push   %esi
     c03:	e8 28 04 00 00       	call   1030 <strlen>
     c08:	83 c4 10             	add    $0x10,%esp
     c0b:	39 c7                	cmp    %eax,%edi
     c0d:	72 cf                	jb     bde <addhist+0x8e>
    if (insert) {
     c0f:	85 db                	test   %ebx,%ebx
     c11:	74 9b                	je     bae <addhist+0x5e>
     c13:	bb 24 22 00 00       	mov    $0x2224,%ebx
	strcpy(commandhist[i], commandhist[i-1]);
     c18:	83 ec 08             	sub    $0x8,%esp
     c1b:	89 d8                	mov    %ebx,%eax
     c1d:	83 eb 64             	sub    $0x64,%ebx
     c20:	53                   	push   %ebx
     c21:	50                   	push   %eax
     c22:	e8 79 03 00 00       	call   fa0 <strcpy>
      for (int i = 9; i > 0; i--) {
     c27:	83 c4 10             	add    $0x10,%esp
     c2a:	81 fb a0 1e 00 00    	cmp    $0x1ea0,%ebx
     c30:	75 e6                	jne    c18 <addhist+0xc8>
     c32:	e9 53 ff ff ff       	jmp    b8a <addhist+0x3a>
     c37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c3e:	66 90                	xchg   %ax,%ax

00000c40 <printhist>:

void printhist() {
     c40:	55                   	push   %ebp
     c41:	89 e5                	mov    %esp,%ebp
     c43:	56                   	push   %esi
     c44:	be a0 1e 00 00       	mov    $0x1ea0,%esi
     c49:	53                   	push   %ebx
  for (int i = 0; i < 10; i++) {
     c4a:	31 db                	xor    %ebx,%ebx
     c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "Previous command %d: %s\n", i+1, commandhist[i]); //prints command history
     c50:	83 c3 01             	add    $0x1,%ebx
     c53:	56                   	push   %esi
  for (int i = 0; i < 10; i++) {
     c54:	83 c6 64             	add    $0x64,%esi
    printf(2, "Previous command %d: %s\n", i+1, commandhist[i]); //prints command history
     c57:	53                   	push   %ebx
     c58:	68 dd 16 00 00       	push   $0x16dd
     c5d:	6a 02                	push   $0x2
     c5f:	e8 dc 06 00 00       	call   1340 <printf>
  for (int i = 0; i < 10; i++) {
     c64:	83 c4 10             	add    $0x10,%esp
     c67:	83 fb 0a             	cmp    $0xa,%ebx
     c6a:	75 e4                	jne    c50 <printhist+0x10>
  }
}
     c6c:	8d 65 f8             	lea    -0x8(%ebp),%esp
     c6f:	5b                   	pop    %ebx
     c70:	5e                   	pop    %esi
     c71:	5d                   	pop    %ebp
     c72:	c3                   	ret
     c73:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000c80 <runhist>:

void runhist(int num) {
     c80:	55                   	push   %ebp
     c81:	89 e5                	mov    %esp,%ebp
     c83:	53                   	push   %ebx
     c84:	83 ec 04             	sub    $0x4,%esp
  if (num > 0 && num < 11) { //ensures number is within 10 command history
     c87:	8b 45 08             	mov    0x8(%ebp),%eax
     c8a:	8d 58 ff             	lea    -0x1(%eax),%ebx
     c8d:	83 fb 09             	cmp    $0x9,%ebx
     c90:	76 0e                	jbe    ca0 <runhist+0x20>
    if(fork1() == 0) {
      runcmd(parsecmd(commandhist[num - 1])); //runs corresponding command
    }
  }
  wait();
}
     c92:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c95:	c9                   	leave
  wait();
     c96:	e9 50 05 00 00       	jmp    11eb <wait>
     c9b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c9f:	90                   	nop
  pid = fork();
     ca0:	e8 36 05 00 00       	call   11db <fork>
  if(pid == -1)
     ca5:	83 f8 ff             	cmp    $0xffffffff,%eax
     ca8:	74 2a                	je     cd4 <runhist+0x54>
    if(fork1() == 0) {
     caa:	85 c0                	test   %eax,%eax
     cac:	75 e4                	jne    c92 <runhist+0x12>
      runcmd(parsecmd(commandhist[num - 1])); //runs corresponding command
     cae:	6b db 64             	imul   $0x64,%ebx,%ebx
     cb1:	83 ec 0c             	sub    $0xc,%esp
     cb4:	81 c3 a0 1e 00 00    	add    $0x1ea0,%ebx
     cba:	53                   	push   %ebx
     cbb:	e8 20 fe ff ff       	call   ae0 <parsecmd>
     cc0:	89 04 24             	mov    %eax,(%esp)
     cc3:	e8 28 00 00 00       	call   cf0 <runcmd>
}
     cc8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
      runcmd(parsecmd(commandhist[num - 1])); //runs corresponding command
     ccb:	83 c4 10             	add    $0x10,%esp
}
     cce:	c9                   	leave
  wait();
     ccf:	e9 17 05 00 00       	jmp    11eb <wait>
    panic("fork");
     cd4:	83 ec 0c             	sub    $0xc,%esp
     cd7:	68 6b 16 00 00       	push   $0x166b
     cdc:	e8 9f f5 ff ff       	call   280 <panic>
     ce1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ce8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     cef:	90                   	nop

00000cf0 <runcmd>:
{
     cf0:	55                   	push   %ebp
     cf1:	89 e5                	mov    %esp,%ebp
     cf3:	56                   	push   %esi
     cf4:	53                   	push   %ebx
     cf5:	83 ec 10             	sub    $0x10,%esp
     cf8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     cfb:	85 db                	test   %ebx,%ebx
     cfd:	74 6e                	je     d6d <runcmd+0x7d>
  switch(cmd->type){
     cff:	83 3b 05             	cmpl   $0x5,(%ebx)
     d02:	0f 87 7f 01 00 00    	ja     e87 <runcmd+0x197>
     d08:	8b 03                	mov    (%ebx),%eax
     d0a:	ff 24 85 48 17 00 00 	jmp    *0x1748(,%eax,4)
    pipe(p);
     d11:	83 ec 0c             	sub    $0xc,%esp
     d14:	8d 45 f0             	lea    -0x10(%ebp),%eax
     d17:	50                   	push   %eax
     d18:	e8 d6 04 00 00       	call   11f3 <pipe>
  pid = fork();
     d1d:	e8 b9 04 00 00       	call   11db <fork>
  if(pid == -1)
     d22:	83 c4 10             	add    $0x10,%esp
     d25:	83 f8 ff             	cmp    $0xffffffff,%eax
     d28:	0f 84 57 02 00 00    	je     f85 <runcmd+0x295>
    if(fork1() == 0) {
     d2e:	85 c0                	test   %eax,%eax
     d30:	0f 84 9e 01 00 00    	je     ed4 <runcmd+0x1e4>
  pid = fork();
     d36:	e8 a0 04 00 00       	call   11db <fork>
  if(pid == -1)
     d3b:	83 f8 ff             	cmp    $0xffffffff,%eax
     d3e:	0f 84 41 02 00 00    	je     f85 <runcmd+0x295>
    if(fork1() == 0) {
     d44:	85 c0                	test   %eax,%eax
     d46:	0f 84 b6 01 00 00    	je     f02 <runcmd+0x212>
    close(p[0]);
     d4c:	83 ec 0c             	sub    $0xc,%esp
     d4f:	ff 75 f0             	push   -0x10(%ebp)
     d52:	e8 b4 04 00 00       	call   120b <close>
    close(p[1]);
     d57:	5a                   	pop    %edx
     d58:	ff 75 f4             	push   -0xc(%ebp)
     d5b:	e8 ab 04 00 00       	call   120b <close>
    wait();
     d60:	e8 86 04 00 00       	call   11eb <wait>
    wait();
     d65:	e8 81 04 00 00       	call   11eb <wait>
    break;
     d6a:	83 c4 10             	add    $0x10,%esp
    exit();
     d6d:	e8 71 04 00 00       	call   11e3 <exit>
  pid = fork();
     d72:	e8 64 04 00 00       	call   11db <fork>
  if(pid == -1)
     d77:	83 f8 ff             	cmp    $0xffffffff,%eax
     d7a:	0f 84 05 02 00 00    	je     f85 <runcmd+0x295>
      if(pid == 0) {
     d80:	85 c0                	test   %eax,%eax
     d82:	0f 84 db 00 00 00    	je     e63 <runcmd+0x173>
       if (bg_count < MAX_BG_PROCS) {
     d88:	8b 15 88 22 00 00    	mov    0x2288,%edx
     d8e:	83 fa 09             	cmp    $0x9,%edx
     d91:	0f 8f bf 01 00 00    	jg     f56 <runcmd+0x266>
      bg_pids[bg_count++] = pid;
     d97:	8d 4a 01             	lea    0x1(%edx),%ecx
     d9a:	89 04 95 a0 22 00 00 	mov    %eax,0x22a0(,%edx,4)
     da1:	89 0d 88 22 00 00    	mov    %ecx,0x2288
     da7:	eb c4                	jmp    d6d <runcmd+0x7d>
    if(ecmd->argv[0] == 0)
     da9:	8b 73 04             	mov    0x4(%ebx),%esi
     dac:	85 f6                	test   %esi,%esi
     dae:	74 bd                	je     d6d <runcmd+0x7d>
     db0:	31 c0                	xor    %eax,%eax
     db2:	b9 68 00 00 00       	mov    $0x68,%ecx
     db7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     dbe:	66 90                	xchg   %ax,%ax
  while (*x != '\0' || *y != '\0') {
     dc0:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
     dc4:	84 d2                	test   %dl,%dl
     dc6:	0f 85 a4 00 00 00    	jne    e70 <runcmd+0x180>
    if(areEqual(ecmd->argv[0], placeholder1) == 0) { //checks if the cmd is a hist cmd
     dcc:	84 c9                	test   %cl,%cl
     dce:	0f 85 5c 01 00 00    	jne    f30 <runcmd+0x240>
      if(ecmd->argv[1] == 0) { //no argument = failure
     dd4:	8b 5b 08             	mov    0x8(%ebx),%ebx
     dd7:	85 db                	test   %ebx,%ebx
     dd9:	0f 84 c8 00 00 00    	je     ea7 <runcmd+0x1b7>
     ddf:	31 c0                	xor    %eax,%eax
     de1:	b9 70 00 00 00       	mov    $0x70,%ecx
  while (*x != '\0' || *y != '\0') {
     de6:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     dea:	84 d2                	test   %dl,%dl
     dec:	0f 85 cb 00 00 00    	jne    ebd <runcmd+0x1cd>
      else if (areEqual(ecmd->argv[1], placeholder2) == 0) { //checks if the cmd is a hist print cmd
     df2:	84 c9                	test   %cl,%cl
     df4:	0f 85 72 01 00 00    	jne    f6c <runcmd+0x27c>
     dfa:	be a0 1e 00 00       	mov    $0x1ea0,%esi
  for (int i = 0; i < 10; i++) {
     dff:	31 db                	xor    %ebx,%ebx
    printf(2, "Previous command %d: %s\n", i+1, commandhist[i]); //prints command history
     e01:	83 c3 01             	add    $0x1,%ebx
     e04:	56                   	push   %esi
  for (int i = 0; i < 10; i++) {
     e05:	83 c6 64             	add    $0x64,%esi
    printf(2, "Previous command %d: %s\n", i+1, commandhist[i]); //prints command history
     e08:	53                   	push   %ebx
     e09:	68 dd 16 00 00       	push   $0x16dd
     e0e:	6a 02                	push   $0x2
     e10:	e8 2b 05 00 00       	call   1340 <printf>
  for (int i = 0; i < 10; i++) {
     e15:	83 c4 10             	add    $0x10,%esp
     e18:	83 fb 0a             	cmp    $0xa,%ebx
     e1b:	75 e4                	jne    e01 <runcmd+0x111>
     e1d:	e9 4b ff ff ff       	jmp    d6d <runcmd+0x7d>
  pid = fork();
     e22:	e8 b4 03 00 00       	call   11db <fork>
  if(pid == -1)
     e27:	83 f8 ff             	cmp    $0xffffffff,%eax
     e2a:	0f 84 55 01 00 00    	je     f85 <runcmd+0x295>
    if (fork1() == 0) { //in child
     e30:	85 c0                	test   %eax,%eax
     e32:	74 2f                	je     e63 <runcmd+0x173>
    wait(); //wait for execution completion (in parent)
     e34:	e8 b2 03 00 00       	call   11eb <wait>
    runcmd(lcmd->right); //then run the right
     e39:	83 ec 0c             	sub    $0xc,%esp
     e3c:	ff 73 08             	push   0x8(%ebx)
     e3f:	e8 ac fe ff ff       	call   cf0 <runcmd>
    close(rcmd->fd); //close the necessary fd
     e44:	83 ec 0c             	sub    $0xc,%esp
     e47:	ff 73 14             	push   0x14(%ebx)
     e4a:	e8 bc 03 00 00       	call   120b <close>
    if(open(rcmd->file, rcmd->mode) < 0){ //open the necessary file (will automatically fill empty fd)
     e4f:	5e                   	pop    %esi
     e50:	58                   	pop    %eax
     e51:	ff 73 10             	push   0x10(%ebx)
     e54:	ff 73 08             	push   0x8(%ebx)
     e57:	e8 c7 03 00 00       	call   1223 <open>
     e5c:	83 c4 10             	add    $0x10,%esp
     e5f:	85 c0                	test   %eax,%eax
     e61:	78 31                	js     e94 <runcmd+0x1a4>
      runcmd(bcmd->cmd);  //Execute the background command in the child
     e63:	83 ec 0c             	sub    $0xc,%esp
     e66:	ff 73 04             	push   0x4(%ebx)
     e69:	e8 82 fe ff ff       	call   cf0 <runcmd>
     e6e:	66 90                	xchg   %ax,%ax
    if (*x == *y) {
     e70:	83 c0 01             	add    $0x1,%eax
     e73:	38 d1                	cmp    %dl,%cl
     e75:	0f 85 b5 00 00 00    	jne    f30 <runcmd+0x240>
     e7b:	0f b6 88 fd 16 00 00 	movzbl 0x16fd(%eax),%ecx
     e82:	e9 39 ff ff ff       	jmp    dc0 <runcmd+0xd0>
    panic("runcmd");
     e87:	83 ec 0c             	sub    $0xc,%esp
     e8a:	68 f6 16 00 00       	push   $0x16f6
     e8f:	e8 ec f3 ff ff       	call   280 <panic>
      printf(2, "failed\n"); //if it didn't work for some reason (?)
     e94:	51                   	push   %ecx
     e95:	51                   	push   %ecx
     e96:	68 0a 17 00 00       	push   $0x170a
     e9b:	6a 02                	push   $0x2
     e9d:	e8 9e 04 00 00       	call   1340 <printf>
      exit();
     ea2:	e8 3c 03 00 00       	call   11e3 <exit>
	printf(2, "exec %s failed\n", ecmd->argv[0]);
     ea7:	50                   	push   %eax
     ea8:	56                   	push   %esi
     ea9:	68 02 17 00 00       	push   $0x1702
     eae:	6a 02                	push   $0x2
     eb0:	e8 8b 04 00 00       	call   1340 <printf>
	break;
     eb5:	83 c4 10             	add    $0x10,%esp
     eb8:	e9 b0 fe ff ff       	jmp    d6d <runcmd+0x7d>
    if (*x == *y) {
     ebd:	83 c0 01             	add    $0x1,%eax
     ec0:	38 d1                	cmp    %dl,%cl
     ec2:	0f 85 a4 00 00 00    	jne    f6c <runcmd+0x27c>
     ec8:	0f b6 88 12 17 00 00 	movzbl 0x1712(%eax),%ecx
     ecf:	e9 12 ff ff ff       	jmp    de6 <runcmd+0xf6>
      close(1); //Closes standard output
     ed4:	83 ec 0c             	sub    $0xc,%esp
     ed7:	6a 01                	push   $0x1
     ed9:	e8 2d 03 00 00       	call   120b <close>
      dup(p[1]); //Duplicates write end of pipe, writing will send to pipe now
     ede:	58                   	pop    %eax
     edf:	ff 75 f4             	push   -0xc(%ebp)
     ee2:	e8 74 03 00 00       	call   125b <dup>
      close(p[0]);
     ee7:	58                   	pop    %eax
     ee8:	ff 75 f0             	push   -0x10(%ebp)
     eeb:	e8 1b 03 00 00       	call   120b <close>
      close(p[1]); //No longer necessary after duplication
     ef0:	58                   	pop    %eax
     ef1:	ff 75 f4             	push   -0xc(%ebp)
     ef4:	e8 12 03 00 00       	call   120b <close>
      runcmd(pcmd -> left); //Command execution
     ef9:	5a                   	pop    %edx
     efa:	ff 73 04             	push   0x4(%ebx)
     efd:	e8 ee fd ff ff       	call   cf0 <runcmd>
      close(0); 
     f02:	83 ec 0c             	sub    $0xc,%esp
     f05:	6a 00                	push   $0x0
     f07:	e8 ff 02 00 00       	call   120b <close>
      dup(p[0]);
     f0c:	59                   	pop    %ecx
     f0d:	ff 75 f0             	push   -0x10(%ebp)
     f10:	e8 46 03 00 00       	call   125b <dup>
      close(p[0]);
     f15:	5e                   	pop    %esi
     f16:	ff 75 f0             	push   -0x10(%ebp)
     f19:	e8 ed 02 00 00       	call   120b <close>
      close(p[1]);
     f1e:	58                   	pop    %eax
     f1f:	ff 75 f4             	push   -0xc(%ebp)
     f22:	e8 e4 02 00 00       	call   120b <close>
      runcmd(pcmd -> right);
     f27:	58                   	pop    %eax
     f28:	ff 73 08             	push   0x8(%ebx)
     f2b:	e8 c0 fd ff ff       	call   cf0 <runcmd>
      exec(ecmd->argv[0], ecmd->argv);
     f30:	50                   	push   %eax
     f31:	50                   	push   %eax
     f32:	8d 43 04             	lea    0x4(%ebx),%eax
     f35:	50                   	push   %eax
     f36:	56                   	push   %esi
     f37:	e8 df 02 00 00       	call   121b <exec>
      printf(2, "exec %s failed\n", ecmd->argv[0]);
     f3c:	83 c4 0c             	add    $0xc,%esp
     f3f:	ff 73 04             	push   0x4(%ebx)
     f42:	68 02 17 00 00       	push   $0x1702
     f47:	6a 02                	push   $0x2
     f49:	e8 f2 03 00 00       	call   1340 <printf>
     f4e:	83 c4 10             	add    $0x10,%esp
     f51:	e9 17 fe ff ff       	jmp    d6d <runcmd+0x7d>
      printf(2, "Too many background processes\n");
     f56:	50                   	push   %eax
     f57:	50                   	push   %eax
     f58:	68 60 17 00 00       	push   $0x1760
     f5d:	6a 02                	push   $0x2
     f5f:	e8 dc 03 00 00       	call   1340 <printf>
     f64:	83 c4 10             	add    $0x10,%esp
     f67:	e9 01 fe ff ff       	jmp    d6d <runcmd+0x7d>
	runhist(atoi(ecmd->argv[1])); //runs hist
     f6c:	83 ec 0c             	sub    $0xc,%esp
     f6f:	53                   	push   %ebx
     f70:	e8 fb 01 00 00       	call   1170 <atoi>
     f75:	89 04 24             	mov    %eax,(%esp)
     f78:	e8 03 fd ff ff       	call   c80 <runhist>
     f7d:	83 c4 10             	add    $0x10,%esp
     f80:	e9 e8 fd ff ff       	jmp    d6d <runcmd+0x7d>
    panic("fork");
     f85:	83 ec 0c             	sub    $0xc,%esp
     f88:	68 6b 16 00 00       	push   $0x166b
     f8d:	e8 ee f2 ff ff       	call   280 <panic>
     f92:	66 90                	xchg   %ax,%ax
     f94:	66 90                	xchg   %ax,%ax
     f96:	66 90                	xchg   %ax,%ax
     f98:	66 90                	xchg   %ax,%ax
     f9a:	66 90                	xchg   %ax,%ax
     f9c:	66 90                	xchg   %ax,%ax
     f9e:	66 90                	xchg   %ax,%ax

00000fa0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     fa0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     fa1:	31 c0                	xor    %eax,%eax
{
     fa3:	89 e5                	mov    %esp,%ebp
     fa5:	53                   	push   %ebx
     fa6:	8b 4d 08             	mov    0x8(%ebp),%ecx
     fa9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     fac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     fb0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     fb4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     fb7:	83 c0 01             	add    $0x1,%eax
     fba:	84 d2                	test   %dl,%dl
     fbc:	75 f2                	jne    fb0 <strcpy+0x10>
    ;
  return os;
}
     fbe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     fc1:	89 c8                	mov    %ecx,%eax
     fc3:	c9                   	leave
     fc4:	c3                   	ret
     fc5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000fd0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     fd0:	55                   	push   %ebp
     fd1:	89 e5                	mov    %esp,%ebp
     fd3:	53                   	push   %ebx
     fd4:	8b 55 08             	mov    0x8(%ebp),%edx
     fd7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     fda:	0f b6 02             	movzbl (%edx),%eax
     fdd:	84 c0                	test   %al,%al
     fdf:	75 17                	jne    ff8 <strcmp+0x28>
     fe1:	eb 3a                	jmp    101d <strcmp+0x4d>
     fe3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     fe7:	90                   	nop
     fe8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     fec:	83 c2 01             	add    $0x1,%edx
     fef:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     ff2:	84 c0                	test   %al,%al
     ff4:	74 1a                	je     1010 <strcmp+0x40>
    p++, q++;
     ff6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
     ff8:	0f b6 19             	movzbl (%ecx),%ebx
     ffb:	38 c3                	cmp    %al,%bl
     ffd:	74 e9                	je     fe8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     fff:	29 d8                	sub    %ebx,%eax
}
    1001:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1004:	c9                   	leave
    1005:	c3                   	ret
    1006:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    100d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
    1010:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    1014:	31 c0                	xor    %eax,%eax
    1016:	29 d8                	sub    %ebx,%eax
}
    1018:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    101b:	c9                   	leave
    101c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
    101d:	0f b6 19             	movzbl (%ecx),%ebx
    1020:	31 c0                	xor    %eax,%eax
    1022:	eb db                	jmp    fff <strcmp+0x2f>
    1024:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    102b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    102f:	90                   	nop

00001030 <strlen>:

uint
strlen(char *s)
{
    1030:	55                   	push   %ebp
    1031:	89 e5                	mov    %esp,%ebp
    1033:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    1036:	80 3a 00             	cmpb   $0x0,(%edx)
    1039:	74 15                	je     1050 <strlen+0x20>
    103b:	31 c0                	xor    %eax,%eax
    103d:	8d 76 00             	lea    0x0(%esi),%esi
    1040:	83 c0 01             	add    $0x1,%eax
    1043:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1047:	89 c1                	mov    %eax,%ecx
    1049:	75 f5                	jne    1040 <strlen+0x10>
    ;
  return n;
}
    104b:	89 c8                	mov    %ecx,%eax
    104d:	5d                   	pop    %ebp
    104e:	c3                   	ret
    104f:	90                   	nop
  for(n = 0; s[n]; n++)
    1050:	31 c9                	xor    %ecx,%ecx
}
    1052:	5d                   	pop    %ebp
    1053:	89 c8                	mov    %ecx,%eax
    1055:	c3                   	ret
    1056:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    105d:	8d 76 00             	lea    0x0(%esi),%esi

00001060 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	57                   	push   %edi
    1064:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1067:	8b 4d 10             	mov    0x10(%ebp),%ecx
    106a:	8b 45 0c             	mov    0xc(%ebp),%eax
    106d:	89 d7                	mov    %edx,%edi
    106f:	fc                   	cld
    1070:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1072:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1075:	89 d0                	mov    %edx,%eax
    1077:	c9                   	leave
    1078:	c3                   	ret
    1079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001080 <strchr>:

char*
strchr(const char *s, char c)
{
    1080:	55                   	push   %ebp
    1081:	89 e5                	mov    %esp,%ebp
    1083:	8b 45 08             	mov    0x8(%ebp),%eax
    1086:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    108a:	0f b6 10             	movzbl (%eax),%edx
    108d:	84 d2                	test   %dl,%dl
    108f:	75 12                	jne    10a3 <strchr+0x23>
    1091:	eb 1d                	jmp    10b0 <strchr+0x30>
    1093:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1097:	90                   	nop
    1098:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    109c:	83 c0 01             	add    $0x1,%eax
    109f:	84 d2                	test   %dl,%dl
    10a1:	74 0d                	je     10b0 <strchr+0x30>
    if(*s == c)
    10a3:	38 d1                	cmp    %dl,%cl
    10a5:	75 f1                	jne    1098 <strchr+0x18>
      return (char*)s;
  return 0;
}
    10a7:	5d                   	pop    %ebp
    10a8:	c3                   	ret
    10a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    10b0:	31 c0                	xor    %eax,%eax
}
    10b2:	5d                   	pop    %ebp
    10b3:	c3                   	ret
    10b4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10bf:	90                   	nop

000010c0 <gets>:

char*
gets(char *buf, int max)
{
    10c0:	55                   	push   %ebp
    10c1:	89 e5                	mov    %esp,%ebp
    10c3:	57                   	push   %edi
    10c4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    10c5:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
    10c8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
    10c9:	31 db                	xor    %ebx,%ebx
{
    10cb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    10ce:	eb 27                	jmp    10f7 <gets+0x37>
    cc = read(0, &c, 1);
    10d0:	83 ec 04             	sub    $0x4,%esp
    10d3:	6a 01                	push   $0x1
    10d5:	56                   	push   %esi
    10d6:	6a 00                	push   $0x0
    10d8:	e8 1e 01 00 00       	call   11fb <read>
    if(cc < 1)
    10dd:	83 c4 10             	add    $0x10,%esp
    10e0:	85 c0                	test   %eax,%eax
    10e2:	7e 1d                	jle    1101 <gets+0x41>
      break;
    buf[i++] = c;
    10e4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    10e8:	8b 55 08             	mov    0x8(%ebp),%edx
    10eb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    10ef:	3c 0a                	cmp    $0xa,%al
    10f1:	74 10                	je     1103 <gets+0x43>
    10f3:	3c 0d                	cmp    $0xd,%al
    10f5:	74 0c                	je     1103 <gets+0x43>
  for(i=0; i+1 < max; ){
    10f7:	89 df                	mov    %ebx,%edi
    10f9:	83 c3 01             	add    $0x1,%ebx
    10fc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    10ff:	7c cf                	jl     10d0 <gets+0x10>
    1101:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
    1103:	8b 45 08             	mov    0x8(%ebp),%eax
    1106:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
    110a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    110d:	5b                   	pop    %ebx
    110e:	5e                   	pop    %esi
    110f:	5f                   	pop    %edi
    1110:	5d                   	pop    %ebp
    1111:	c3                   	ret
    1112:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001120 <stat>:

int
stat(char *n, struct stat *st)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	56                   	push   %esi
    1124:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1125:	83 ec 08             	sub    $0x8,%esp
    1128:	6a 00                	push   $0x0
    112a:	ff 75 08             	push   0x8(%ebp)
    112d:	e8 f1 00 00 00       	call   1223 <open>
  if(fd < 0)
    1132:	83 c4 10             	add    $0x10,%esp
    1135:	85 c0                	test   %eax,%eax
    1137:	78 27                	js     1160 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1139:	83 ec 08             	sub    $0x8,%esp
    113c:	ff 75 0c             	push   0xc(%ebp)
    113f:	89 c3                	mov    %eax,%ebx
    1141:	50                   	push   %eax
    1142:	e8 f4 00 00 00       	call   123b <fstat>
  close(fd);
    1147:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    114a:	89 c6                	mov    %eax,%esi
  close(fd);
    114c:	e8 ba 00 00 00       	call   120b <close>
  return r;
    1151:	83 c4 10             	add    $0x10,%esp
}
    1154:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1157:	89 f0                	mov    %esi,%eax
    1159:	5b                   	pop    %ebx
    115a:	5e                   	pop    %esi
    115b:	5d                   	pop    %ebp
    115c:	c3                   	ret
    115d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1160:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1165:	eb ed                	jmp    1154 <stat+0x34>
    1167:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    116e:	66 90                	xchg   %ax,%ax

00001170 <atoi>:

int
atoi(const char *s)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	53                   	push   %ebx
    1174:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1177:	0f be 02             	movsbl (%edx),%eax
    117a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    117d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1180:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1185:	77 1e                	ja     11a5 <atoi+0x35>
    1187:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    118e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1190:	83 c2 01             	add    $0x1,%edx
    1193:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1196:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    119a:	0f be 02             	movsbl (%edx),%eax
    119d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    11a0:	80 fb 09             	cmp    $0x9,%bl
    11a3:	76 eb                	jbe    1190 <atoi+0x20>
  return n;
}
    11a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    11a8:	89 c8                	mov    %ecx,%eax
    11aa:	c9                   	leave
    11ab:	c3                   	ret
    11ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000011b0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	57                   	push   %edi
    11b4:	56                   	push   %esi
    11b5:	8b 45 10             	mov    0x10(%ebp),%eax
    11b8:	8b 55 08             	mov    0x8(%ebp),%edx
    11bb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    11be:	85 c0                	test   %eax,%eax
    11c0:	7e 13                	jle    11d5 <memmove+0x25>
    11c2:	01 d0                	add    %edx,%eax
  dst = vdst;
    11c4:	89 d7                	mov    %edx,%edi
    11c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11cd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    11d0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    11d1:	39 f8                	cmp    %edi,%eax
    11d3:	75 fb                	jne    11d0 <memmove+0x20>
  return vdst;
}
    11d5:	5e                   	pop    %esi
    11d6:	89 d0                	mov    %edx,%eax
    11d8:	5f                   	pop    %edi
    11d9:	5d                   	pop    %ebp
    11da:	c3                   	ret

000011db <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    11db:	b8 01 00 00 00       	mov    $0x1,%eax
    11e0:	cd 40                	int    $0x40
    11e2:	c3                   	ret

000011e3 <exit>:
SYSCALL(exit)
    11e3:	b8 02 00 00 00       	mov    $0x2,%eax
    11e8:	cd 40                	int    $0x40
    11ea:	c3                   	ret

000011eb <wait>:
SYSCALL(wait)
    11eb:	b8 03 00 00 00       	mov    $0x3,%eax
    11f0:	cd 40                	int    $0x40
    11f2:	c3                   	ret

000011f3 <pipe>:
SYSCALL(pipe)
    11f3:	b8 04 00 00 00       	mov    $0x4,%eax
    11f8:	cd 40                	int    $0x40
    11fa:	c3                   	ret

000011fb <read>:
SYSCALL(read)
    11fb:	b8 05 00 00 00       	mov    $0x5,%eax
    1200:	cd 40                	int    $0x40
    1202:	c3                   	ret

00001203 <write>:
SYSCALL(write)
    1203:	b8 10 00 00 00       	mov    $0x10,%eax
    1208:	cd 40                	int    $0x40
    120a:	c3                   	ret

0000120b <close>:
SYSCALL(close)
    120b:	b8 15 00 00 00       	mov    $0x15,%eax
    1210:	cd 40                	int    $0x40
    1212:	c3                   	ret

00001213 <kill>:
SYSCALL(kill)
    1213:	b8 06 00 00 00       	mov    $0x6,%eax
    1218:	cd 40                	int    $0x40
    121a:	c3                   	ret

0000121b <exec>:
SYSCALL(exec)
    121b:	b8 07 00 00 00       	mov    $0x7,%eax
    1220:	cd 40                	int    $0x40
    1222:	c3                   	ret

00001223 <open>:
SYSCALL(open)
    1223:	b8 0f 00 00 00       	mov    $0xf,%eax
    1228:	cd 40                	int    $0x40
    122a:	c3                   	ret

0000122b <mknod>:
SYSCALL(mknod)
    122b:	b8 11 00 00 00       	mov    $0x11,%eax
    1230:	cd 40                	int    $0x40
    1232:	c3                   	ret

00001233 <unlink>:
SYSCALL(unlink)
    1233:	b8 12 00 00 00       	mov    $0x12,%eax
    1238:	cd 40                	int    $0x40
    123a:	c3                   	ret

0000123b <fstat>:
SYSCALL(fstat)
    123b:	b8 08 00 00 00       	mov    $0x8,%eax
    1240:	cd 40                	int    $0x40
    1242:	c3                   	ret

00001243 <link>:
SYSCALL(link)
    1243:	b8 13 00 00 00       	mov    $0x13,%eax
    1248:	cd 40                	int    $0x40
    124a:	c3                   	ret

0000124b <mkdir>:
SYSCALL(mkdir)
    124b:	b8 14 00 00 00       	mov    $0x14,%eax
    1250:	cd 40                	int    $0x40
    1252:	c3                   	ret

00001253 <chdir>:
SYSCALL(chdir)
    1253:	b8 09 00 00 00       	mov    $0x9,%eax
    1258:	cd 40                	int    $0x40
    125a:	c3                   	ret

0000125b <dup>:
SYSCALL(dup)
    125b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1260:	cd 40                	int    $0x40
    1262:	c3                   	ret

00001263 <getpid>:
SYSCALL(getpid)
    1263:	b8 0b 00 00 00       	mov    $0xb,%eax
    1268:	cd 40                	int    $0x40
    126a:	c3                   	ret

0000126b <sbrk>:
SYSCALL(sbrk)
    126b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1270:	cd 40                	int    $0x40
    1272:	c3                   	ret

00001273 <sleep>:
SYSCALL(sleep)
    1273:	b8 0d 00 00 00       	mov    $0xd,%eax
    1278:	cd 40                	int    $0x40
    127a:	c3                   	ret

0000127b <uptime>:
SYSCALL(uptime)
    127b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1280:	cd 40                	int    $0x40
    1282:	c3                   	ret

00001283 <shutdown>:
SYSCALL(shutdown)
    1283:	b8 16 00 00 00       	mov    $0x16,%eax
    1288:	cd 40                	int    $0x40
    128a:	c3                   	ret

0000128b <cps>:
SYSCALL(cps)
    128b:	b8 17 00 00 00       	mov    $0x17,%eax
    1290:	cd 40                	int    $0x40
    1292:	c3                   	ret

00001293 <chpr>:
SYSCALL(chpr)
    1293:	b8 18 00 00 00       	mov    $0x18,%eax
    1298:	cd 40                	int    $0x40
    129a:	c3                   	ret
    129b:	66 90                	xchg   %ax,%ax
    129d:	66 90                	xchg   %ax,%ax
    129f:	90                   	nop

000012a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	57                   	push   %edi
    12a4:	56                   	push   %esi
    12a5:	53                   	push   %ebx
    12a6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    12a8:	89 d1                	mov    %edx,%ecx
{
    12aa:	83 ec 3c             	sub    $0x3c,%esp
    12ad:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
    12b0:	85 d2                	test   %edx,%edx
    12b2:	0f 89 80 00 00 00    	jns    1338 <printint+0x98>
    12b8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    12bc:	74 7a                	je     1338 <printint+0x98>
    x = -xx;
    12be:	f7 d9                	neg    %ecx
    neg = 1;
    12c0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
    12c5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    12c8:	31 f6                	xor    %esi,%esi
    12ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    12d0:	89 c8                	mov    %ecx,%eax
    12d2:	31 d2                	xor    %edx,%edx
    12d4:	89 f7                	mov    %esi,%edi
    12d6:	f7 f3                	div    %ebx
    12d8:	8d 76 01             	lea    0x1(%esi),%esi
    12db:	0f b6 92 e0 17 00 00 	movzbl 0x17e0(%edx),%edx
    12e2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
    12e6:	89 ca                	mov    %ecx,%edx
    12e8:	89 c1                	mov    %eax,%ecx
    12ea:	39 da                	cmp    %ebx,%edx
    12ec:	73 e2                	jae    12d0 <printint+0x30>
  if(neg)
    12ee:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    12f1:	85 c0                	test   %eax,%eax
    12f3:	74 07                	je     12fc <printint+0x5c>
    buf[i++] = '-';
    12f5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
    buf[i++] = digits[x % base];
    12fa:	89 f7                	mov    %esi,%edi
    12fc:	8d 5d d8             	lea    -0x28(%ebp),%ebx
    12ff:	8b 75 c0             	mov    -0x40(%ebp),%esi
    1302:	01 df                	add    %ebx,%edi
    1304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  while(--i >= 0)
    putc(fd, buf[i]);
    1308:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
    130b:	83 ec 04             	sub    $0x4,%esp
    130e:	88 45 d7             	mov    %al,-0x29(%ebp)
    1311:	8d 45 d7             	lea    -0x29(%ebp),%eax
    1314:	6a 01                	push   $0x1
    1316:	50                   	push   %eax
    1317:	56                   	push   %esi
    1318:	e8 e6 fe ff ff       	call   1203 <write>
  while(--i >= 0)
    131d:	89 f8                	mov    %edi,%eax
    131f:	83 c4 10             	add    $0x10,%esp
    1322:	83 ef 01             	sub    $0x1,%edi
    1325:	39 d8                	cmp    %ebx,%eax
    1327:	75 df                	jne    1308 <printint+0x68>
}
    1329:	8d 65 f4             	lea    -0xc(%ebp),%esp
    132c:	5b                   	pop    %ebx
    132d:	5e                   	pop    %esi
    132e:	5f                   	pop    %edi
    132f:	5d                   	pop    %ebp
    1330:	c3                   	ret
    1331:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1338:	31 c0                	xor    %eax,%eax
    133a:	eb 89                	jmp    12c5 <printint+0x25>
    133c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001340 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1340:	55                   	push   %ebp
    1341:	89 e5                	mov    %esp,%ebp
    1343:	57                   	push   %edi
    1344:	56                   	push   %esi
    1345:	53                   	push   %ebx
    1346:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1349:	8b 75 0c             	mov    0xc(%ebp),%esi
{
    134c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
    134f:	0f b6 1e             	movzbl (%esi),%ebx
    1352:	83 c6 01             	add    $0x1,%esi
    1355:	84 db                	test   %bl,%bl
    1357:	74 67                	je     13c0 <printf+0x80>
    1359:	8d 4d 10             	lea    0x10(%ebp),%ecx
    135c:	31 d2                	xor    %edx,%edx
    135e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
    1361:	eb 34                	jmp    1397 <printf+0x57>
    1363:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1367:	90                   	nop
    1368:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    136b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1370:	83 f8 25             	cmp    $0x25,%eax
    1373:	74 18                	je     138d <printf+0x4d>
  write(fd, &c, 1);
    1375:	83 ec 04             	sub    $0x4,%esp
    1378:	8d 45 e7             	lea    -0x19(%ebp),%eax
    137b:	88 5d e7             	mov    %bl,-0x19(%ebp)
    137e:	6a 01                	push   $0x1
    1380:	50                   	push   %eax
    1381:	57                   	push   %edi
    1382:	e8 7c fe ff ff       	call   1203 <write>
    1387:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    138a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    138d:	0f b6 1e             	movzbl (%esi),%ebx
    1390:	83 c6 01             	add    $0x1,%esi
    1393:	84 db                	test   %bl,%bl
    1395:	74 29                	je     13c0 <printf+0x80>
    c = fmt[i] & 0xff;
    1397:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    139a:	85 d2                	test   %edx,%edx
    139c:	74 ca                	je     1368 <printf+0x28>
      }
    } else if(state == '%'){
    139e:	83 fa 25             	cmp    $0x25,%edx
    13a1:	75 ea                	jne    138d <printf+0x4d>
      if(c == 'd'){
    13a3:	83 f8 25             	cmp    $0x25,%eax
    13a6:	0f 84 24 01 00 00    	je     14d0 <printf+0x190>
    13ac:	83 e8 63             	sub    $0x63,%eax
    13af:	83 f8 15             	cmp    $0x15,%eax
    13b2:	77 1c                	ja     13d0 <printf+0x90>
    13b4:	ff 24 85 88 17 00 00 	jmp    *0x1788(,%eax,4)
    13bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    13bf:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    13c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13c3:	5b                   	pop    %ebx
    13c4:	5e                   	pop    %esi
    13c5:	5f                   	pop    %edi
    13c6:	5d                   	pop    %ebp
    13c7:	c3                   	ret
    13c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13cf:	90                   	nop
  write(fd, &c, 1);
    13d0:	83 ec 04             	sub    $0x4,%esp
    13d3:	8d 55 e7             	lea    -0x19(%ebp),%edx
    13d6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    13da:	6a 01                	push   $0x1
    13dc:	52                   	push   %edx
    13dd:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    13e0:	57                   	push   %edi
    13e1:	e8 1d fe ff ff       	call   1203 <write>
    13e6:	83 c4 0c             	add    $0xc,%esp
    13e9:	88 5d e7             	mov    %bl,-0x19(%ebp)
    13ec:	6a 01                	push   $0x1
    13ee:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    13f1:	52                   	push   %edx
    13f2:	57                   	push   %edi
    13f3:	e8 0b fe ff ff       	call   1203 <write>
        putc(fd, c);
    13f8:	83 c4 10             	add    $0x10,%esp
      state = 0;
    13fb:	31 d2                	xor    %edx,%edx
    13fd:	eb 8e                	jmp    138d <printf+0x4d>
    13ff:	90                   	nop
        printint(fd, *ap, 16, 0);
    1400:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1403:	83 ec 0c             	sub    $0xc,%esp
    1406:	b9 10 00 00 00       	mov    $0x10,%ecx
    140b:	8b 13                	mov    (%ebx),%edx
    140d:	6a 00                	push   $0x0
    140f:	89 f8                	mov    %edi,%eax
        ap++;
    1411:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
    1414:	e8 87 fe ff ff       	call   12a0 <printint>
        ap++;
    1419:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    141c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    141f:	31 d2                	xor    %edx,%edx
    1421:	e9 67 ff ff ff       	jmp    138d <printf+0x4d>
    1426:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    142d:	8d 76 00             	lea    0x0(%esi),%esi
        s = (char*)*ap;
    1430:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1433:	8b 18                	mov    (%eax),%ebx
        ap++;
    1435:	83 c0 04             	add    $0x4,%eax
    1438:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    143b:	85 db                	test   %ebx,%ebx
    143d:	0f 84 9d 00 00 00    	je     14e0 <printf+0x1a0>
        while(*s != 0){
    1443:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    1446:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    1448:	84 c0                	test   %al,%al
    144a:	0f 84 3d ff ff ff    	je     138d <printf+0x4d>
    1450:	8d 55 e7             	lea    -0x19(%ebp),%edx
    1453:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    1456:	89 de                	mov    %ebx,%esi
    1458:	89 d3                	mov    %edx,%ebx
    145a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1460:	83 ec 04             	sub    $0x4,%esp
    1463:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
    1466:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1469:	6a 01                	push   $0x1
    146b:	53                   	push   %ebx
    146c:	57                   	push   %edi
    146d:	e8 91 fd ff ff       	call   1203 <write>
        while(*s != 0){
    1472:	0f b6 06             	movzbl (%esi),%eax
    1475:	83 c4 10             	add    $0x10,%esp
    1478:	84 c0                	test   %al,%al
    147a:	75 e4                	jne    1460 <printf+0x120>
      state = 0;
    147c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
    147f:	31 d2                	xor    %edx,%edx
    1481:	e9 07 ff ff ff       	jmp    138d <printf+0x4d>
    1486:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    148d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1490:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1493:	83 ec 0c             	sub    $0xc,%esp
    1496:	b9 0a 00 00 00       	mov    $0xa,%ecx
    149b:	8b 13                	mov    (%ebx),%edx
    149d:	6a 01                	push   $0x1
    149f:	e9 6b ff ff ff       	jmp    140f <printf+0xcf>
    14a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    14a8:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    14ab:	83 ec 04             	sub    $0x4,%esp
    14ae:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
    14b1:	8b 03                	mov    (%ebx),%eax
        ap++;
    14b3:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
    14b6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    14b9:	6a 01                	push   $0x1
    14bb:	52                   	push   %edx
    14bc:	57                   	push   %edi
    14bd:	e8 41 fd ff ff       	call   1203 <write>
        ap++;
    14c2:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    14c5:	83 c4 10             	add    $0x10,%esp
      state = 0;
    14c8:	31 d2                	xor    %edx,%edx
    14ca:	e9 be fe ff ff       	jmp    138d <printf+0x4d>
    14cf:	90                   	nop
  write(fd, &c, 1);
    14d0:	83 ec 04             	sub    $0x4,%esp
    14d3:	88 5d e7             	mov    %bl,-0x19(%ebp)
    14d6:	8d 55 e7             	lea    -0x19(%ebp),%edx
    14d9:	6a 01                	push   $0x1
    14db:	e9 11 ff ff ff       	jmp    13f1 <printf+0xb1>
    14e0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
    14e5:	bb 7f 17 00 00       	mov    $0x177f,%ebx
    14ea:	e9 61 ff ff ff       	jmp    1450 <printf+0x110>
    14ef:	90                   	nop

000014f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    14f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    14f1:	a1 44 23 00 00       	mov    0x2344,%eax
{
    14f6:	89 e5                	mov    %esp,%ebp
    14f8:	57                   	push   %edi
    14f9:	56                   	push   %esi
    14fa:	53                   	push   %ebx
    14fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    14fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1501:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1508:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    150a:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    150c:	39 ca                	cmp    %ecx,%edx
    150e:	73 30                	jae    1540 <free+0x50>
    1510:	39 c1                	cmp    %eax,%ecx
    1512:	72 04                	jb     1518 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1514:	39 c2                	cmp    %eax,%edx
    1516:	72 f0                	jb     1508 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1518:	8b 73 fc             	mov    -0x4(%ebx),%esi
    151b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    151e:	39 f8                	cmp    %edi,%eax
    1520:	74 2e                	je     1550 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1522:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1525:	8b 42 04             	mov    0x4(%edx),%eax
    1528:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    152b:	39 f1                	cmp    %esi,%ecx
    152d:	74 38                	je     1567 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    152f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1531:	5b                   	pop    %ebx
  freep = p;
    1532:	89 15 44 23 00 00    	mov    %edx,0x2344
}
    1538:	5e                   	pop    %esi
    1539:	5f                   	pop    %edi
    153a:	5d                   	pop    %ebp
    153b:	c3                   	ret
    153c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1540:	39 c1                	cmp    %eax,%ecx
    1542:	72 d0                	jb     1514 <free+0x24>
    1544:	eb c2                	jmp    1508 <free+0x18>
    1546:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    154d:	8d 76 00             	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
    1550:	03 70 04             	add    0x4(%eax),%esi
    1553:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1556:	8b 02                	mov    (%edx),%eax
    1558:	8b 00                	mov    (%eax),%eax
    155a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    155d:	8b 42 04             	mov    0x4(%edx),%eax
    1560:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1563:	39 f1                	cmp    %esi,%ecx
    1565:	75 c8                	jne    152f <free+0x3f>
    p->s.size += bp->s.size;
    1567:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    156a:	89 15 44 23 00 00    	mov    %edx,0x2344
    p->s.size += bp->s.size;
    1570:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1573:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1576:	89 0a                	mov    %ecx,(%edx)
}
    1578:	5b                   	pop    %ebx
    1579:	5e                   	pop    %esi
    157a:	5f                   	pop    %edi
    157b:	5d                   	pop    %ebp
    157c:	c3                   	ret
    157d:	8d 76 00             	lea    0x0(%esi),%esi

00001580 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1580:	55                   	push   %ebp
    1581:	89 e5                	mov    %esp,%ebp
    1583:	57                   	push   %edi
    1584:	56                   	push   %esi
    1585:	53                   	push   %ebx
    1586:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1589:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    158c:	8b 15 44 23 00 00    	mov    0x2344,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1592:	8d 78 07             	lea    0x7(%eax),%edi
    1595:	c1 ef 03             	shr    $0x3,%edi
    1598:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    159b:	85 d2                	test   %edx,%edx
    159d:	0f 84 8d 00 00 00    	je     1630 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    15a3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    15a5:	8b 48 04             	mov    0x4(%eax),%ecx
    15a8:	39 f9                	cmp    %edi,%ecx
    15aa:	73 64                	jae    1610 <malloc+0x90>
  if(nu < 4096)
    15ac:	bb 00 10 00 00       	mov    $0x1000,%ebx
    15b1:	39 df                	cmp    %ebx,%edi
    15b3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    15b6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    15bd:	eb 0a                	jmp    15c9 <malloc+0x49>
    15bf:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    15c0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    15c2:	8b 48 04             	mov    0x4(%eax),%ecx
    15c5:	39 f9                	cmp    %edi,%ecx
    15c7:	73 47                	jae    1610 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    15c9:	89 c2                	mov    %eax,%edx
    15cb:	39 05 44 23 00 00    	cmp    %eax,0x2344
    15d1:	75 ed                	jne    15c0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
    15d3:	83 ec 0c             	sub    $0xc,%esp
    15d6:	56                   	push   %esi
    15d7:	e8 8f fc ff ff       	call   126b <sbrk>
  if(p == (char*)-1)
    15dc:	83 c4 10             	add    $0x10,%esp
    15df:	83 f8 ff             	cmp    $0xffffffff,%eax
    15e2:	74 1c                	je     1600 <malloc+0x80>
  hp->s.size = nu;
    15e4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    15e7:	83 ec 0c             	sub    $0xc,%esp
    15ea:	83 c0 08             	add    $0x8,%eax
    15ed:	50                   	push   %eax
    15ee:	e8 fd fe ff ff       	call   14f0 <free>
  return freep;
    15f3:	8b 15 44 23 00 00    	mov    0x2344,%edx
      if((p = morecore(nunits)) == 0)
    15f9:	83 c4 10             	add    $0x10,%esp
    15fc:	85 d2                	test   %edx,%edx
    15fe:	75 c0                	jne    15c0 <malloc+0x40>
        return 0;
  }
}
    1600:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1603:	31 c0                	xor    %eax,%eax
}
    1605:	5b                   	pop    %ebx
    1606:	5e                   	pop    %esi
    1607:	5f                   	pop    %edi
    1608:	5d                   	pop    %ebp
    1609:	c3                   	ret
    160a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1610:	39 cf                	cmp    %ecx,%edi
    1612:	74 4c                	je     1660 <malloc+0xe0>
        p->s.size -= nunits;
    1614:	29 f9                	sub    %edi,%ecx
    1616:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1619:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    161c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    161f:	89 15 44 23 00 00    	mov    %edx,0x2344
}
    1625:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1628:	83 c0 08             	add    $0x8,%eax
}
    162b:	5b                   	pop    %ebx
    162c:	5e                   	pop    %esi
    162d:	5f                   	pop    %edi
    162e:	5d                   	pop    %ebp
    162f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
    1630:	c7 05 44 23 00 00 48 	movl   $0x2348,0x2344
    1637:	23 00 00 
    base.s.size = 0;
    163a:	b8 48 23 00 00       	mov    $0x2348,%eax
    base.s.ptr = freep = prevp = &base;
    163f:	c7 05 48 23 00 00 48 	movl   $0x2348,0x2348
    1646:	23 00 00 
    base.s.size = 0;
    1649:	c7 05 4c 23 00 00 00 	movl   $0x0,0x234c
    1650:	00 00 00 
    if(p->s.size >= nunits){
    1653:	e9 54 ff ff ff       	jmp    15ac <malloc+0x2c>
    1658:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    165f:	90                   	nop
        prevp->s.ptr = p->s.ptr;
    1660:	8b 08                	mov    (%eax),%ecx
    1662:	89 0a                	mov    %ecx,(%edx)
    1664:	eb b9                	jmp    161f <malloc+0x9f>
