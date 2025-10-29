
./bomb++:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.got:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000081958 <phase_1>:
   81958:	f3 0f 1e fa          	endbr64
   8195c:	55                   	push   %rbp
   8195d:	48 89 e5             	mov    %rsp,%rbp
   81960:	53                   	push   %rbx
   81961:	48 81 ec 48 02 00 00 	sub    $0x248,%rsp
   81968:	48 89 bd b8 fd ff ff 	mov    %rdi,-0x248(%rbp)
   8196f:	8b 0d bb 9f 42 00    	mov    0x429fbb(%rip),%ecx        # 4ab930 <ID_hash>
   81975:	89 ca                	mov    %ecx,%edx
   81977:	b8 cd cc cc cc       	mov    $0xcccccccd,%eax
   8197c:	48 0f af c2          	imul   %rdx,%rax
   81980:	48 c1 e8 20          	shr    $0x20,%rax
   81984:	89 c2                	mov    %eax,%edx
   81986:	c1 ea 03             	shr    $0x3,%edx
   81989:	89 d0                	mov    %edx,%eax
   8198b:	c1 e0 02             	shl    $0x2,%eax
   8198e:	01 d0                	add    %edx,%eax
   81990:	01 c0                	add    %eax,%eax
   81992:	29 c1                	sub    %eax,%ecx
   81994:	89 ca                	mov    %ecx,%edx
   81996:	b8 d6 00 00 00       	mov    $0xd6,%eax
   8199b:	29 d0                	sub    %edx,%eax
   8199d:	89 05 b1 9f 42 00    	mov    %eax,0x429fb1(%rip)        # 4ab954 <phase_1_offset>
   819a3:	8b 05 ab 9f 42 00    	mov    0x429fab(%rip),%eax        # 4ab954 <phase_1_offset>
   819a9:	48 98                	cltq
   819ab:	48 8d 15 6e 76 42 00 	lea    0x42766e(%rip),%rdx        # 4a9020 <phase_1_str>
   819b2:	48 01 d0             	add    %rdx,%rax
   819b5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
   819b9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   819bd:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
   819c1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
   819c8:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
   819cf:	eb 21                	jmp    819f2 <phase_1+0x9a>
   819d1:	8b 45 e8             	mov    -0x18(%rbp),%eax
   819d4:	48 63 d0             	movslq %eax,%rdx
   819d7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   819db:	48 01 d0             	add    %rdx,%rax
   819de:	0f b6 00             	movzbl (%rax),%eax
   819e1:	88 45 d7             	mov    %al,-0x29(%rbp)
   819e4:	0f b6 45 d7          	movzbl -0x29(%rbp),%eax
   819e8:	0f b6 c0             	movzbl %al,%eax
   819eb:	01 45 ec             	add    %eax,-0x14(%rbp)
   819ee:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
   819f2:	8b 0d 38 9f 42 00    	mov    0x429f38(%rip),%ecx        # 4ab930 <ID_hash>
   819f8:	89 ca                	mov    %ecx,%edx
   819fa:	b8 cd cc cc cc       	mov    $0xcccccccd,%eax
   819ff:	48 0f af c2          	imul   %rdx,%rax
   81a03:	48 c1 e8 20          	shr    $0x20,%rax
   81a07:	89 c2                	mov    %eax,%edx
   81a09:	c1 ea 03             	shr    $0x3,%edx
   81a0c:	89 d0                	mov    %edx,%eax
   81a0e:	c1 e0 02             	shl    $0x2,%eax
   81a11:	01 d0                	add    %edx,%eax
   81a13:	01 c0                	add    %eax,%eax
   81a15:	29 c1                	sub    %eax,%ecx
   81a17:	89 ca                	mov    %ecx,%edx
   81a19:	8d 42 01             	lea    0x1(%rdx),%eax
   81a1c:	39 45 e8             	cmp    %eax,-0x18(%rbp)
   81a1f:	7c b0                	jl     819d1 <phase_1+0x79>
   81a21:	8b 55 ec             	mov    -0x14(%rbp),%edx
   81a24:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
   81a28:	48 8d 0d a1 dc 2c 00 	lea    0x2cdca1(%rip),%rcx        # 34f6d0 <_ZSt19piecewise_construct+0x6cc>
   81a2f:	48 89 ce             	mov    %rcx,%rsi
   81a32:	48 89 c7             	mov    %rax,%rdi
   81a35:	b8 00 00 00 00       	mov    $0x0,%eax
   81a3a:	e8 61 48 ff ff       	call   762a0 <sprintf@plt>
   81a3f:	48 8d 55 c0          	lea    -0x40(%rbp),%rdx
   81a43:	48 8d 85 c0 fd ff ff 	lea    -0x240(%rbp),%rax
   81a4a:	48 89 d6             	mov    %rdx,%rsi
   81a4d:	48 89 c7             	mov    %rax,%rdi
   81a50:	e8 eb 4b ff ff       	call   76640 <strcpy@plt>
   81a55:	8b 0d d5 9e 42 00    	mov    0x429ed5(%rip),%ecx        # 4ab930 <ID_hash>
   81a5b:	89 ca                	mov    %ecx,%edx
   81a5d:	b8 cd cc cc cc       	mov    $0xcccccccd,%eax
   81a62:	48 0f af c2          	imul   %rdx,%rax
   81a66:	48 c1 e8 20          	shr    $0x20,%rax
   81a6a:	89 c2                	mov    %eax,%edx
   81a6c:	c1 ea 03             	shr    $0x3,%edx
   81a6f:	89 d0                	mov    %edx,%eax
   81a71:	c1 e0 02             	shl    $0x2,%eax
   81a74:	01 d0                	add    %edx,%eax
   81a76:	01 c0                	add    %eax,%eax
   81a78:	29 c1                	sub    %eax,%ecx
   81a7a:	89 ca                	mov    %ecx,%edx
   81a7c:	8d 42 01             	lea    0x1(%rdx),%eax
   81a7f:	89 c2                	mov    %eax,%edx
   81a81:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   81a85:	48 8d 1c 02          	lea    (%rdx,%rax,1),%rbx
   81a89:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
   81a8d:	48 89 c7             	mov    %rax,%rdi
   81a90:	e8 1b 47 ff ff       	call   761b0 <strlen@plt>
   81a95:	48 8d 95 c0 fd ff ff 	lea    -0x240(%rbp),%rdx
   81a9c:	48 01 d0             	add    %rdx,%rax
   81a9f:	48 89 de             	mov    %rbx,%rsi
   81aa2:	48 89 c7             	mov    %rax,%rdi
   81aa5:	e8 96 4b ff ff       	call   76640 <strcpy@plt>
   81aaa:	48 8d 95 c0 fd ff ff 	lea    -0x240(%rbp),%rdx
   81ab1:	48 8b 85 b8 fd ff ff 	mov    -0x248(%rbp),%rax
   81ab8:	48 89 d6             	mov    %rdx,%rsi
   81abb:	48 89 c7             	mov    %rax,%rdi
   81abe:	e8 32 fe ff ff       	call   818f5 <string_not_equal>
   81ac3:	83 f0 01             	xor    $0x1,%eax
   81ac6:	84 c0                	test   %al,%al
   81ac8:	74 05                	je     81acf <phase_1+0x177>
   81aca:	e8 f0 c4 ff ff       	call   7dfbf <explode_bomb>
   81acf:	8b 45 ec             	mov    -0x14(%rbp),%eax
   81ad2:	89 05 68 9e 42 00    	mov    %eax,0x429e68(%rip)        # 4ab940 <TE>
   81ad8:	90                   	nop
   81ad9:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   81add:	c9                   	leave
   81ade:	c3                   	ret

Disassembly of section .fini:
