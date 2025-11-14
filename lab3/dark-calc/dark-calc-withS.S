
dark-calc-withS:     file format elf64-x86-64


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

0000000000401060 <__stack_chk_fail@plt>:
  401060:	ff 25 b2 2f 00 00    	jmp    *0x2fb2(%rip)        # 404018 <__stack_chk_fail@GLIBC_2.4>
  401066:	68 03 00 00 00       	push   $0x3
  40106b:	e9 b0 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401070 <system@plt>:
  401070:	ff 25 aa 2f 00 00    	jmp    *0x2faa(%rip)        # 404020 <system@GLIBC_2.2.5>
  401076:	68 04 00 00 00       	push   $0x4
  40107b:	e9 a0 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401080 <printf@plt>:
  401080:	ff 25 a2 2f 00 00    	jmp    *0x2fa2(%rip)        # 404028 <printf@GLIBC_2.2.5>
  401086:	68 05 00 00 00       	push   $0x5
  40108b:	e9 90 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401090 <gets@plt>:
  401090:	ff 25 9a 2f 00 00    	jmp    *0x2f9a(%rip)        # 404030 <gets@GLIBC_2.2.5>
  401096:	68 06 00 00 00       	push   $0x6
  40109b:	e9 80 ff ff ff       	jmp    401020 <_init+0x20>

00000000004010a0 <fflush@plt>:
  4010a0:	ff 25 92 2f 00 00    	jmp    *0x2f92(%rip)        # 404038 <fflush@GLIBC_2.2.5>
  4010a6:	68 07 00 00 00       	push   $0x7
  4010ab:	e9 70 ff ff ff       	jmp    401020 <_init+0x20>

00000000004010b0 <exit@plt>:
  4010b0:	ff 25 8a 2f 00 00    	jmp    *0x2f8a(%rip)        # 404040 <exit@GLIBC_2.2.5>
  4010b6:	68 08 00 00 00       	push   $0x8
  4010bb:	e9 60 ff ff ff       	jmp    401020 <_init+0x20>

Disassembly of section .text:

00000000004010c0 <_start>:
  4010c0:	f3 0f 1e fa          	endbr64
  4010c4:	31 ed                	xor    %ebp,%ebp
  4010c6:	49 89 d1             	mov    %rdx,%r9
  4010c9:	5e                   	pop    %rsi
  4010ca:	48 89 e2             	mov    %rsp,%rdx
  4010cd:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4010d1:	50                   	push   %rax
  4010d2:	54                   	push   %rsp
  4010d3:	45 31 c0             	xor    %r8d,%r8d
  4010d6:	31 c9                	xor    %ecx,%ecx
  4010d8:	48 c7 c7 24 13 40 00 	mov    $0x401324,%rdi
  4010df:	ff 15 f3 2e 00 00    	call   *0x2ef3(%rip)        # 403fd8 <__libc_start_main@GLIBC_2.34>
  4010e5:	f4                   	hlt
  4010e6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  4010ed:	00 00 00 

00000000004010f0 <_dl_relocate_static_pie>:
  4010f0:	f3 0f 1e fa          	endbr64
  4010f4:	c3                   	ret
  4010f5:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  4010fc:	00 00 00 
  4010ff:	90                   	nop

