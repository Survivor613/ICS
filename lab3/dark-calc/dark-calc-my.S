
dark-calc-my:     file format elf64-x86-64


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
  4010b0:	f3 0f 1e fa          	endbr64
  4010b4:	68 08 00 00 00       	push   $0x8
  4010b9:	e9 62 ff ff ff       	jmp    401020 <_init+0x20>
  4010be:	66 90                	xchg   %ax,%ax

Disassembly of section .plt.sec:

00000000004010c0 <strncpy@plt>:
  4010c0:	f3 0f 1e fa          	endbr64
  4010c4:	ff 25 36 2f 00 00    	jmp    *0x2f36(%rip)        # 404000 <strncpy@GLIBC_2.2.5>
  4010ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004010d0 <puts@plt>:
  4010d0:	f3 0f 1e fa          	endbr64
  4010d4:	ff 25 2e 2f 00 00    	jmp    *0x2f2e(%rip)        # 404008 <puts@GLIBC_2.2.5>
  4010da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004010e0 <strlen@plt>:
  4010e0:	f3 0f 1e fa          	endbr64
  4010e4:	ff 25 26 2f 00 00    	jmp    *0x2f26(%rip)        # 404010 <strlen@GLIBC_2.2.5>
  4010ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004010f0 <__stack_chk_fail@plt>:
  4010f0:	f3 0f 1e fa          	endbr64
  4010f4:	ff 25 1e 2f 00 00    	jmp    *0x2f1e(%rip)        # 404018 <__stack_chk_fail@GLIBC_2.4>
  4010fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401100 <system@plt>:
  401100:	f3 0f 1e fa          	endbr64
  401104:	ff 25 16 2f 00 00    	jmp    *0x2f16(%rip)        # 404020 <system@GLIBC_2.2.5>
  40110a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401110 <printf@plt>:
  401110:	f3 0f 1e fa          	endbr64
  401114:	ff 25 0e 2f 00 00    	jmp    *0x2f0e(%rip)        # 404028 <printf@GLIBC_2.2.5>
  40111a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401120 <gets@plt>:
  401120:	f3 0f 1e fa          	endbr64
  401124:	ff 25 06 2f 00 00    	jmp    *0x2f06(%rip)        # 404030 <gets@GLIBC_2.2.5>
  40112a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401130 <fflush@plt>:
  401130:	f3 0f 1e fa          	endbr64
  401134:	ff 25 fe 2e 00 00    	jmp    *0x2efe(%rip)        # 404038 <fflush@GLIBC_2.2.5>
  40113a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401140 <exit@plt>:
  401140:	f3 0f 1e fa          	endbr64
  401144:	ff 25 f6 2e 00 00    	jmp    *0x2ef6(%rip)        # 404040 <exit@GLIBC_2.2.5>
  40114a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000401150 <_start>:
  401150:	f3 0f 1e fa          	endbr64
  401154:	31 ed                	xor    %ebp,%ebp
  401156:	49 89 d1             	mov    %rdx,%r9
  401159:	5e                   	pop    %rsi
  40115a:	48 89 e2             	mov    %rsp,%rdx
  40115d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  401161:	50                   	push   %rax
  401162:	54                   	push   %rsp
  401163:	45 31 c0             	xor    %r8d,%r8d
  401166:	31 c9                	xor    %ecx,%ecx
  401168:	48 c7 c7 b4 13 40 00 	mov    $0x4013b4,%rdi
  40116f:	ff 15 63 2e 00 00    	call   *0x2e63(%rip)        # 403fd8 <__libc_start_main@GLIBC_2.34>
  401175:	f4                   	hlt
  401176:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40117d:	00 00 00 

0000000000401180 <_dl_relocate_static_pie>:
  401180:	f3 0f 1e fa          	endbr64
  401184:	c3                   	ret
  401185:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40118c:	00 00 00 
  40118f:	90                   	nop

