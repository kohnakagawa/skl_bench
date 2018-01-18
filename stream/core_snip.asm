0000000000402850 <copy_ref(double*, double const*, unsigned long)>:
  402850:	55                   	push   rbp
  402851:	48 89 e5             	mov    rbp,rsp
  402854:	48 83 e4 c0          	and    rsp,0xffffffffffffffc0
  402858:	48 85 d2             	test   rdx,rdx
  40285b:	76 0f                	jbe    40286c <copy_ref(double*, double const*, unsigned long)+0x1c>
  40285d:	48 83 fa 0c          	cmp    rdx,0xc
  402861:	72 11                	jb     402874 <copy_ref(double*, double const*, unsigned long)+0x24>
  402863:	48 c1 e2 03          	shl    rdx,0x3
  402867:	e8 44 24 00 00       	call   404cb0 <__intel_avx_rep_memcpy>
  40286c:	c5 f8 77             	vzeroupper 
  40286f:	48 89 ec             	mov    rsp,rbp
  402872:	5d                   	pop    rbp
  402873:	c3                   	ret    
  402874:	48 83 fa 04          	cmp    rdx,0x4
  402878:	72 45                	jb     4028bf <copy_ref(double*, double const*, unsigned long)+0x6f>
  40287a:	48 89 d0             	mov    rax,rdx
  40287d:	33 c9                	xor    ecx,ecx
  40287f:	48 83 e0 fc          	and    rax,0xfffffffffffffffc
  402883:	c5 fd 10 04 ce       	vmovupd ymm0,YMMWORD PTR [rsi+rcx*8]
  402888:	c5 fd 11 04 cf       	vmovupd YMMWORD PTR [rdi+rcx*8],ymm0
  40288d:	48 83 c1 04          	add    rcx,0x4
  402891:	48 3b c8             	cmp    rcx,rax
  402894:	72 ed                	jb     402883 <copy_ref(double*, double const*, unsigned long)+0x33>
  402896:	45 33 c0             	xor    r8d,r8d
  402899:	48 8d 48 01          	lea    rcx,[rax+0x1]
  40289d:	48 3b ca             	cmp    rcx,rdx
  4028a0:	77 ca                	ja     40286c <copy_ref(double*, double const*, unsigned long)+0x1c>
  4028a2:	48 2b d0             	sub    rdx,rax
  4028a5:	48 8d 3c c7          	lea    rdi,[rdi+rax*8]
  4028a9:	48 8d 0c c6          	lea    rcx,[rsi+rax*8]
  4028ad:	4a 8b 04 c1          	mov    rax,QWORD PTR [rcx+r8*8]
  4028b1:	4a 89 04 c7          	mov    QWORD PTR [rdi+r8*8],rax
  4028b5:	49 ff c0             	inc    r8
  4028b8:	4c 3b c2             	cmp    r8,rdx
  4028bb:	72 f0                	jb     4028ad <copy_ref(double*, double const*, unsigned long)+0x5d>
  4028bd:	eb ad                	jmp    40286c <copy_ref(double*, double const*, unsigned long)+0x1c>
  4028bf:	33 c0                	xor    eax,eax
  4028c1:	eb d3                	jmp    402896 <copy_ref(double*, double const*, unsigned long)+0x46>
  4028c3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4028c8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4028cf:	00 

0000000000402710 <scale_ref(double*, double const*, double, unsigned long)>:
  402710:	48 89 d1             	mov    rcx,rdx
  402713:	48 85 c9             	test   rcx,rcx
  402716:	0f 86 24 01 00 00    	jbe    402840 <scale_ref(double*, double const*, double, unsigned long)+0x130>
  40271c:	48 83 f9 10          	cmp    rcx,0x10
  402720:	0f 82 bb 00 00 00    	jb     4027e1 <scale_ref(double*, double const*, double, unsigned long)+0xd1>
  402726:	49 89 f8             	mov    r8,rdi
  402729:	49 83 e0 1f          	and    r8,0x1f
  40272d:	74 50                	je     40277f <scale_ref(double*, double const*, double, unsigned long)+0x6f>
  40272f:	49 f7 c0 07 00 00 00 	test   r8,0x7
  402736:	0f 85 a5 00 00 00    	jne    4027e1 <scale_ref(double*, double const*, double, unsigned long)+0xd1>
  40273c:	49 f7 d8             	neg    r8
  40273f:	49 83 c0 20          	add    r8,0x20
  402743:	49 c1 e8 03          	shr    r8,0x3
  402747:	49 8d 40 10          	lea    rax,[r8+0x10]
  40274b:	48 3b c8             	cmp    rcx,rax
  40274e:	0f 82 8d 00 00 00    	jb     4027e1 <scale_ref(double*, double const*, double, unsigned long)+0xd1>
  402754:	48 89 ca             	mov    rdx,rcx
  402757:	33 c0                	xor    eax,eax
  402759:	49 2b d0             	sub    rdx,r8
  40275c:	48 83 e2 0f          	and    rdx,0xf
  402760:	48 f7 da             	neg    rdx
  402763:	48 03 d1             	add    rdx,rcx
  402766:	4d 85 c0             	test   r8,r8
  402769:	76 21                	jbe    40278c <scale_ref(double*, double const*, double, unsigned long)+0x7c>
  40276b:	c5 fb 59 0c c6       	vmulsd xmm1,xmm0,QWORD PTR [rsi+rax*8]
  402770:	c5 fb 11 0c c7       	vmovsd QWORD PTR [rdi+rax*8],xmm1
  402775:	48 ff c0             	inc    rax
  402778:	49 3b c0             	cmp    rax,r8
  40277b:	72 ee                	jb     40276b <scale_ref(double*, double const*, double, unsigned long)+0x5b>
  40277d:	eb 0d                	jmp    40278c <scale_ref(double*, double const*, double, unsigned long)+0x7c>
  40277f:	48 89 ca             	mov    rdx,rcx
  402782:	48 83 e2 0f          	and    rdx,0xf
  402786:	48 f7 da             	neg    rdx
  402789:	48 03 d1             	add    rdx,rcx
  40278c:	c4 e2 7d 19 c8       	vbroadcastsd ymm1,xmm0
  402791:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  402798:	00 
  402799:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4027a0:	c4 a1 75 59 14 c6    	vmulpd ymm2,ymm1,YMMWORD PTR [rsi+r8*8]
  4027a6:	c4 a1 75 59 5c c6 20 	vmulpd ymm3,ymm1,YMMWORD PTR [rsi+r8*8+0x20]
  4027ad:	c4 a1 75 59 64 c6 40 	vmulpd ymm4,ymm1,YMMWORD PTR [rsi+r8*8+0x40]
  4027b4:	c4 a1 75 59 6c c6 60 	vmulpd ymm5,ymm1,YMMWORD PTR [rsi+r8*8+0x60]
  4027bb:	c4 a1 7d 11 14 c7    	vmovupd YMMWORD PTR [rdi+r8*8],ymm2
  4027c1:	c4 a1 7d 11 5c c7 20 	vmovupd YMMWORD PTR [rdi+r8*8+0x20],ymm3
  4027c8:	c4 a1 7d 11 64 c7 40 	vmovupd YMMWORD PTR [rdi+r8*8+0x40],ymm4
  4027cf:	c4 a1 7d 11 6c c7 60 	vmovupd YMMWORD PTR [rdi+r8*8+0x60],ymm5
  4027d6:	49 83 c0 10          	add    r8,0x10
  4027da:	4c 3b c2             	cmp    r8,rdx
  4027dd:	72 c1                	jb     4027a0 <scale_ref(double*, double const*, double, unsigned long)+0x90>
  4027df:	eb 02                	jmp    4027e3 <scale_ref(double*, double const*, double, unsigned long)+0xd3>
  4027e1:	33 d2                	xor    edx,edx
  4027e3:	48 8d 42 01          	lea    rax,[rdx+0x1]
  4027e7:	48 3b c1             	cmp    rax,rcx
  4027ea:	77 54                	ja     402840 <scale_ref(double*, double const*, double, unsigned long)+0x130>
  4027ec:	48 2b ca             	sub    rcx,rdx
  4027ef:	48 83 f9 04          	cmp    rcx,0x4
  4027f3:	72 4f                	jb     402844 <scale_ref(double*, double const*, double, unsigned long)+0x134>
  4027f5:	48 89 c8             	mov    rax,rcx
  4027f8:	45 33 d2             	xor    r10d,r10d
  4027fb:	c4 e2 7d 19 c8       	vbroadcastsd ymm1,xmm0
  402800:	48 83 e0 fc          	and    rax,0xfffffffffffffffc
  402804:	4c 8d 0c d7          	lea    r9,[rdi+rdx*8]
  402808:	4c 8d 04 d6          	lea    r8,[rsi+rdx*8]
  40280c:	c4 81 75 59 14 d0    	vmulpd ymm2,ymm1,YMMWORD PTR [r8+r10*8]
  402812:	c4 81 7d 11 14 d1    	vmovupd YMMWORD PTR [r9+r10*8],ymm2
  402818:	49 83 c2 04          	add    r10,0x4
  40281c:	4c 3b d0             	cmp    r10,rax
  40281f:	72 eb                	jb     40280c <scale_ref(double*, double const*, double, unsigned long)+0xfc>
  402821:	48 3b c1             	cmp    rax,rcx
  402824:	73 1a                	jae    402840 <scale_ref(double*, double const*, double, unsigned long)+0x130>
  402826:	48 8d 3c d7          	lea    rdi,[rdi+rdx*8]
  40282a:	48 8d 14 d6          	lea    rdx,[rsi+rdx*8]
  40282e:	c5 fb 59 0c c2       	vmulsd xmm1,xmm0,QWORD PTR [rdx+rax*8]
  402833:	c5 fb 11 0c c7       	vmovsd QWORD PTR [rdi+rax*8],xmm1
  402838:	48 ff c0             	inc    rax
  40283b:	48 3b c1             	cmp    rax,rcx
  40283e:	72 ee                	jb     40282e <scale_ref(double*, double const*, double, unsigned long)+0x11e>
  402840:	c5 f8 77             	vzeroupper 
  402843:	c3                   	ret    
  402844:	33 c0                	xor    eax,eax
  402846:	eb d9                	jmp    402821 <scale_ref(double*, double const*, double, unsigned long)+0x111>
  402848:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40284f:	00

00000000004025a0 <add_ref(double const*, double const*, double*, unsigned long)>:
  4025a0:	53                   	push   rbx
  4025a1:	48 89 cb             	mov    rbx,rcx
  4025a4:	48 89 d1             	mov    rcx,rdx
  4025a7:	48 85 db             	test   rbx,rbx
  4025aa:	0f 86 4a 01 00 00    	jbe    4026fa <add_ref(double const*, double const*, double*, unsigned long)+0x15a>
  4025b0:	48 83 fb 10          	cmp    rbx,0x10
  4025b4:	0f 82 d2 00 00 00    	jb     40268c <add_ref(double const*, double const*, double*, unsigned long)+0xec>
  4025ba:	49 89 c8             	mov    r8,rcx
  4025bd:	49 83 e0 1f          	and    r8,0x1f
  4025c1:	74 55                	je     402618 <add_ref(double const*, double const*, double*, unsigned long)+0x78>
  4025c3:	49 f7 c0 07 00 00 00 	test   r8,0x7
  4025ca:	0f 85 bc 00 00 00    	jne    40268c <add_ref(double const*, double const*, double*, unsigned long)+0xec>
  4025d0:	49 f7 d8             	neg    r8
  4025d3:	49 83 c0 20          	add    r8,0x20
  4025d7:	49 c1 e8 03          	shr    r8,0x3
  4025db:	49 8d 40 10          	lea    rax,[r8+0x10]
  4025df:	48 3b d8             	cmp    rbx,rax
  4025e2:	0f 82 a4 00 00 00    	jb     40268c <add_ref(double const*, double const*, double*, unsigned long)+0xec>
  4025e8:	48 89 da             	mov    rdx,rbx
  4025eb:	33 c0                	xor    eax,eax
  4025ed:	49 2b d0             	sub    rdx,r8
  4025f0:	48 83 e2 0f          	and    rdx,0xf
  4025f4:	48 f7 da             	neg    rdx
  4025f7:	48 03 d3             	add    rdx,rbx
  4025fa:	4d 85 c0             	test   r8,r8
  4025fd:	76 31                	jbe    402630 <add_ref(double const*, double const*, double*, unsigned long)+0x90>
  4025ff:	c5 fb 10 04 c7       	vmovsd xmm0,QWORD PTR [rdi+rax*8]
  402604:	c5 fb 58 0c c6       	vaddsd xmm1,xmm0,QWORD PTR [rsi+rax*8]
  402609:	c5 fb 11 0c c1       	vmovsd QWORD PTR [rcx+rax*8],xmm1
  40260e:	48 ff c0             	inc    rax
  402611:	49 3b c0             	cmp    rax,r8
  402614:	72 e9                	jb     4025ff <add_ref(double const*, double const*, double*, unsigned long)+0x5f>
  402616:	eb 18                	jmp    402630 <add_ref(double const*, double const*, double*, unsigned long)+0x90>
  402618:	48 89 da             	mov    rdx,rbx
  40261b:	48 83 e2 0f          	and    rdx,0xf
  40261f:	48 f7 da             	neg    rdx
  402622:	48 03 d3             	add    rdx,rbx
  402625:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402629:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  402630:	c4 a1 7d 10 04 c7    	vmovupd ymm0,YMMWORD PTR [rdi+r8*8]
  402636:	c4 a1 7d 10 54 c7 20 	vmovupd ymm2,YMMWORD PTR [rdi+r8*8+0x20]
  40263d:	c4 a1 7d 10 64 c7 40 	vmovupd ymm4,YMMWORD PTR [rdi+r8*8+0x40]
  402644:	c4 a1 7d 10 74 c7 60 	vmovupd ymm6,YMMWORD PTR [rdi+r8*8+0x60]
  40264b:	c4 a1 7d 58 0c c6    	vaddpd ymm1,ymm0,YMMWORD PTR [rsi+r8*8]
  402651:	c4 a1 6d 58 5c c6 20 	vaddpd ymm3,ymm2,YMMWORD PTR [rsi+r8*8+0x20]
  402658:	c4 a1 5d 58 6c c6 40 	vaddpd ymm5,ymm4,YMMWORD PTR [rsi+r8*8+0x40]
  40265f:	c4 a1 4d 58 7c c6 60 	vaddpd ymm7,ymm6,YMMWORD PTR [rsi+r8*8+0x60]
  402666:	c4 a1 7d 11 0c c1    	vmovupd YMMWORD PTR [rcx+r8*8],ymm1
  40266c:	c4 a1 7d 11 5c c1 20 	vmovupd YMMWORD PTR [rcx+r8*8+0x20],ymm3
  402673:	c4 a1 7d 11 6c c1 40 	vmovupd YMMWORD PTR [rcx+r8*8+0x40],ymm5
  40267a:	c4 a1 7d 11 7c c1 60 	vmovupd YMMWORD PTR [rcx+r8*8+0x60],ymm7
  402681:	49 83 c0 10          	add    r8,0x10
  402685:	4c 3b c2             	cmp    r8,rdx
  402688:	72 a6                	jb     402630 <add_ref(double const*, double const*, double*, unsigned long)+0x90>
  40268a:	eb 02                	jmp    40268e <add_ref(double const*, double const*, double*, unsigned long)+0xee>
  40268c:	33 d2                	xor    edx,edx
  40268e:	48 8d 42 01          	lea    rax,[rdx+0x1]
  402692:	48 3b c3             	cmp    rax,rbx
  402695:	77 63                	ja     4026fa <add_ref(double const*, double const*, double*, unsigned long)+0x15a>
  402697:	48 2b da             	sub    rbx,rdx
  40269a:	48 83 fb 04          	cmp    rbx,0x4
  40269e:	72 5f                	jb     4026ff <add_ref(double const*, double const*, double*, unsigned long)+0x15f>
  4026a0:	48 89 d8             	mov    rax,rbx
  4026a3:	45 33 db             	xor    r11d,r11d
  4026a6:	48 83 e0 fc          	and    rax,0xfffffffffffffffc
  4026aa:	4c 8d 14 d1          	lea    r10,[rcx+rdx*8]
  4026ae:	4c 8d 0c d7          	lea    r9,[rdi+rdx*8]
  4026b2:	4c 8d 04 d6          	lea    r8,[rsi+rdx*8]
  4026b6:	c4 81 7d 10 04 d9    	vmovupd ymm0,YMMWORD PTR [r9+r11*8]
  4026bc:	c4 81 7d 58 0c d8    	vaddpd ymm1,ymm0,YMMWORD PTR [r8+r11*8]
  4026c2:	c4 81 7d 11 0c da    	vmovupd YMMWORD PTR [r10+r11*8],ymm1
  4026c8:	49 83 c3 04          	add    r11,0x4
  4026cc:	4c 3b d8             	cmp    r11,rax
  4026cf:	72 e5                	jb     4026b6 <add_ref(double const*, double const*, double*, unsigned long)+0x116>
  4026d1:	48 3b c3             	cmp    rax,rbx
  4026d4:	73 24                	jae    4026fa <add_ref(double const*, double const*, double*, unsigned long)+0x15a>
  4026d6:	4c 8d 04 d1          	lea    r8,[rcx+rdx*8]
  4026da:	48 8d 0c d7          	lea    rcx,[rdi+rdx*8]
  4026de:	48 8d 14 d6          	lea    rdx,[rsi+rdx*8]
  4026e2:	c5 fb 10 04 c1       	vmovsd xmm0,QWORD PTR [rcx+rax*8]
  4026e7:	c5 fb 58 0c c2       	vaddsd xmm1,xmm0,QWORD PTR [rdx+rax*8]
  4026ec:	c4 c1 7b 11 0c c0    	vmovsd QWORD PTR [r8+rax*8],xmm1
  4026f2:	48 ff c0             	inc    rax
  4026f5:	48 3b c3             	cmp    rax,rbx
  4026f8:	72 e8                	jb     4026e2 <add_ref(double const*, double const*, double*, unsigned long)+0x142>
  4026fa:	c5 f8 77             	vzeroupper 
  4026fd:	5b                   	pop    rbx
  4026fe:	c3                   	ret    
  4026ff:	33 c0                	xor    eax,eax
  402701:	eb ce                	jmp    4026d1 <add_ref(double const*, double const*, double*, unsigned long)+0x131>
  402703:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  402708:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40270f:	00 

0000000000402490 <triadd_ref(double*, double const*, double const*, double, unsigned long)>:
  402490:	49 89 c8             	mov    r8,rcx
  402493:	48 89 d1             	mov    rcx,rdx
  402496:	4d 85 c0             	test   r8,r8
  402499:	0f 86 e4 00 00 00    	jbe    402583 <triadd_ref(double*, double const*, double const*, double, unsigned long)+0xf3>
  40249f:	49 83 f8 04          	cmp    r8,0x4
  4024a3:	0f 82 a6 00 00 00    	jb     40254f <triadd_ref(double*, double const*, double const*, double, unsigned long)+0xbf>
  4024a9:	49 83 f8 5f          	cmp    r8,0x5f
  4024ad:	0f 82 d4 00 00 00    	jb     402587 <triadd_ref(double*, double const*, double const*, double, unsigned long)+0xf7>
  4024b3:	49 89 f9             	mov    r9,rdi
  4024b6:	49 83 e1 1f          	and    r9,0x1f
  4024ba:	49 f7 c1 07 00 00 00 	test   r9,0x7
  4024c1:	74 12                	je     4024d5 <triadd_ref(double*, double const*, double const*, double, unsigned long)+0x45>
  4024c3:	4c 89 c2             	mov    rdx,r8
  4024c6:	45 33 c9             	xor    r9d,r9d
  4024c9:	48 83 e2 03          	and    rdx,0x3
  4024cd:	48 f7 da             	neg    rdx
  4024d0:	49 03 d0             	add    rdx,r8
  4024d3:	eb 58                	jmp    40252d <triadd_ref(double*, double const*, double const*, double, unsigned long)+0x9d>
  4024d5:	4d 85 c9             	test   r9,r9
  4024d8:	74 46                	je     402520 <triadd_ref(double*, double const*, double const*, double, unsigned long)+0x90>
  4024da:	49 f7 d9             	neg    r9
  4024dd:	49 83 c1 20          	add    r9,0x20
  4024e1:	49 c1 e9 03          	shr    r9,0x3
  4024e5:	49 8d 41 04          	lea    rax,[r9+0x4]
  4024e9:	4c 3b c0             	cmp    r8,rax
  4024ec:	72 61                	jb     40254f <triadd_ref(double*, double const*, double const*, double, unsigned long)+0xbf>
  4024ee:	4c 89 c2             	mov    rdx,r8
  4024f1:	33 c0                	xor    eax,eax
  4024f3:	49 2b d1             	sub    rdx,r9
  4024f6:	48 83 e2 03          	and    rdx,0x3
  4024fa:	48 f7 da             	neg    rdx
  4024fd:	49 03 d0             	add    rdx,r8
  402500:	49 83 f9 01          	cmp    r9,0x1
  402504:	72 27                	jb     40252d <triadd_ref(double*, double const*, double const*, double, unsigned long)+0x9d>
  402506:	c5 fb 10 0c c1       	vmovsd xmm1,QWORD PTR [rcx+rax*8]
  40250b:	c4 e2 f9 a9 0c c6    	vfmadd213sd xmm1,xmm0,QWORD PTR [rsi+rax*8]
  402511:	c5 fb 11 0c c7       	vmovsd QWORD PTR [rdi+rax*8],xmm1
  402516:	48 ff c0             	inc    rax
  402519:	49 3b c1             	cmp    rax,r9
  40251c:	72 e8                	jb     402506 <triadd_ref(double*, double const*, double const*, double, unsigned long)+0x76>
  40251e:	eb 0d                	jmp    40252d <triadd_ref(double*, double const*, double const*, double, unsigned long)+0x9d>
  402520:	4c 89 c2             	mov    rdx,r8
  402523:	48 83 e2 03          	and    rdx,0x3
  402527:	48 f7 da             	neg    rdx
  40252a:	49 03 d0             	add    rdx,r8
  40252d:	c4 e2 7d 19 c8       	vbroadcastsd ymm1,xmm0
  402532:	c4 a1 7d 10 14 c9    	vmovupd ymm2,YMMWORD PTR [rcx+r9*8]
  402538:	c4 a2 f5 a8 14 ce    	vfmadd213pd ymm2,ymm1,YMMWORD PTR [rsi+r9*8]
  40253e:	c4 a1 7d 11 14 cf    	vmovupd YMMWORD PTR [rdi+r9*8],ymm2
  402544:	49 83 c1 04          	add    r9,0x4
  402548:	4c 3b ca             	cmp    r9,rdx
  40254b:	72 e5                	jb     402532 <triadd_ref(double*, double const*, double const*, double, unsigned long)+0xa2>
  40254d:	eb 02                	jmp    402551 <triadd_ref(double*, double const*, double const*, double, unsigned long)+0xc1>
  40254f:	33 d2                	xor    edx,edx
  402551:	33 c0                	xor    eax,eax
  402553:	4c 8d 4a 01          	lea    r9,[rdx+0x1]
  402557:	4d 3b c8             	cmp    r9,r8
  40255a:	77 27                	ja     402583 <triadd_ref(double*, double const*, double const*, double, unsigned long)+0xf3>
  40255c:	4c 2b c2             	sub    r8,rdx
  40255f:	48 8d 3c d7          	lea    rdi,[rdi+rdx*8]
  402563:	48 8d 34 d6          	lea    rsi,[rsi+rdx*8]
  402567:	48 8d 0c d1          	lea    rcx,[rcx+rdx*8]
  40256b:	c5 fb 10 0c c1       	vmovsd xmm1,QWORD PTR [rcx+rax*8]
  402570:	c4 e2 f9 a9 0c c6    	vfmadd213sd xmm1,xmm0,QWORD PTR [rsi+rax*8]
  402576:	c5 fb 11 0c c7       	vmovsd QWORD PTR [rdi+rax*8],xmm1
  40257b:	48 ff c0             	inc    rax
  40257e:	49 3b c0             	cmp    rax,r8
  402581:	72 e8                	jb     40256b <triadd_ref(double*, double const*, double const*, double, unsigned long)+0xdb>
  402583:	c5 f8 77             	vzeroupper 
  402586:	c3                   	ret    
  402587:	4c 89 c2             	mov    rdx,r8
  40258a:	45 33 c9             	xor    r9d,r9d
  40258d:	48 83 e2 fc          	and    rdx,0xfffffffffffffffc
  402591:	eb 9a                	jmp    40252d <triadd_ref(double*, double const*, double const*, double, unsigned long)+0x9d>
  402593:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  402598:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40259f:	00 
	