0000000000401100 <deregister_tm_clones>:
  401100:	b8 58 40 40 00       	mov    $0x404058,%eax
  401105:	48 3d 58 40 40 00    	cmp    $0x404058,%rax
  40110b:	74 13                	je     401120 <deregister_tm_clones+0x20>
  40110d:	b8 00 00 00 00       	mov    $0x0,%eax
  401112:	48 85 c0             	test   %rax,%rax
  401115:	74 09                	je     401120 <deregister_tm_clones+0x20>
  401117:	bf 58 40 40 00       	mov    $0x404058,%edi
  40111c:	ff e0                	jmp    *%rax
  40111e:	66 90                	xchg   %ax,%ax
  401120:	c3                   	ret
  401121:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  401128:	00 00 00 00 
  40112c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401130 <register_tm_clones>:
  401130:	be 58 40 40 00       	mov    $0x404058,%esi
  401135:	48 81 ee 58 40 40 00 	sub    $0x404058,%rsi
  40113c:	48 89 f0             	mov    %rsi,%rax
  40113f:	48 c1 ee 3f          	shr    $0x3f,%rsi
  401143:	48 c1 f8 03          	sar    $0x3,%rax
  401147:	48 01 c6             	add    %rax,%rsi
  40114a:	48 d1 fe             	sar    $1,%rsi
  40114d:	74 11                	je     401160 <register_tm_clones+0x30>
  40114f:	b8 00 00 00 00       	mov    $0x0,%eax
  401154:	48 85 c0             	test   %rax,%rax
  401157:	74 07                	je     401160 <register_tm_clones+0x30>
  401159:	bf 58 40 40 00       	mov    $0x404058,%edi
  40115e:	ff e0                	jmp    *%rax
  401160:	c3                   	ret
  401161:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  401168:	00 00 00 00 
  40116c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401170 <__do_global_dtors_aux>:
  401170:	f3 0f 1e fa          	endbr64
  401174:	80 3d ed 2e 00 00 00 	cmpb   $0x0,0x2eed(%rip)        # 404068 <completed.0>
  40117b:	75 13                	jne    401190 <__do_global_dtors_aux+0x20>
  40117d:	55                   	push   %rbp
  40117e:	48 89 e5             	mov    %rsp,%rbp
  401181:	e8 7a ff ff ff       	call   401100 <deregister_tm_clones>
  401186:	c6 05 db 2e 00 00 01 	movb   $0x1,0x2edb(%rip)        # 404068 <completed.0>
  40118d:	5d                   	pop    %rbp
  40118e:	c3                   	ret
  40118f:	90                   	nop
  401190:	c3                   	ret
  401191:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  401198:	00 00 00 00 
  40119c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004011a0 <frame_dummy>:
  4011a0:	f3 0f 1e fa          	endbr64
  4011a4:	eb 8a                	jmp    401130 <register_tm_clones>

00000000004011a6 <eval>:
  4011a6:	f3 0f 1e fa          	endbr64
  4011aa:	55                   	push   %rbp
  4011ab:	48 89 e5             	mov    %rsp,%rbp
  4011ae:	48 83 ec 10          	sub    $0x10,%rsp
  4011b2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  4011b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4011ba:	48 89 c6             	mov    %rax,%rsi
  4011bd:	bf 14 20 40 00       	mov    $0x402014,%edi
  4011c2:	b8 00 00 00 00       	mov    $0x0,%eax
  4011c7:	e8 b4 fe ff ff       	call   401080 <printf@plt>
  4011cc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4011d0:	48 89 c7             	mov    %rax,%rdi
  4011d3:	e8 98 fe ff ff       	call   401070 <system@plt>
  4011d8:	48 8b 05 81 2e 00 00 	mov    0x2e81(%rip),%rax        # 404060 <stdout@GLIBC_2.2.5>
  4011df:	48 89 c7             	mov    %rax,%rdi
  4011e2:	e8 b9 fe ff ff       	call   4010a0 <fflush@plt>
  4011e7:	90                   	nop
  4011e8:	c9                   	leave
  4011e9:	c3                   	ret

00000000004011ea <grade_eval>:
  4011ea:	f3 0f 1e fa          	endbr64
  4011ee:	55                   	push   %rbp
  4011ef:	48 89 e5             	mov    %rsp,%rbp
  4011f2:	48 83 ec 10          	sub    $0x10,%rsp
  4011f6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  4011f9:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  4011fd:	75 19                	jne    401218 <grade_eval+0x2e>
  4011ff:	b8 45 00 00 00       	mov    $0x45,%eax
  401204:	2b 45 fc             	sub    -0x4(%rbp),%eax
  401207:	89 c6                	mov    %eax,%esi
  401209:	bf 28 20 40 00       	mov    $0x402028,%edi
  40120e:	b8 00 00 00 00       	mov    $0x0,%eax
  401213:	e8 68 fe ff ff       	call   401080 <printf@plt>
  401218:	48 8b 05 41 2e 00 00 	mov    0x2e41(%rip),%rax        # 404060 <stdout@GLIBC_2.2.5>
  40121f:	48 89 c7             	mov    %rax,%rdi
  401222:	e8 79 fe ff ff       	call   4010a0 <fflush@plt>
  401227:	90                   	nop
  401228:	c9                   	leave
  401229:	c3                   	ret

