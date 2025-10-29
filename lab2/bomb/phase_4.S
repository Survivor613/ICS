
./bomb++:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.got:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000081e4c <phase_4>:
   81e4c:	f3 0f 1e fa          	endbr64
   81e50:	55                   	push   %rbp
   81e51:	48 89 e5             	mov    %rsp,%rbp
   81e54:	48 83 ec 20          	sub    $0x20,%rsp
   81e58:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   81e5c:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
   81e60:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   81e64:	48 8d 0d 71 d8 2c 00 	lea    0x2cd871(%rip),%rcx        # 34f6dc <_ZSt19piecewise_construct+0x6d8>
   81e6b:	48 89 ce             	mov    %rcx,%rsi
   81e6e:	48 89 c7             	mov    %rax,%rdi
   81e71:	b8 00 00 00 00       	mov    $0x0,%eax
   81e76:	e8 b5 40 ff ff       	call   75f30 <__isoc99_sscanf@plt>
   81e7b:	83 f8 01             	cmp    $0x1,%eax
   81e7e:	0f 95 c0             	setne  %al
   81e81:	84 c0                	test   %al,%al
   81e83:	74 05                	je     81e8a <phase_4+0x3e>
   81e85:	e8 35 c1 ff ff       	call   7dfbf <explode_bomb>
   81e8a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   81e8e:	48 c1 f8 20          	sar    $0x20,%rax
   81e92:	89 45 fc             	mov    %eax,-0x4(%rbp)
   81e95:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   81e99:	89 45 f8             	mov    %eax,-0x8(%rbp)
   81e9c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   81ea0:	0f 9e c2             	setle  %dl
   81ea3:	83 7d fc 0e          	cmpl   $0xe,-0x4(%rbp)
   81ea7:	0f 9f c0             	setg   %al
   81eaa:	09 d0                	or     %edx,%eax
   81eac:	0f b6 d0             	movzbl %al,%edx
   81eaf:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
   81eb3:	0f 9e c0             	setle  %al
   81eb6:	0f b6 c0             	movzbl %al,%eax
   81eb9:	09 c2                	or     %eax,%edx
   81ebb:	8b 05 6f 9a 42 00    	mov    0x429a6f(%rip),%eax        # 4ab930 <ID_hash>
   81ec1:	83 e0 07             	and    $0x7,%eax
   81ec4:	83 c0 03             	add    $0x3,%eax
   81ec7:	39 45 f8             	cmp    %eax,-0x8(%rbp)
   81eca:	0f 9d c0             	setge  %al
   81ecd:	0f b6 c0             	movzbl %al,%eax
   81ed0:	09 d0                	or     %edx,%eax
   81ed2:	85 c0                	test   %eax,%eax
   81ed4:	74 05                	je     81edb <phase_4+0x8f>
   81ed6:	e8 e4 c0 ff ff       	call   7dfbf <explode_bomb>
   81edb:	8b 45 fc             	mov    -0x4(%rbp),%eax
   81ede:	89 c7                	mov    %eax,%edi
   81ee0:	e8 1f ff ff ff       	call   81e04 <_ZL5Poweri>
   81ee5:	3d 00 00 00 01       	cmp    $0x1000000,%eax
   81eea:	0f 95 c0             	setne  %al
   81eed:	84 c0                	test   %al,%al
   81eef:	74 05                	je     81ef6 <phase_4+0xaa>
   81ef1:	e8 c9 c0 ff ff       	call   7dfbf <explode_bomb>
   81ef6:	8b 05 34 9a 42 00    	mov    0x429a34(%rip),%eax        # 4ab930 <ID_hash>
   81efc:	83 e0 07             	and    $0x7,%eax
   81eff:	83 c0 02             	add    $0x2,%eax
   81f02:	c1 e0 02             	shl    $0x2,%eax
   81f05:	89 05 3d 9a 42 00    	mov    %eax,0x429a3d(%rip)        # 4ab948 <TE+0x8>
   81f0b:	90                   	nop
   81f0c:	c9                   	leave
   81f0d:	c3                   	ret

Disassembly of section .fini:
