
./bomb++:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .plt.got:

Disassembly of section .plt.sec:

Disassembly of section .text:

0000000000081f0e <phase_5>:
   81f0e:	f3 0f 1e fa          	endbr64
   81f12:	55                   	push   %rbp
   81f13:	48 89 e5             	mov    %rsp,%rbp
   81f16:	53                   	push   %rbx
   81f17:	48 83 ec 38          	sub    $0x38,%rsp
   81f1b:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   81f1f:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   81f26:	00 
   81f27:	48 8d 4d d4          	lea    -0x2c(%rbp),%rcx
   81f2b:	48 8d 55 d9          	lea    -0x27(%rbp),%rdx
   81f2f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   81f33:	48 8d 35 a7 d7 2c 00 	lea    0x2cd7a7(%rip),%rsi        # 34f6e1 <_ZSt19piecewise_construct+0x6dd>
   81f3a:	48 89 c7             	mov    %rax,%rdi
   81f3d:	b8 00 00 00 00       	mov    $0x0,%eax
   81f42:	e8 e9 3f ff ff       	call   75f30 <__isoc99_sscanf@plt>
   81f47:	83 f8 02             	cmp    $0x2,%eax
   81f4a:	0f 95 c0             	setne  %al
   81f4d:	84 c0                	test   %al,%al
   81f4f:	74 05                	je     81f56 <phase_5+0x48>
   81f51:	e8 69 c0 ff ff       	call   7dfbf <explode_bomb>
   81f56:	48 8d 45 d9          	lea    -0x27(%rbp),%rax
   81f5a:	48 8d 15 86 d7 2c 00 	lea    0x2cd786(%rip),%rdx        # 34f6e7 <_ZSt19piecewise_construct+0x6e3>
   81f61:	48 89 d6             	mov    %rdx,%rsi
   81f64:	48 89 c7             	mov    %rax,%rdi
   81f67:	e8 94 3d ff ff       	call   75d00 <strcmp@plt>
   81f6c:	85 c0                	test   %eax,%eax
   81f6e:	75 1b                	jne    81f8b <phase_5+0x7d>
   81f70:	bf 10 00 00 00       	mov    $0x10,%edi
   81f75:	e8 76 00 22 00       	call   2a1ff0 <_Znwm>
   81f7a:	48 89 c3             	mov    %rax,%rbx
   81f7d:	48 89 df             	mov    %rbx,%rdi
   81f80:	e8 ad 08 00 00       	call   82832 <_ZN11Bomb_EndingC1Ev>
   81f85:	48 89 5d e8          	mov    %rbx,-0x18(%rbp)
   81f89:	eb 6f                	jmp    81ffa <phase_5+0xec>
   81f8b:	48 8d 45 d9          	lea    -0x27(%rbp),%rax
   81f8f:	48 8d 15 54 d7 2c 00 	lea    0x2cd754(%rip),%rdx        # 34f6ea <_ZSt19piecewise_construct+0x6e6>
   81f96:	48 89 d6             	mov    %rdx,%rsi
   81f99:	48 89 c7             	mov    %rax,%rdi
   81f9c:	e8 5f 3d ff ff       	call   75d00 <strcmp@plt>
   81fa1:	85 c0                	test   %eax,%eax
   81fa3:	75 1b                	jne    81fc0 <phase_5+0xb2>
   81fa5:	bf 10 00 00 00       	mov    $0x10,%edi
   81faa:	e8 41 00 22 00       	call   2a1ff0 <_Znwm>
   81faf:	48 89 c3             	mov    %rax,%rbx
   81fb2:	48 89 df             	mov    %rbx,%rdi
   81fb5:	e8 f4 08 00 00       	call   828ae <_ZN13Normal_EndingC1Ev>
   81fba:	48 89 5d e8          	mov    %rbx,-0x18(%rbp)
   81fbe:	eb 3a                	jmp    81ffa <phase_5+0xec>
   81fc0:	48 8d 45 d9          	lea    -0x27(%rbp),%rax
   81fc4:	48 8d 15 22 d7 2c 00 	lea    0x2cd722(%rip),%rdx        # 34f6ed <_ZSt19piecewise_construct+0x6e9>
   81fcb:	48 89 d6             	mov    %rdx,%rsi
   81fce:	48 89 c7             	mov    %rax,%rdi
   81fd1:	e8 2a 3d ff ff       	call   75d00 <strcmp@plt>
   81fd6:	85 c0                	test   %eax,%eax
   81fd8:	75 1b                	jne    81ff5 <phase_5+0xe7>
   81fda:	bf 10 00 00 00       	mov    $0x10,%edi
   81fdf:	e8 0c 00 22 00       	call   2a1ff0 <_Znwm>
   81fe4:	48 89 c3             	mov    %rax,%rbx
   81fe7:	48 89 df             	mov    %rbx,%rdi
   81fea:	e8 3b 09 00 00       	call   8292a <_ZN11True_EndingC1Ev>
   81fef:	48 89 5d e8          	mov    %rbx,-0x18(%rbp)
   81ff3:	eb 05                	jmp    81ffa <phase_5+0xec>
   81ff5:	e8 c5 bf ff ff       	call   7dfbf <explode_bomb>
   81ffa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   81ffe:	48 8b 00             	mov    (%rax),%rax
   82001:	48 83 c0 10          	add    $0x10,%rax
   82005:	48 8b 08             	mov    (%rax),%rcx
   82008:	8b 55 d4             	mov    -0x2c(%rbp),%edx
   8200b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   8200f:	89 d6                	mov    %edx,%esi
   82011:	48 89 c7             	mov    %rax,%rdi
   82014:	ff d1                	call   *%rcx
   82016:	85 c0                	test   %eax,%eax
   82018:	74 10                	je     8202a <phase_5+0x11c>
   8201a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   8201e:	48 89 c7             	mov    %rax,%rdi
   82021:	e8 c2 07 00 00       	call   827e8 <_ZN9World_End18is_phase5_passableEv>
   82026:	85 c0                	test   %eax,%eax
   82028:	75 07                	jne    82031 <phase_5+0x123>
   8202a:	b8 01 00 00 00       	mov    $0x1,%eax
   8202f:	eb 05                	jmp    82036 <phase_5+0x128>
   82031:	b8 00 00 00 00       	mov    $0x0,%eax
   82036:	84 c0                	test   %al,%al
   82038:	74 05                	je     8203f <phase_5+0x131>
   8203a:	e8 80 bf ff ff       	call   7dfbf <explode_bomb>
   8203f:	90                   	nop
   82040:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   82044:	c9                   	leave
   82045:	c3                   	ret

Disassembly of section .fini:
 