000000000040122a <input>:
  40122a:	f3 0f 1e fa          	endbr64
  40122e:	55                   	push   %rbp
  40122f:	48 89 e5             	mov    %rsp,%rbp
  401232:	48 83 ec 40          	sub    $0x40,%rsp
  401236:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  40123a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401241:	00 00 
  401243:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401247:	31 c0                	xor    %eax,%eax
  401249:	be 0f 00 00 00       	mov    $0xf,%esi
  40124e:	bf 50 20 40 00       	mov    $0x402050,%edi
  401253:	b8 00 00 00 00       	mov    $0x0,%eax
  401258:	e8 23 fe ff ff       	call   401080 <printf@plt>
  40125d:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  401261:	48 89 c7             	mov    %rax,%rdi
  401264:	e8 27 fe ff ff       	call   401090 <gets@plt>
  401269:	85 c0                	test   %eax,%eax
  40126b:	74 0b                	je     401278 <input+0x4e>
  40126d:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  401271:	0f b6 00             	movzbl (%rax),%eax
  401274:	84 c0                	test   %al,%al
  401276:	75 14                	jne    40128c <input+0x62>
  401278:	bf 78 20 40 00       	mov    $0x402078,%edi
  40127d:	e8 be fd ff ff       	call   401040 <puts@plt>
  401282:	bf 00 00 00 00       	mov    $0x0,%edi
  401287:	e8 24 fe ff ff       	call   4010b0 <exit@plt>
  40128c:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  401290:	48 89 c7             	mov    %rax,%rdi
  401293:	e8 b8 fd ff ff       	call   401050 <strlen@plt>
  401298:	48 83 f8 0f          	cmp    $0xf,%rax
  40129c:	77 0e                	ja     4012ac <input+0x82>
  40129e:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  4012a2:	48 89 c7             	mov    %rax,%rdi
  4012a5:	e8 a6 fd ff ff       	call   401050 <strlen@plt>
  4012aa:	eb 05                	jmp    4012b1 <input+0x87>
  4012ac:	b8 0f 00 00 00       	mov    $0xf,%eax
  4012b1:	89 45 dc             	mov    %eax,-0x24(%rbp)
  4012b4:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  4012b8:	48 8b 15 49 0d 00 00 	mov    0xd49(%rip),%rdx        # 402008 <wrapper_front>
  4012bf:	48 89 10             	mov    %rdx,(%rax)
  4012c2:	0f b6 15 47 0d 00 00 	movzbl 0xd47(%rip),%edx        # 402010 <wrapper_front+0x8>
  4012c9:	88 50 08             	mov    %dl,0x8(%rax)
  4012cc:	8b 45 dc             	mov    -0x24(%rbp),%eax
  4012cf:	48 98                	cltq
  4012d1:	48 8d 50 08          	lea    0x8(%rax),%rdx
  4012d5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  4012d9:	48 01 d0             	add    %rdx,%rax
  4012dc:	0f b7 15 2e 0d 00 00 	movzwl 0xd2e(%rip),%edx        # 402011 <wrapper_back>
  4012e3:	66 89 10             	mov    %dx,(%rax)
  4012e6:	0f b6 15 26 0d 00 00 	movzbl 0xd26(%rip),%edx        # 402013 <wrapper_back+0x2>
  4012ed:	88 50 02             	mov    %dl,0x2(%rax)
  4012f0:	8b 45 dc             	mov    -0x24(%rbp),%eax
  4012f3:	48 63 d0             	movslq %eax,%rdx
  4012f6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  4012fa:	48 8d 48 08          	lea    0x8(%rax),%rcx
  4012fe:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  401302:	48 89 c6             	mov    %rax,%rsi
  401305:	48 89 cf             	mov    %rcx,%rdi
  401308:	e8 23 fd ff ff       	call   401030 <strncpy@plt>
  40130d:	90                   	nop
  40130e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  401312:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
  401319:	00 00 
  40131b:	74 05                	je     401322 <input+0xf8>
  40131d:	e8 3e fd ff ff       	call   401060 <__stack_chk_fail@plt>
  401322:	c9                   	leave
  401323:	c3                   	ret

0000000000401324 <main>:
  401324:	f3 0f 1e fa          	endbr64
  401328:	55                   	push   %rbp
  401329:	48 89 e5             	mov    %rsp,%rbp
  40132c:	bf 70 40 40 00       	mov    $0x404070,%edi
  401331:	e8 f4 fe ff ff       	call   40122a <input>
  401336:	bf 70 40 40 00       	mov    $0x404070,%edi
  40133b:	e8 66 fe ff ff       	call   4011a6 <eval>
  401340:	90                   	nop
  401341:	eb e9                	jmp    40132c <main+0x8>

Disassembly of section .fini:

0000000000401344 <_fini>:
  401344:	f3 0f 1e fa          	endbr64
  401348:	48 83 ec 08          	sub    $0x8,%rsp
  40134c:	48 83 c4 08          	add    $0x8,%rsp
  401350:	c3                   	ret