0000000000401190 <deregister_tm_clones>:
  401190:	b8 58 40 40 00       	mov    $0x404058,%eax
  401195:	48 3d 58 40 40 00    	cmp    $0x404058,%rax
  40119b:	74 13                	je     4011b0 <deregister_tm_clones+0x20>
  40119d:	b8 00 00 00 00       	mov    $0x0,%eax
  4011a2:	48 85 c0             	test   %rax,%rax
  4011a5:	74 09                	je     4011b0 <deregister_tm_clones+0x20>
  4011a7:	bf 58 40 40 00       	mov    $0x404058,%edi
  4011ac:	ff e0                	jmp    *%rax
  4011ae:	66 90                	xchg   %ax,%ax
  4011b0:	c3                   	ret
  4011b1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  4011b8:	00 00 00 00 
  4011bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004011c0 <register_tm_clones>:
  4011c0:	be 58 40 40 00       	mov    $0x404058,%esi
  4011c5:	48 81 ee 58 40 40 00 	sub    $0x404058,%rsi
  4011cc:	48 89 f0             	mov    %rsi,%rax
  4011cf:	48 c1 ee 3f          	shr    $0x3f,%rsi
  4011d3:	48 c1 f8 03          	sar    $0x3,%rax
  4011d7:	48 01 c6             	add    %rax,%rsi
  4011da:	48 d1 fe             	sar    $1,%rsi
  4011dd:	74 11                	je     4011f0 <register_tm_clones+0x30>
  4011df:	b8 00 00 00 00       	mov    $0x0,%eax
  4011e4:	48 85 c0             	test   %rax,%rax
  4011e7:	74 07                	je     4011f0 <register_tm_clones+0x30>
  4011e9:	bf 58 40 40 00       	mov    $0x404058,%edi
  4011ee:	ff e0                	jmp    *%rax
  4011f0:	c3                   	ret
  4011f1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  4011f8:	00 00 00 00 
  4011fc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401200 <__do_global_dtors_aux>:
  401200:	f3 0f 1e fa          	endbr64
  401204:	80 3d 5d 2e 00 00 00 	cmpb   $0x0,0x2e5d(%rip)        # 404068 <completed.0>
  40120b:	75 13                	jne    401220 <__do_global_dtors_aux+0x20>
  40120d:	55                   	push   %rbp
  40120e:	48 89 e5             	mov    %rsp,%rbp
  401211:	e8 7a ff ff ff       	call   401190 <deregister_tm_clones>
  401216:	c6 05 4b 2e 00 00 01 	movb   $0x1,0x2e4b(%rip)        # 404068 <completed.0>
  40121d:	5d                   	pop    %rbp
  40121e:	c3                   	ret
  40121f:	90                   	nop
  401220:	c3                   	ret
  401221:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  401228:	00 00 00 00 
  40122c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401230 <frame_dummy>:
  401230:	f3 0f 1e fa          	endbr64
  401234:	eb 8a                	jmp    4011c0 <register_tm_clones>

0000000000401236 <eval>:
  401236:	f3 0f 1e fa          	endbr64
  40123a:	55                   	push   %rbp
  40123b:	48 89 e5             	mov    %rsp,%rbp
  40123e:	48 83 ec 10          	sub    $0x10,%rsp
  401242:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  401246:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40124a:	48 89 c6             	mov    %rax,%rsi
  40124d:	bf 14 20 40 00       	mov    $0x402014,%edi
  401252:	b8 00 00 00 00       	mov    $0x0,%eax
  401257:	e8 b4 fe ff ff       	call   401110 <printf@plt>
  40125c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401260:	48 89 c7             	mov    %rax,%rdi
  401263:	e8 98 fe ff ff       	call   401100 <system@plt>
  401268:	48 8b 05 f1 2d 00 00 	mov    0x2df1(%rip),%rax        # 404060 <stdout@GLIBC_2.2.5>
  40126f:	48 89 c7             	mov    %rax,%rdi
  401272:	e8 b9 fe ff ff       	call   401130 <fflush@plt>
  401277:	90                   	nop
  401278:	c9                   	leave
  401279:	c3                   	ret

000000000040127a <grade_eval>:
  40127a:	f3 0f 1e fa          	endbr64
  40127e:	55                   	push   %rbp
  40127f:	48 89 e5             	mov    %rsp,%rbp
  401282:	48 83 ec 10          	sub    $0x10,%rsp
  401286:	89 7d fc             	mov    %edi,-0x4(%rbp)
  401289:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  40128d:	75 19                	jne    4012a8 <grade_eval+0x2e>
  40128f:	b8 45 00 00 00       	mov    $0x45,%eax
  401294:	2b 45 fc             	sub    -0x4(%rbp),%eax
  401297:	89 c6                	mov    %eax,%esi
  401299:	bf 28 20 40 00       	mov    $0x402028,%edi
  40129e:	b8 00 00 00 00       	mov    $0x0,%eax
  4012a3:	e8 68 fe ff ff       	call   401110 <printf@plt>
  4012a8:	48 8b 05 b1 2d 00 00 	mov    0x2db1(%rip),%rax        # 404060 <stdout@GLIBC_2.2.5>
  4012af:	48 89 c7             	mov    %rax,%rdi
  4012b2:	e8 79 fe ff ff       	call   401130 <fflush@plt>
  4012b7:	90                   	nop
  4012b8:	c9                   	leave
  4012b9:	c3                   	ret

00000000004012ba <input>:
  4012ba:	f3 0f 1e fa          	endbr64
  4012be:	55                   	push   %rbp
  4012bf:	48 89 e5             	mov    %rsp,%rbp
  4012c2:	48 83 ec 40          	sub    $0x40,%rsp
  4012c6:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  4012ca:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4012d1:	00 00 
  4012d3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  4012d7:	31 c0                	xor    %eax,%eax
  4012d9:	be 0f 00 00 00       	mov    $0xf,%esi
  4012de:	bf 50 20 40 00       	mov    $0x402050,%edi
  4012e3:	b8 00 00 00 00       	mov    $0x0,%eax
  4012e8:	e8 23 fe ff ff       	call   401110 <printf@plt>
  4012ed:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  4012f1:	48 89 c7             	mov    %rax,%rdi
  4012f4:	e8 27 fe ff ff       	call   401120 <gets@plt>
  4012f9:	85 c0                	test   %eax,%eax
  4012fb:	74 0b                	je     401308 <input+0x4e>
  4012fd:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  401301:	0f b6 00             	movzbl (%rax),%eax
  401304:	84 c0                	test   %al,%al
  401306:	75 14                	jne    40131c <input+0x62>
  401308:	bf 78 20 40 00       	mov    $0x402078,%edi
  40130d:	e8 be fd ff ff       	call   4010d0 <puts@plt>
  401312:	bf 00 00 00 00       	mov    $0x0,%edi
  401317:	e8 24 fe ff ff       	call   401140 <exit@plt>
  40131c:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  401320:	48 89 c7             	mov    %rax,%rdi
  401323:	e8 b8 fd ff ff       	call   4010e0 <strlen@plt>
  401328:	48 83 f8 0f          	cmp    $0xf,%rax
  40132c:	77 0e                	ja     40133c <input+0x82>
  40132e:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  401332:	48 89 c7             	mov    %rax,%rdi
  401335:	e8 a6 fd ff ff       	call   4010e0 <strlen@plt>
  40133a:	eb 05                	jmp    401341 <input+0x87>
  40133c:	b8 0f 00 00 00       	mov    $0xf,%eax
  401341:	89 45 dc             	mov    %eax,-0x24(%rbp)
  401344:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  401348:	48 8b 15 b9 0c 00 00 	mov    0xcb9(%rip),%rdx        # 402008 <wrapper_front>
  40134f:	48 89 10             	mov    %rdx,(%rax)
  401352:	0f b6 15 b7 0c 00 00 	movzbl 0xcb7(%rip),%edx        # 402010 <wrapper_front+0x8>
  401359:	88 50 08             	mov    %dl,0x8(%rax)
  40135c:	8b 45 dc             	mov    -0x24(%rbp),%eax
  40135f:	48 98                	cltq
  401361:	48 8d 50 08          	lea    0x8(%rax),%rdx
  401365:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  401369:	48 01 d0             	add    %rdx,%rax
  40136c:	0f b7 15 9e 0c 00 00 	movzwl 0xc9e(%rip),%edx        # 402011 <wrapper_back>
  401373:	66 89 10             	mov    %dx,(%rax)
  401376:	0f b6 15 96 0c 00 00 	movzbl 0xc96(%rip),%edx        # 402013 <wrapper_back+0x2>
  40137d:	88 50 02             	mov    %dl,0x2(%rax)
  401380:	8b 45 dc             	mov    -0x24(%rbp),%eax
  401383:	48 63 d0             	movslq %eax,%rdx
  401386:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  40138a:	48 8d 48 08          	lea    0x8(%rax),%rcx
  40138e:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  401392:	48 89 c6             	mov    %rax,%rsi
  401395:	48 89 cf             	mov    %rcx,%rdi
  401398:	e8 23 fd ff ff       	call   4010c0 <strncpy@plt>
  40139d:	90                   	nop
  40139e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  4013a2:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
  4013a9:	00 00 
  4013ab:	74 05                	je     4013b2 <input+0xf8>
  4013ad:	e8 3e fd ff ff       	call   4010f0 <__stack_chk_fail@plt>
  4013b2:	c9                   	leave
  4013b3:	c3                   	ret

00000000004013b4 <main>:
  4013b4:	f3 0f 1e fa          	endbr64
  4013b8:	55                   	push   %rbp
  4013b9:	48 89 e5             	mov    %rsp,%rbp
  4013bc:	bf 70 40 40 00       	mov    $0x404070,%edi
  4013c1:	e8 f4 fe ff ff       	call   4012ba <input>
  4013c6:	bf 70 40 40 00       	mov    $0x404070,%edi
  4013cb:	e8 66 fe ff ff       	call   401236 <eval>
  4013d0:	90                   	nop
  4013d1:	eb e9                	jmp    4013bc <main+0x8>

Disassembly of section .fini:

00000000004013d4 <_fini>:
  4013d4:	f3 0f 1e fa          	endbr64
  4013d8:	48 83 ec 08          	sub    $0x8,%rsp
  4013dc:	48 83 c4 08          	add    $0x8,%rsp
  4013e0:	c3                   	ret
