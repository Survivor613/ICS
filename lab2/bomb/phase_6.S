
./bomb++:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.got:

Disassembly of section .plt.sec:

Disassembly of section .text:

00000000000822f9 <phase_6>:
   822f9:	f3 0f 1e fa          	endbr64
   822fd:	55                   	push   %rbp
   822fe:	48 89 e5             	mov    %rsp,%rbp
   82301:	48 83 ec 30          	sub    $0x30,%rsp
   82305:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   82309:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   8230d:	48 8d 15 0c 70 42 00 	lea    0x42700c(%rip),%rdx        # 4a9320 <phase_6_nums>
   82314:	48 89 d6             	mov    %rdx,%rsi
   82317:	48 89 c7             	mov    %rax,%rdi
   8231a:	e8 55 c6 ff ff       	call   7e974 <read_six_numbers>
   8231f:	48 8d 05 fa 6f 42 00 	lea    0x426ffa(%rip),%rax        # 4a9320 <phase_6_nums>
   82326:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
   8232a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   82331:	eb 3e                	jmp    82371 <phase_6+0x78>
   82333:	8b 45 fc             	mov    -0x4(%rbp),%eax
   82336:	48 98                	cltq
   82338:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
   8233f:	00 
   82340:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   82344:	48 01 d0             	add    %rdx,%rax
   82347:	8b 00                	mov    (%rax),%eax
   82349:	83 f8 06             	cmp    $0x6,%eax
   8234c:	7f 1a                	jg     82368 <phase_6+0x6f>
   8234e:	8b 45 fc             	mov    -0x4(%rbp),%eax
   82351:	48 98                	cltq
   82353:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
   8235a:	00 
   8235b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   8235f:	48 01 d0             	add    %rdx,%rax
   82362:	8b 00                	mov    (%rax),%eax
   82364:	85 c0                	test   %eax,%eax
   82366:	79 05                	jns    8236d <phase_6+0x74>
   82368:	e8 52 bc ff ff       	call   7dfbf <explode_bomb>
   8236d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   82371:	83 7d fc 05          	cmpl   $0x5,-0x4(%rbp)
   82375:	7e bc                	jle    82333 <phase_6+0x3a>
   82377:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   8237b:	48 89 c7             	mov    %rax,%rdi
   8237e:	e8 a2 fd ff ff       	call   82125 <build_target>
   82383:	88 45 ef             	mov    %al,-0x11(%rbp)
   82386:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   8238a:	83 f0 01             	xor    $0x1,%eax
   8238d:	84 c0                	test   %al,%al
   8238f:	74 05                	je     82396 <phase_6+0x9d>
   82391:	e8 29 bc ff ff       	call   7dfbf <explode_bomb>
   82396:	c7 05 ac 95 42 00 18 	movl   $0x18,0x4295ac(%rip)        # 4ab94c <TE+0xc>
   8239d:	00 00 00 
   823a0:	90                   	nop
   823a1:	c9                   	leave
   823a2:	c3                   	ret

Disassembly of section .fini:
