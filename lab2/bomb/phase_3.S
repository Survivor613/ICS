
./bomb++:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.got:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000081bec <phase_3>:
   81bec:	f3 0f 1e fa          	endbr64
   81bf0:	55                   	push   %rbp
   81bf1:	48 89 e5             	mov    %rsp,%rbp
   81bf4:	48 83 ec 30          	sub    $0x30,%rsp
   81bf8:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   81bfc:	8b 05 2e 9d 42 00    	mov    0x429d2e(%rip),%eax        # 4ab930 <ID_hash>
   81c02:	83 e0 07             	and    $0x7,%eax
   81c05:	89 45 f8             	mov    %eax,-0x8(%rbp)
   81c08:	48 8d 75 eb          	lea    -0x15(%rbp),%rsi
   81c0c:	48 8d 4d ec          	lea    -0x14(%rbp),%rcx
   81c10:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
   81c14:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   81c18:	49 89 f0             	mov    %rsi,%r8
   81c1b:	48 8d 35 b1 da 2c 00 	lea    0x2cdab1(%rip),%rsi        # 34f6d3 <_ZSt19piecewise_construct+0x6cf>
   81c22:	48 89 c7             	mov    %rax,%rdi
   81c25:	b8 00 00 00 00       	mov    $0x0,%eax
   81c2a:	e8 01 43 ff ff       	call   75f30 <__isoc99_sscanf@plt>
   81c2f:	89 45 f4             	mov    %eax,-0xc(%rbp)
   81c32:	83 7d f4 03          	cmpl   $0x3,-0xc(%rbp)
   81c36:	74 05                	je     81c3d <phase_3+0x51>
   81c38:	e8 82 c3 ff ff       	call   7dfbf <explode_bomb>
   81c3d:	8b 45 f0             	mov    -0x10(%rbp),%eax
   81c40:	3d f6 01 00 00       	cmp    $0x1f6,%eax
   81c45:	0f 84 f2 00 00 00    	je     81d3d <phase_3+0x151>
   81c4b:	3d f6 01 00 00       	cmp    $0x1f6,%eax
   81c50:	0f 8f 72 01 00 00    	jg     81dc8 <phase_3+0x1dc>
   81c56:	3d f4 01 00 00       	cmp    $0x1f4,%eax
   81c5b:	0f 84 16 01 00 00    	je     81d77 <phase_3+0x18b>
   81c61:	3d f4 01 00 00       	cmp    $0x1f4,%eax
   81c66:	0f 8f 5c 01 00 00    	jg     81dc8 <phase_3+0x1dc>
   81c6c:	3d 94 01 00 00       	cmp    $0x194,%eax
   81c71:	0f 84 a4 00 00 00    	je     81d1b <phase_3+0x12f>
   81c77:	3d 94 01 00 00       	cmp    $0x194,%eax
   81c7c:	0f 8f 46 01 00 00    	jg     81dc8 <phase_3+0x1dc>
   81c82:	3d 4d 01 00 00       	cmp    $0x14d,%eax
   81c87:	74 70                	je     81cf9 <phase_3+0x10d>
   81c89:	3d 4d 01 00 00       	cmp    $0x14d,%eax
   81c8e:	0f 8f 34 01 00 00    	jg     81dc8 <phase_3+0x1dc>
   81c94:	3d 2d 01 00 00       	cmp    $0x12d,%eax
   81c99:	0f 84 0e 01 00 00    	je     81dad <phase_3+0x1c1>
   81c9f:	3d 2d 01 00 00       	cmp    $0x12d,%eax
   81ca4:	0f 8f 1e 01 00 00    	jg     81dc8 <phase_3+0x1dc>
   81caa:	3d fb 00 00 00       	cmp    $0xfb,%eax
   81caf:	74 26                	je     81cd7 <phase_3+0xeb>
   81cb1:	3d fb 00 00 00       	cmp    $0xfb,%eax
   81cb6:	0f 8f 0c 01 00 00    	jg     81dc8 <phase_3+0x1dc>
   81cbc:	3d c8 00 00 00       	cmp    $0xc8,%eax
   81cc1:	0f 84 95 00 00 00    	je     81d5c <phase_3+0x170>
   81cc7:	3d e9 00 00 00       	cmp    $0xe9,%eax
   81ccc:	0f 84 c0 00 00 00    	je     81d92 <phase_3+0x1a6>
   81cd2:	e9 f1 00 00 00       	jmp    81dc8 <phase_3+0x1dc>
   81cd7:	c6 45 ff 6f          	movb   $0x6f,-0x1(%rbp)
   81cdb:	8b 45 ec             	mov    -0x14(%rbp),%eax
   81cde:	3d 0b ff ff ff       	cmp    $0xffffff0b,%eax
   81ce3:	75 0a                	jne    81cef <phase_3+0x103>
   81ce5:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
   81ce9:	0f 84 e0 00 00 00    	je     81dcf <phase_3+0x1e3>
   81cef:	e8 cb c2 ff ff       	call   7dfbf <explode_bomb>
   81cf4:	e9 d6 00 00 00       	jmp    81dcf <phase_3+0x1e3>
   81cf9:	c6 45 ff 76          	movb   $0x76,-0x1(%rbp)
   81cfd:	8b 45 ec             	mov    -0x14(%rbp),%eax
   81d00:	3d b7 fe ff ff       	cmp    $0xfffffeb7,%eax
   81d05:	75 0a                	jne    81d11 <phase_3+0x125>
   81d07:	83 7d f8 01          	cmpl   $0x1,-0x8(%rbp)
   81d0b:	0f 84 c1 00 00 00    	je     81dd2 <phase_3+0x1e6>
   81d11:	e8 a9 c2 ff ff       	call   7dfbf <explode_bomb>
   81d16:	e9 b7 00 00 00       	jmp    81dd2 <phase_3+0x1e6>
   81d1b:	c6 45 ff 65          	movb   $0x65,-0x1(%rbp)
   81d1f:	8b 45 ec             	mov    -0x14(%rbp),%eax
   81d22:	3d 6d fe ff ff       	cmp    $0xfffffe6d,%eax
   81d27:	75 0a                	jne    81d33 <phase_3+0x147>
   81d29:	83 7d f8 02          	cmpl   $0x2,-0x8(%rbp)
   81d2d:	0f 84 a2 00 00 00    	je     81dd5 <phase_3+0x1e9>
   81d33:	e8 87 c2 ff ff       	call   7dfbf <explode_bomb>
   81d38:	e9 98 00 00 00       	jmp    81dd5 <phase_3+0x1e9>
   81d3d:	c6 45 ff 72          	movb   $0x72,-0x1(%rbp)
   81d41:	8b 45 ec             	mov    -0x14(%rbp),%eax
   81d44:	3d 0a fe ff ff       	cmp    $0xfffffe0a,%eax
   81d49:	75 0a                	jne    81d55 <phase_3+0x169>
   81d4b:	83 7d f8 03          	cmpl   $0x3,-0x8(%rbp)
   81d4f:	0f 84 83 00 00 00    	je     81dd8 <phase_3+0x1ec>
   81d55:	e8 65 c2 ff ff       	call   7dfbf <explode_bomb>
   81d5a:	eb 7c                	jmp    81dd8 <phase_3+0x1ec>
   81d5c:	c6 45 ff 66          	movb   $0x66,-0x1(%rbp)
   81d60:	8b 45 ec             	mov    -0x14(%rbp),%eax
   81d63:	3d 3f ff ff ff       	cmp    $0xffffff3f,%eax
   81d68:	75 06                	jne    81d70 <phase_3+0x184>
   81d6a:	83 7d f8 04          	cmpl   $0x4,-0x8(%rbp)
   81d6e:	74 6b                	je     81ddb <phase_3+0x1ef>
   81d70:	e8 4a c2 ff ff       	call   7dfbf <explode_bomb>
   81d75:	eb 64                	jmp    81ddb <phase_3+0x1ef>
   81d77:	c6 45 ff 6c          	movb   $0x6c,-0x1(%rbp)
   81d7b:	8b 45 ec             	mov    -0x14(%rbp),%eax
   81d7e:	3d 0f fe ff ff       	cmp    $0xfffffe0f,%eax
   81d83:	75 06                	jne    81d8b <phase_3+0x19f>
   81d85:	83 7d f8 05          	cmpl   $0x5,-0x8(%rbp)
   81d89:	74 53                	je     81dde <phase_3+0x1f2>
   81d8b:	e8 2f c2 ff ff       	call   7dfbf <explode_bomb>
   81d90:	eb 4c                	jmp    81dde <phase_3+0x1f2>
   81d92:	c6 45 ff 6f          	movb   $0x6f,-0x1(%rbp)
   81d96:	8b 45 ec             	mov    -0x14(%rbp),%eax
   81d99:	3d 19 ff ff ff       	cmp    $0xffffff19,%eax
   81d9e:	75 06                	jne    81da6 <phase_3+0x1ba>
   81da0:	83 7d f8 06          	cmpl   $0x6,-0x8(%rbp)
   81da4:	74 3b                	je     81de1 <phase_3+0x1f5>
   81da6:	e8 14 c2 ff ff       	call   7dfbf <explode_bomb>
   81dab:	eb 34                	jmp    81de1 <phase_3+0x1f5>
   81dad:	c6 45 ff 77          	movb   $0x77,-0x1(%rbp)
   81db1:	8b 45 ec             	mov    -0x14(%rbp),%eax
   81db4:	3d d8 fe ff ff       	cmp    $0xfffffed8,%eax
   81db9:	75 06                	jne    81dc1 <phase_3+0x1d5>
   81dbb:	83 7d f8 07          	cmpl   $0x7,-0x8(%rbp)
   81dbf:	74 23                	je     81de4 <phase_3+0x1f8>
   81dc1:	e8 f9 c1 ff ff       	call   7dfbf <explode_bomb>
   81dc6:	eb 1c                	jmp    81de4 <phase_3+0x1f8>
   81dc8:	e8 f2 c1 ff ff       	call   7dfbf <explode_bomb>
   81dcd:	eb 16                	jmp    81de5 <phase_3+0x1f9>
   81dcf:	90                   	nop
   81dd0:	eb 13                	jmp    81de5 <phase_3+0x1f9>
   81dd2:	90                   	nop
   81dd3:	eb 10                	jmp    81de5 <phase_3+0x1f9>
   81dd5:	90                   	nop
   81dd6:	eb 0d                	jmp    81de5 <phase_3+0x1f9>
   81dd8:	90                   	nop
   81dd9:	eb 0a                	jmp    81de5 <phase_3+0x1f9>
   81ddb:	90                   	nop
   81ddc:	eb 07                	jmp    81de5 <phase_3+0x1f9>
   81dde:	90                   	nop
   81ddf:	eb 04                	jmp    81de5 <phase_3+0x1f9>
   81de1:	90                   	nop
   81de2:	eb 01                	jmp    81de5 <phase_3+0x1f9>
   81de4:	90                   	nop
   81de5:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   81de9:	38 45 ff             	cmp    %al,-0x1(%rbp)
   81dec:	74 05                	je     81df3 <phase_3+0x207>
   81dee:	e8 cc c1 ff ff       	call   7dfbf <explode_bomb>
   81df3:	8b 55 f0             	mov    -0x10(%rbp),%edx
   81df6:	8b 45 ec             	mov    -0x14(%rbp),%eax
   81df9:	01 d0                	add    %edx,%eax
   81dfb:	89 05 4f 9b 42 00    	mov    %eax,0x429b4f(%rip)        # 4ab950 <TE+0x10>
   81e01:	90                   	nop
   81e02:	c9                   	leave
   81e03:	c3                   	ret

Disassembly of section .fini:
