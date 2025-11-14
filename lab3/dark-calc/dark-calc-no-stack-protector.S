
dark-calc-no-stack-protector:     file format elf64-x86-64


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

0000000000401020 <.plt>:
  401020:	ff 35 ca 2f 00 00    	push   0x2fca(%rip)        # 403ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
  401026:	ff 25 cc 2f 00 00    	jmp    *0x2fcc(%rip)        # 403ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
  40102c:	0f 1f 40 00          	nopl   0x0(%rax)
  401030:	f3 0f 1e fa          	endbr64
  401034:	68 00 00 00 00       	push   $0x0
  401039:	e9 e2 ff ff ff       	jmp    401020 <_init+0x20>
  40103e:	66 90                	xchg   %ax,%ax
  401040:	f3 0f 1e fa          	endbr64
  401044:	68 01 00 00 00       	push   $0x1
  401049:	e9 d2 ff ff ff       	jmp    401020 <_init+0x20>
  40104e:	66 90                	xchg   %ax,%ax
  401050:	f3 0f 1e fa          	endbr64
  401054:	68 02 00 00 00       	push   $0x2
  401059:	e9 c2 ff ff ff       	jmp    401020 <_init+0x20>
  40105e:	66 90                	xchg   %ax,%ax
  401060:	f3 0f 1e fa          	endbr64
  401064:	68 03 00 00 00       	push   $0x3
  401069:	e9 b2 ff ff ff       	jmp    401020 <_init+0x20>
  40106e:	66 90                	xchg   %ax,%ax
  401070:	f3 0f 1e fa          	endbr64
  401074:	68 04 00 00 00       	push   $0x4
  401079:	e9 a2 ff ff ff       	jmp    401020 <_init+0x20>
  40107e:	66 90                	xchg   %ax,%ax
  401080:	f3 0f 1e fa          	endbr64
  401084:	68 05 00 00 00       	push   $0x5
  401089:	e9 92 ff ff ff       	jmp    401020 <_init+0x20>
  40108e:	66 90                	xchg   %ax,%ax
  401090:	f3 0f 1e fa          	endbr64
  401094:	68 06 00 00 00       	push   $0x6
  401099:	e9 82 ff ff ff       	jmp    401020 <_init+0x20>
  40109e:	66 90                	xchg   %ax,%ax
  4010a0:	f3 0f 1e fa          	endbr64
  4010a4:	68 07 00 00 00       	push   $0x7
  4010a9:	e9 72 ff ff ff       	jmp    401020 <_init+0x20>
  4010ae:	66 90                	xchg   %ax,%ax

Disassembly of section .plt.sec:

00000000004010b0 <strncpy@plt>:
  4010b0:	f3 0f 1e fa          	endbr64
  4010b4:	ff 25 46 2f 00 00    	jmp    *0x2f46(%rip)        # 404000 <strncpy@GLIBC_2.2.5>
  4010ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004010c0 <puts@plt>:
  4010c0:	f3 0f 1e fa          	endbr64
  4010c4:	ff 25 3e 2f 00 00    	jmp    *0x2f3e(%rip)        # 404008 <puts@GLIBC_2.2.5>
  4010ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004010d0 <strlen@plt>:
  4010d0:	f3 0f 1e fa          	endbr64
  4010d4:	ff 25 36 2f 00 00    	jmp    *0x2f36(%rip)        # 404010 <strlen@GLIBC_2.2.5>
  4010da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004010e0 <system@plt>:
  4010e0:	f3 0f 1e fa          	endbr64
  4010e4:	ff 25 2e 2f 00 00    	jmp    *0x2f2e(%rip)        # 404018 <system@GLIBC_2.2.5>
  4010ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004010f0 <printf@plt>:
  4010f0:	f3 0f 1e fa          	endbr64
  4010f4:	ff 25 26 2f 00 00    	jmp    *0x2f26(%rip)        # 404020 <printf@GLIBC_2.2.5>
  4010fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401100 <gets@plt>:
  401100:	f3 0f 1e fa          	endbr64
  401104:	ff 25 1e 2f 00 00    	jmp    *0x2f1e(%rip)        # 404028 <gets@GLIBC_2.2.5>
  40110a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401110 <fflush@plt>:
  401110:	f3 0f 1e fa          	endbr64
  401114:	ff 25 16 2f 00 00    	jmp    *0x2f16(%rip)        # 404030 <fflush@GLIBC_2.2.5>
  40111a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401120 <exit@plt>:
  401120:	f3 0f 1e fa          	endbr64
  401124:	ff 25 0e 2f 00 00    	jmp    *0x2f0e(%rip)        # 404038 <exit@GLIBC_2.2.5>
  40112a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000401130 <_start>:
  401130:	f3 0f 1e fa          	endbr64
  401134:	31 ed                	xor    %ebp,%ebp
  401136:	49 89 d1             	mov    %rdx,%r9
  401139:	5e                   	pop    %rsi
  40113a:	48 89 e2             	mov    %rsp,%rdx
  40113d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  401141:	50                   	push   %rax
  401142:	54                   	push   %rsp
  401143:	45 31 c0             	xor    %r8d,%r8d
  401146:	31 c9                	xor    %ecx,%ecx
  401148:	48 c7 c7 71 13 40 00 	mov    $0x401371,%rdi
  40114f:	ff 15 83 2e 00 00    	call   *0x2e83(%rip)        # 403fd8 <__libc_start_main@GLIBC_2.34>
  401155:	f4                   	hlt
  401156:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40115d:	00 00 00 

0000000000401160 <_dl_relocate_static_pie>:
  401160:	f3 0f 1e fa          	endbr64
  401164:	c3                   	ret
  401165:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40116c:	00 00 00 
  40116f:	90                   	nop

0000000000401170 <deregister_tm_clones>:
  401170:	b8 50 40 40 00       	mov    $0x404050,%eax
  401175:	48 3d 50 40 40 00    	cmp    $0x404050,%rax
  40117b:	74 13                	je     401190 <deregister_tm_clones+0x20>
  40117d:	b8 00 00 00 00       	mov    $0x0,%eax
  401182:	48 85 c0             	test   %rax,%rax
  401185:	74 09                	je     401190 <deregister_tm_clones+0x20>
  401187:	bf 50 40 40 00       	mov    $0x404050,%edi
  40118c:	ff e0                	jmp    *%rax
  40118e:	66 90                	xchg   %ax,%ax
  401190:	c3                   	ret
  401191:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  401198:	00 00 00 00 
  40119c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004011a0 <register_tm_clones>:
  4011a0:	be 50 40 40 00       	mov    $0x404050,%esi
  4011a5:	48 81 ee 50 40 40 00 	sub    $0x404050,%rsi
  4011ac:	48 89 f0             	mov    %rsi,%rax
  4011af:	48 c1 ee 3f          	shr    $0x3f,%rsi
  4011b3:	48 c1 f8 03          	sar    $0x3,%rax
  4011b7:	48 01 c6             	add    %rax,%rsi
  4011ba:	48 d1 fe             	sar    $1,%rsi
  4011bd:	74 11                	je     4011d0 <register_tm_clones+0x30>
  4011bf:	b8 00 00 00 00       	mov    $0x0,%eax
  4011c4:	48 85 c0             	test   %rax,%rax
  4011c7:	74 07                	je     4011d0 <register_tm_clones+0x30>
  4011c9:	bf 50 40 40 00       	mov    $0x404050,%edi
  4011ce:	ff e0                	jmp    *%rax
  4011d0:	c3                   	ret
  4011d1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  4011d8:	00 00 00 00 
  4011dc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004011e0 <__do_global_dtors_aux>:
  4011e0:	f3 0f 1e fa          	endbr64
  4011e4:	80 3d 6d 2e 00 00 00 	cmpb   $0x0,0x2e6d(%rip)        # 404058 <completed.0>
  4011eb:	75 13                	jne    401200 <__do_global_dtors_aux+0x20>
  4011ed:	55                   	push   %rbp
  4011ee:	48 89 e5             	mov    %rsp,%rbp
  4011f1:	e8 7a ff ff ff       	call   401170 <deregister_tm_clones>
  4011f6:	c6 05 5b 2e 00 00 01 	movb   $0x1,0x2e5b(%rip)        # 404058 <completed.0>
  4011fd:	5d                   	pop    %rbp
  4011fe:	c3                   	ret
  4011ff:	90                   	nop
  401200:	c3                   	ret
  401201:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  401208:	00 00 00 00 
  40120c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401210 <frame_dummy>:
  401210:	f3 0f 1e fa          	endbr64
  401214:	eb 8a                	jmp    4011a0 <register_tm_clones>

0000000000401216 <eval>:
  401216:	f3 0f 1e fa          	endbr64
  40121a:	55                   	push   %rbp
  40121b:	48 89 e5             	mov    %rsp,%rbp
  40121e:	48 83 ec 10          	sub    $0x10,%rsp
  401222:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  401226:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40122a:	48 89 c6             	mov    %rax,%rsi
  40122d:	bf 14 20 40 00       	mov    $0x402014,%edi
  401232:	b8 00 00 00 00       	mov    $0x0,%eax
  401237:	e8 b4 fe ff ff       	call   4010f0 <printf@plt>
  40123c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401240:	48 89 c7             	mov    %rax,%rdi
  401243:	e8 98 fe ff ff       	call   4010e0 <system@plt>
  401248:	48 8b 05 01 2e 00 00 	mov    0x2e01(%rip),%rax        # 404050 <stdout@GLIBC_2.2.5>
  40124f:	48 89 c7             	mov    %rax,%rdi
  401252:	e8 b9 fe ff ff       	call   401110 <fflush@plt>
  401257:	90                   	nop
  401258:	c9                   	leave
  401259:	c3                   	ret

000000000040125a <grade_eval>:
  40125a:	f3 0f 1e fa          	endbr64
  40125e:	55                   	push   %rbp
  40125f:	48 89 e5             	mov    %rsp,%rbp
  401262:	48 83 ec 10          	sub    $0x10,%rsp
  401266:	89 7d fc             	mov    %edi,-0x4(%rbp)
  401269:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  40126d:	75 19                	jne    401288 <grade_eval+0x2e>
  40126f:	b8 45 00 00 00       	mov    $0x45,%eax
  401274:	2b 45 fc             	sub    -0x4(%rbp),%eax
  401277:	89 c6                	mov    %eax,%esi
  401279:	bf 28 20 40 00       	mov    $0x402028,%edi
  40127e:	b8 00 00 00 00       	mov    $0x0,%eax
  401283:	e8 68 fe ff ff       	call   4010f0 <printf@plt>
  401288:	48 8b 05 c1 2d 00 00 	mov    0x2dc1(%rip),%rax        # 404050 <stdout@GLIBC_2.2.5>
  40128f:	48 89 c7             	mov    %rax,%rdi
  401292:	e8 79 fe ff ff       	call   401110 <fflush@plt>
  401297:	90                   	nop
  401298:	c9                   	leave
  401299:	c3                   	ret

000000000040129a <input>:
  40129a:	f3 0f 1e fa          	endbr64
  40129e:	55                   	push   %rbp
  40129f:	48 89 e5             	mov    %rsp,%rbp
  4012a2:	48 83 ec 30          	sub    $0x30,%rsp
  4012a6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  4012aa:	be 0f 00 00 00       	mov    $0xf,%esi
  4012af:	bf 50 20 40 00       	mov    $0x402050,%edi
  4012b4:	b8 00 00 00 00       	mov    $0x0,%eax
  4012b9:	e8 32 fe ff ff       	call   4010f0 <printf@plt>
  4012be:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  4012c2:	48 89 c7             	mov    %rax,%rdi
  4012c5:	e8 36 fe ff ff       	call   401100 <gets@plt>
  4012ca:	85 c0                	test   %eax,%eax
  4012cc:	74 0b                	je     4012d9 <input+0x3f>
  4012ce:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  4012d2:	0f b6 00             	movzbl (%rax),%eax
  4012d5:	84 c0                	test   %al,%al
  4012d7:	75 14                	jne    4012ed <input+0x53>
  4012d9:	bf 78 20 40 00       	mov    $0x402078,%edi
  4012de:	e8 dd fd ff ff       	call   4010c0 <puts@plt>
  4012e3:	bf 00 00 00 00       	mov    $0x0,%edi
  4012e8:	e8 33 fe ff ff       	call   401120 <exit@plt>
  4012ed:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  4012f1:	48 89 c7             	mov    %rax,%rdi
  4012f4:	e8 d7 fd ff ff       	call   4010d0 <strlen@plt>
  4012f9:	48 83 f8 0f          	cmp    $0xf,%rax
  4012fd:	77 0e                	ja     40130d <input+0x73>
  4012ff:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  401303:	48 89 c7             	mov    %rax,%rdi
  401306:	e8 c5 fd ff ff       	call   4010d0 <strlen@plt>
  40130b:	eb 05                	jmp    401312 <input+0x78>
  40130d:	b8 0f 00 00 00       	mov    $0xf,%eax
  401312:	89 45 fc             	mov    %eax,-0x4(%rbp)
  401315:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  401319:	48 8b 15 e8 0c 00 00 	mov    0xce8(%rip),%rdx        # 402008 <wrapper_front>
  401320:	48 89 10             	mov    %rdx,(%rax)
  401323:	0f b6 15 e6 0c 00 00 	movzbl 0xce6(%rip),%edx        # 402010 <wrapper_front+0x8>
  40132a:	88 50 08             	mov    %dl,0x8(%rax)
  40132d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  401330:	48 98                	cltq
  401332:	48 8d 50 08          	lea    0x8(%rax),%rdx
  401336:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  40133a:	48 01 d0             	add    %rdx,%rax
  40133d:	0f b7 15 cd 0c 00 00 	movzwl 0xccd(%rip),%edx        # 402011 <wrapper_back>
  401344:	66 89 10             	mov    %dx,(%rax)
  401347:	0f b6 15 c5 0c 00 00 	movzbl 0xcc5(%rip),%edx        # 402013 <wrapper_back+0x2>
  40134e:	88 50 02             	mov    %dl,0x2(%rax)
  401351:	8b 45 fc             	mov    -0x4(%rbp),%eax
  401354:	48 63 d0             	movslq %eax,%rdx
  401357:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  40135b:	48 8d 48 08          	lea    0x8(%rax),%rcx
  40135f:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  401363:	48 89 c6             	mov    %rax,%rsi
  401366:	48 89 cf             	mov    %rcx,%rdi
  401369:	e8 42 fd ff ff       	call   4010b0 <strncpy@plt>
  40136e:	90                   	nop
  40136f:	c9                   	leave
  401370:	c3                   	ret

0000000000401371 <main>:
  401371:	f3 0f 1e fa          	endbr64
  401375:	55                   	push   %rbp
  401376:	48 89 e5             	mov    %rsp,%rbp
  401379:	bf 60 40 40 00       	mov    $0x404060,%edi
  40137e:	e8 17 ff ff ff       	call   40129a <input>
  401383:	bf 60 40 40 00       	mov    $0x404060,%edi
  401388:	e8 89 fe ff ff       	call   401216 <eval>
  40138d:	90                   	nop
  40138e:	eb e9                	jmp    401379 <main+0x8>

Disassembly of section .fini:

0000000000401390 <_fini>:
  401390:	f3 0f 1e fa          	endbr64
  401394:	48 83 ec 08          	sub    $0x8,%rsp
  401398:	48 83 c4 08          	add    $0x8,%rsp
  40139c:	c3                   	ret
