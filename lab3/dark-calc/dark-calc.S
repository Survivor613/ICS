
dark-calc:     file format elf64-x86-64


Disassembly of section .init:

0000000000401000 <_init>:
  401000:	f3 0f 1e fa          	endbr64
  401004:	48 83 ec 08          	sub    $0x8,%rsp
  401008:	48 8b 05 d1 2f 00 00 	mov    0x2fd1(%rip),%rax        # 403fe0 <__gmon_start__@Base>
  40100f:	48 85 c0             	test   %rax,%rax
  401012:	74 02                	je     401016 <_init+0x16>
  401014:	ff d0                	call   *%rax
  401016:	48 83 c4 08          	add    $0x8,%rsp
  40101a:	c3                   	ret

Disassembly of section .plt:

0000000000401020 <strncpy@plt-0x10>:
  401020:	ff 35 ca 2f 00 00    	push   0x2fca(%rip)        # 403ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
  401026:	ff 25 cc 2f 00 00    	jmp    *0x2fcc(%rip)        # 403ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
  40102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401030 <strncpy@plt>:
  401030:	ff 25 ca 2f 00 00    	jmp    *0x2fca(%rip)        # 404000 <strncpy@GLIBC_2.2.5>
  401036:	68 00 00 00 00       	push   $0x0
  40103b:	e9 e0 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401040 <puts@plt>:
  401040:	ff 25 c2 2f 00 00    	jmp    *0x2fc2(%rip)        # 404008 <puts@GLIBC_2.2.5>
  401046:	68 01 00 00 00       	push   $0x1
  40104b:	e9 d0 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401050 <strlen@plt>:
  401050:	ff 25 ba 2f 00 00    	jmp    *0x2fba(%rip)        # 404010 <strlen@GLIBC_2.2.5>
  401056:	68 02 00 00 00       	push   $0x2
  40105b:	e9 c0 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401060 <system@plt>:
  401060:	ff 25 b2 2f 00 00    	jmp    *0x2fb2(%rip)        # 404018 <system@GLIBC_2.2.5>
  401066:	68 03 00 00 00       	push   $0x3
  40106b:	e9 b0 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401070 <printf@plt>:
  401070:	ff 25 aa 2f 00 00    	jmp    *0x2faa(%rip)        # 404020 <printf@GLIBC_2.2.5>
  401076:	68 04 00 00 00       	push   $0x4
  40107b:	e9 a0 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401080 <gets@plt>:
  401080:	ff 25 a2 2f 00 00    	jmp    *0x2fa2(%rip)        # 404028 <gets@GLIBC_2.2.5>
  401086:	68 05 00 00 00       	push   $0x5
  40108b:	e9 90 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401090 <fflush@plt>:
  401090:	ff 25 9a 2f 00 00    	jmp    *0x2f9a(%rip)        # 404030 <fflush@GLIBC_2.2.5>
  401096:	68 06 00 00 00       	push   $0x6
  40109b:	e9 80 ff ff ff       	jmp    401020 <_init+0x20>

00000000004010a0 <exit@plt>:
  4010a0:	ff 25 92 2f 00 00    	jmp    *0x2f92(%rip)        # 404038 <exit@GLIBC_2.2.5>
  4010a6:	68 07 00 00 00       	push   $0x7
  4010ab:	e9 70 ff ff ff       	jmp    401020 <_init+0x20>

Disassembly of section .text:

00000000004010b0 <_start>:
  4010b0:	f3 0f 1e fa          	endbr64
  4010b4:	31 ed                	xor    %ebp,%ebp
  4010b6:	49 89 d1             	mov    %rdx,%r9
  4010b9:	5e                   	pop    %rsi
  4010ba:	48 89 e2             	mov    %rsp,%rdx
  4010bd:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4010c1:	50                   	push   %rax
  4010c2:	54                   	push   %rsp
  4010c3:	45 31 c0             	xor    %r8d,%r8d
  4010c6:	31 c9                	xor    %ecx,%ecx
  4010c8:	48 c7 c7 f1 12 40 00 	mov    $0x4012f1,%rdi
  4010cf:	ff 15 03 2f 00 00    	call   *0x2f03(%rip)        # 403fd8 <__libc_start_main@GLIBC_2.34>
  4010d5:	f4                   	hlt
  4010d6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  4010dd:	00 00 00 

00000000004010e0 <_dl_relocate_static_pie>:
  4010e0:	f3 0f 1e fa          	endbr64
  4010e4:	c3                   	ret
  4010e5:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  4010ec:	00 00 00 
  4010ef:	90                   	nop

00000000004010f0 <deregister_tm_clones>:
  4010f0:	b8 50 40 40 00       	mov    $0x404050,%eax
  4010f5:	48 3d 50 40 40 00    	cmp    $0x404050,%rax
  4010fb:	74 13                	je     401110 <deregister_tm_clones+0x20>
  4010fd:	b8 00 00 00 00       	mov    $0x0,%eax
  401102:	48 85 c0             	test   %rax,%rax
  401105:	74 09                	je     401110 <deregister_tm_clones+0x20>
  401107:	bf 50 40 40 00       	mov    $0x404050,%edi
  40110c:	ff e0                	jmp    *%rax
  40110e:	66 90                	xchg   %ax,%ax
  401110:	c3                   	ret
  401111:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  401118:	00 00 00 00 
  40111c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401120 <register_tm_clones>:
  401120:	be 50 40 40 00       	mov    $0x404050,%esi
  401125:	48 81 ee 50 40 40 00 	sub    $0x404050,%rsi
  40112c:	48 89 f0             	mov    %rsi,%rax
  40112f:	48 c1 ee 3f          	shr    $0x3f,%rsi
  401133:	48 c1 f8 03          	sar    $0x3,%rax
  401137:	48 01 c6             	add    %rax,%rsi
  40113a:	48 d1 fe             	sar    $1,%rsi
  40113d:	74 11                	je     401150 <register_tm_clones+0x30>
  40113f:	b8 00 00 00 00       	mov    $0x0,%eax
  401144:	48 85 c0             	test   %rax,%rax
  401147:	74 07                	je     401150 <register_tm_clones+0x30>
  401149:	bf 50 40 40 00       	mov    $0x404050,%edi
  40114e:	ff e0                	jmp    *%rax
  401150:	c3                   	ret
  401151:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  401158:	00 00 00 00 
  40115c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401160 <__do_global_dtors_aux>:
  401160:	f3 0f 1e fa          	endbr64
  401164:	80 3d ed 2e 00 00 00 	cmpb   $0x0,0x2eed(%rip)        # 404058 <completed.0>
  40116b:	75 13                	jne    401180 <__do_global_dtors_aux+0x20>
  40116d:	55                   	push   %rbp
  40116e:	48 89 e5             	mov    %rsp,%rbp
  401171:	e8 7a ff ff ff       	call   4010f0 <deregister_tm_clones>
  401176:	c6 05 db 2e 00 00 01 	movb   $0x1,0x2edb(%rip)        # 404058 <completed.0>
  40117d:	5d                   	pop    %rbp
  40117e:	c3                   	ret
  40117f:	90                   	nop
  401180:	c3                   	ret
  401181:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  401188:	00 00 00 00 
  40118c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401190 <frame_dummy>:
  401190:	f3 0f 1e fa          	endbr64
  401194:	eb 8a                	jmp    401120 <register_tm_clones>

0000000000401196 <eval>:
  401196:	f3 0f 1e fa          	endbr64
  40119a:	55                   	push   %rbp
  40119b:	48 89 e5             	mov    %rsp,%rbp
  40119e:	48 83 ec 10          	sub    $0x10,%rsp
  4011a2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  4011a6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4011aa:	48 89 c6             	mov    %rax,%rsi
  4011ad:	bf 14 20 40 00       	mov    $0x402014,%edi
  4011b2:	b8 00 00 00 00       	mov    $0x0,%eax
  4011b7:	e8 b4 fe ff ff       	call   401070 <printf@plt>
  4011bc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4011c0:	48 89 c7             	mov    %rax,%rdi
  4011c3:	e8 98 fe ff ff       	call   401060 <system@plt>
  4011c8:	48 8b 05 81 2e 00 00 	mov    0x2e81(%rip),%rax        # 404050 <stdout@GLIBC_2.2.5>
  4011cf:	48 89 c7             	mov    %rax,%rdi
  4011d2:	e8 b9 fe ff ff       	call   401090 <fflush@plt>
  4011d7:	90                   	nop
  4011d8:	c9                   	leave
  4011d9:	c3                   	ret

00000000004011da <grade_eval>:
  4011da:	f3 0f 1e fa          	endbr64
  4011de:	55                   	push   %rbp
  4011df:	48 89 e5             	mov    %rsp,%rbp
  4011e2:	48 83 ec 10          	sub    $0x10,%rsp
  4011e6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  4011e9:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  4011ed:	75 19                	jne    401208 <grade_eval+0x2e>
  4011ef:	b8 45 00 00 00       	mov    $0x45,%eax
  4011f4:	2b 45 fc             	sub    -0x4(%rbp),%eax
  4011f7:	89 c6                	mov    %eax,%esi
  4011f9:	bf 28 20 40 00       	mov    $0x402028,%edi
  4011fe:	b8 00 00 00 00       	mov    $0x0,%eax
  401203:	e8 68 fe ff ff       	call   401070 <printf@plt>
  401208:	48 8b 05 41 2e 00 00 	mov    0x2e41(%rip),%rax        # 404050 <stdout@GLIBC_2.2.5>
  40120f:	48 89 c7             	mov    %rax,%rdi
  401212:	e8 79 fe ff ff       	call   401090 <fflush@plt>
  401217:	90                   	nop
  401218:	c9                   	leave
  401219:	c3                   	ret

000000000040121a <input>:
  40121a:	f3 0f 1e fa          	endbr64
  40121e:	55                   	push   %rbp
  40121f:	48 89 e5             	mov    %rsp,%rbp
  401222:	48 83 ec 30          	sub    $0x30,%rsp
  401226:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  40122a:	be 0f 00 00 00       	mov    $0xf,%esi
  40122f:	bf 50 20 40 00       	mov    $0x402050,%edi
  401234:	b8 00 00 00 00       	mov    $0x0,%eax
  401239:	e8 32 fe ff ff       	call   401070 <printf@plt>
  40123e:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  401242:	48 89 c7             	mov    %rax,%rdi
  401245:	e8 36 fe ff ff       	call   401080 <gets@plt>
  40124a:	85 c0                	test   %eax,%eax
  40124c:	74 0b                	je     401259 <input+0x3f>
  40124e:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  401252:	0f b6 00             	movzbl (%rax),%eax
  401255:	84 c0                	test   %al,%al
  401257:	75 14                	jne    40126d <input+0x53>
  401259:	bf 78 20 40 00       	mov    $0x402078,%edi
  40125e:	e8 dd fd ff ff       	call   401040 <puts@plt>
  401263:	bf 00 00 00 00       	mov    $0x0,%edi
  401268:	e8 33 fe ff ff       	call   4010a0 <exit@plt>
  40126d:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  401271:	48 89 c7             	mov    %rax,%rdi
  401274:	e8 d7 fd ff ff       	call   401050 <strlen@plt>
  401279:	48 83 f8 0f          	cmp    $0xf,%rax
  40127d:	77 0e                	ja     40128d <input+0x73>
  40127f:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  401283:	48 89 c7             	mov    %rax,%rdi
  401286:	e8 c5 fd ff ff       	call   401050 <strlen@plt>
  40128b:	eb 05                	jmp    401292 <input+0x78>
  40128d:	b8 0f 00 00 00       	mov    $0xf,%eax
  401292:	89 45 fc             	mov    %eax,-0x4(%rbp)
  401295:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  401299:	48 8b 15 68 0d 00 00 	mov    0xd68(%rip),%rdx        # 402008 <wrapper_front>
  4012a0:	48 89 10             	mov    %rdx,(%rax)
  4012a3:	0f b6 15 66 0d 00 00 	movzbl 0xd66(%rip),%edx        # 402010 <wrapper_front+0x8>
  4012aa:	88 50 08             	mov    %dl,0x8(%rax)
  4012ad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  4012b0:	48 98                	cltq
  4012b2:	48 8d 50 08          	lea    0x8(%rax),%rdx
  4012b6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4012ba:	48 01 d0             	add    %rdx,%rax
  4012bd:	0f b7 15 4d 0d 00 00 	movzwl 0xd4d(%rip),%edx        # 402011 <wrapper_back>
  4012c4:	66 89 10             	mov    %dx,(%rax)
  4012c7:	0f b6 15 45 0d 00 00 	movzbl 0xd45(%rip),%edx        # 402013 <wrapper_back+0x2>
  4012ce:	88 50 02             	mov    %dl,0x2(%rax)
  4012d1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  4012d4:	48 63 d0             	movslq %eax,%rdx
  4012d7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4012db:	48 8d 48 08          	lea    0x8(%rax),%rcx
  4012df:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  4012e3:	48 89 c6             	mov    %rax,%rsi
  4012e6:	48 89 cf             	mov    %rcx,%rdi
  4012e9:	e8 42 fd ff ff       	call   401030 <strncpy@plt>
  4012ee:	90                   	nop
  4012ef:	c9                   	leave
  4012f0:	c3                   	ret

00000000004012f1 <main>:
  4012f1:	f3 0f 1e fa          	endbr64
  4012f5:	55                   	push   %rbp
  4012f6:	48 89 e5             	mov    %rsp,%rbp
  4012f9:	bf 60 40 40 00       	mov    $0x404060,%edi
  4012fe:	e8 17 ff ff ff       	call   40121a <input>
  401303:	bf 60 40 40 00       	mov    $0x404060,%edi
  401308:	e8 89 fe ff ff       	call   401196 <eval>
  40130d:	90                   	nop
  40130e:	eb e9                	jmp    4012f9 <main+0x8>

Disassembly of section .fini:

0000000000401310 <_fini>:
  401310:	f3 0f 1e fa          	endbr64
  401314:	48 83 ec 08          	sub    $0x8,%rsp
  401318:	48 83 c4 08          	add    $0x8,%rsp
  40131c:	c3                   	ret
