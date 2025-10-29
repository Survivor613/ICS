
./bomb++:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.got:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000081b4c <phase_2>:
   81b4c:	f3 0f 1e fa          	endbr64
   81b50:	55                   	push   %rbp
   81b51:	48 89 e5             	mov    %rsp,%rbp
   81b54:	48 83 ec 50          	sub    $0x50,%rsp
   81b58:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
   81b5c:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
   81b60:	48 89 c7             	mov    %rax,%rdi
   81b63:	e8 78 ff ff ff       	call   81ae0 <_ZZ7phase_2ENUt_C1Ev>
   81b68:	48 8d 55 c0          	lea    -0x40(%rbp),%rdx
   81b6c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   81b70:	48 89 d6             	mov    %rdx,%rsi
   81b73:	48 89 c7             	mov    %rax,%rdi
   81b76:	e8 f9 cd ff ff       	call   7e974 <read_six_numbers>
   81b7b:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
   81b7f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
   81b83:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
   81b8a:	eb 48                	jmp    81bd4 <phase_2+0x88>
   81b8c:	8b 55 d8             	mov    -0x28(%rbp),%edx
   81b8f:	8b 45 fc             	mov    -0x4(%rbp),%eax
   81b92:	48 98                	cltq
   81b94:	48 c1 e0 02          	shl    $0x2,%rax
   81b98:	48 8d 48 fc          	lea    -0x4(%rax),%rcx
   81b9c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   81ba0:	48 01 c8             	add    %rcx,%rax
   81ba3:	8b 00                	mov    (%rax),%eax
   81ba5:	0f af c2             	imul   %edx,%eax
   81ba8:	8b 55 dc             	mov    -0x24(%rbp),%edx
   81bab:	29 d0                	sub    %edx,%eax
   81bad:	89 45 ec             	mov    %eax,-0x14(%rbp)
   81bb0:	8b 45 fc             	mov    -0x4(%rbp),%eax
   81bb3:	48 98                	cltq
   81bb5:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
   81bbc:	00 
   81bbd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   81bc1:	48 01 d0             	add    %rdx,%rax
   81bc4:	8b 00                	mov    (%rax),%eax
   81bc6:	39 45 ec             	cmp    %eax,-0x14(%rbp)
   81bc9:	74 05                	je     81bd0 <phase_2+0x84>
   81bcb:	e8 ef c3 ff ff       	call   7dfbf <explode_bomb>
   81bd0:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   81bd4:	83 7d fc 05          	cmpl   $0x5,-0x4(%rbp)
   81bd8:	7e b2                	jle    81b8c <phase_2+0x40>
   81bda:	8b 55 d8             	mov    -0x28(%rbp),%edx
   81bdd:	8b 45 dc             	mov    -0x24(%rbp),%eax
   81be0:	0f af c2             	imul   %edx,%eax
   81be3:	89 05 5b 9d 42 00    	mov    %eax,0x429d5b(%rip)        # 4ab944 <TE+0x4>
   81be9:	90                   	nop
   81bea:	c9                   	leave
   81beb:	c3                   	ret

Disassembly of section .fini:
