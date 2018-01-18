00000000004028d0 <copy_ref(double*, double const*, unsigned long)>:
  4028d0:	55                   	push   rbp
  4028d1:	48 89 e5             	mov    rbp,rsp
  4028d4:	48 83 e4 c0          	and    rsp,0xffffffffffffffc0
  4028d8:	48 85 d2             	test   rdx,rdx
  4028db:	76 0f                	jbe    4028ec <copy_ref(double*, double const*, unsigned long)+0x1c>
  4028dd:	48 83 fa 0c          	cmp    rdx,0xc
  4028e1:	72 11                	jb     4028f4 <copy_ref(double*, double const*, unsigned long)+0x24>
  4028e3:	48 c1 e2 03          	shl    rdx,0x3
  4028e7:	e8 14 25 00 00       	call   404e00 <__intel_avx_rep_memcpy>
  4028ec:	c5 f8 77             	vzeroupper 
  4028ef:	48 89 ec             	mov    rsp,rbp
  4028f2:	5d                   	pop    rbp
  4028f3:	c3                   	ret    
  4028f4:	48 83 fa 08          	cmp    rdx,0x8
  4028f8:	72 4d                	jb     402947 <copy_ref(double*, double const*, unsigned long)+0x77>
  4028fa:	48 89 d0             	mov    rax,rdx
  4028fd:	33 c9                	xor    ecx,ecx
  4028ff:	48 83 e0 f8          	and    rax,0xfffffffffffffff8
  402903:	62 e1 7c 48 10 04 ce 	vmovups zmm16,ZMMWORD PTR [rsi+rcx*8]
  40290a:	62 e1 fd 48 11 04 cf 	vmovupd ZMMWORD PTR [rdi+rcx*8],zmm16
  402911:	48 83 c1 08          	add    rcx,0x8
  402915:	48 3b c8             	cmp    rcx,rax
  402918:	72 e9                	jb     402903 <copy_ref(double*, double const*, unsigned long)+0x33>
  40291a:	48 8d 48 01          	lea    rcx,[rax+0x1]
  40291e:	48 3b ca             	cmp    rcx,rdx
  402921:	77 c9                	ja     4028ec <copy_ref(double*, double const*, unsigned long)+0x1c>
  402923:	48 2b d0             	sub    rdx,rax
  402926:	62 e2 fd 48 7c c2    	vpbroadcastq zmm16,rdx
  40292c:	62 f3 fd 40 1e 0d 89 	vpcmpnleuq k1,zmm16,ZMMWORD PTR [rip+0x9089]        # 40b9c0 <__dso_handle+0xf8>
  402933:	90 00 00 06 
  402937:	62 e1 fd c9 10 0c c6 	vmovupd zmm17{k1}{z},ZMMWORD PTR [rsi+rax*8]
  40293e:	62 e1 fd 49 11 0c c7 	vmovupd ZMMWORD PTR [rdi+rax*8]{k1},zmm17
  402945:	eb a5                	jmp    4028ec <copy_ref(double*, double const*, unsigned long)+0x1c>
  402947:	33 c0                	xor    eax,eax
  402949:	eb cf                	jmp    40291a <copy_ref(double*, double const*, unsigned long)+0x4a>
  40294b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000402780 <scale_ref(double*, double const*, double, unsigned long)>:
  402780:	48 85 d2             	test   rdx,rdx
  402783:	0f 86 31 01 00 00    	jbe    4028ba <scale_ref(double*, double const*, double, unsigned long)+0x13a>
  402789:	49 89 f8             	mov    r8,rdi
  40278c:	49 83 e0 3f          	and    r8,0x3f
  402790:	0f 84 86 00 00 00    	je     40281c <scale_ref(double*, double const*, double, unsigned long)+0x9c>
  402796:	49 f7 c0 07 00 00 00 	test   r8,0x7
  40279d:	0f 85 1b 01 00 00    	jne    4028be <scale_ref(double*, double const*, double, unsigned long)+0x13e>
  4027a3:	49 f7 d8             	neg    r8
  4027a6:	48 89 d0             	mov    rax,rdx
  4027a9:	49 83 c0 40          	add    r8,0x40
  4027ad:	49 c1 e8 03          	shr    r8,0x3
  4027b1:	49 3b d0             	cmp    rdx,r8
  4027b4:	4c 0f 42 c2          	cmovb  r8,rdx
  4027b8:	49 2b c0             	sub    rax,r8
  4027bb:	48 83 e0 0f          	and    rax,0xf
  4027bf:	48 f7 d8             	neg    rax
  4027c2:	48 03 c2             	add    rax,rdx
  4027c5:	49 83 f8 01          	cmp    r8,0x1
  4027c9:	72 5e                	jb     402829 <scale_ref(double*, double const*, double, unsigned long)+0xa9>
  4027cb:	62 e1 7c 48 10 1d ab 	vmovups zmm19,ZMMWORD PTR [rip+0x91ab]        # 40b980 <__dso_handle+0xb8>
  4027d2:	91 00 00 
  4027d5:	33 c9                	xor    ecx,ecx
  4027d7:	62 e1 7e 48 6f 15 df 	vmovdqu32 zmm18,ZMMWORD PTR [rip+0x91df]        # 40b9c0 <__dso_handle+0xf8>
  4027de:	91 00 00 
  4027e1:	62 e2 fd 48 19 c8    	vbroadcastsd zmm17,xmm0
  4027e7:	62 c2 fd 48 7c c0    	vpbroadcastq zmm16,r8
  4027ed:	62 b3 fd 40 1e ca 06 	vpcmpnleuq k1,zmm16,zmm18
  4027f4:	62 a1 ed 40 d4 d3    	vpaddq zmm18,zmm18,zmm19
  4027fa:	62 e1 f5 c1 59 24 ce 	vmulpd zmm20{k1}{z},zmm17,ZMMWORD PTR [rsi+rcx*8]
  402801:	62 e1 fd 49 11 24 cf 	vmovupd ZMMWORD PTR [rdi+rcx*8]{k1},zmm20
  402808:	48 83 c1 08          	add    rcx,0x8
  40280c:	49 3b c8             	cmp    rcx,r8
  40280f:	72 dc                	jb     4027ed <scale_ref(double*, double const*, double, unsigned long)+0x6d>
  402811:	49 3b d0             	cmp    rdx,r8
  402814:	0f 84 a0 00 00 00    	je     4028ba <scale_ref(double*, double const*, double, unsigned long)+0x13a>
  40281a:	eb 0d                	jmp    402829 <scale_ref(double*, double const*, double, unsigned long)+0xa9>
  40281c:	48 89 d0             	mov    rax,rdx
  40281f:	48 83 e0 0f          	and    rax,0xf
  402823:	48 f7 d8             	neg    rax
  402826:	48 03 c2             	add    rax,rdx
  402829:	49 8d 48 10          	lea    rcx,[r8+0x10]
  40282d:	48 3b c1             	cmp    rax,rcx
  402830:	72 2d                	jb     40285f <scale_ref(double*, double const*, double, unsigned long)+0xdf>
  402832:	62 e2 fd 48 19 c0    	vbroadcastsd zmm16,xmm0
  402838:	62 a1 fd 40 59 0c c6 	vmulpd zmm17,zmm16,ZMMWORD PTR [rsi+r8*8]
  40283f:	62 a1 fd 40 59 54 c6 	vmulpd zmm18,zmm16,ZMMWORD PTR [rsi+r8*8+0x40]
  402846:	01 
  402847:	62 a1 fd 48 11 0c c7 	vmovupd ZMMWORD PTR [rdi+r8*8],zmm17
  40284e:	62 a1 fd 48 11 54 c7 	vmovupd ZMMWORD PTR [rdi+r8*8+0x40],zmm18
  402855:	01 
  402856:	49 83 c0 10          	add    r8,0x10
  40285a:	4c 3b c0             	cmp    r8,rax
  40285d:	72 d9                	jb     402838 <scale_ref(double*, double const*, double, unsigned long)+0xb8>
  40285f:	48 8d 48 01          	lea    rcx,[rax+0x1]
  402863:	48 3b ca             	cmp    rcx,rdx
  402866:	77 52                	ja     4028ba <scale_ref(double*, double const*, double, unsigned long)+0x13a>
  402868:	48 2b d0             	sub    rdx,rax
  40286b:	45 33 c0             	xor    r8d,r8d
  40286e:	62 e1 7c 48 10 1d 08 	vmovups zmm19,ZMMWORD PTR [rip+0x9108]        # 40b980 <__dso_handle+0xb8>
  402875:	91 00 00 
  402878:	48 8d 0c c6          	lea    rcx,[rsi+rax*8]
  40287c:	62 e1 7e 48 6f 15 3a 	vmovdqu32 zmm18,ZMMWORD PTR [rip+0x913a]        # 40b9c0 <__dso_handle+0xf8>
  402883:	91 00 00 
  402886:	62 e2 fd 48 19 c8    	vbroadcastsd zmm17,xmm0
  40288c:	62 e2 fd 48 7c c2    	vpbroadcastq zmm16,rdx
  402892:	48 8d 04 c7          	lea    rax,[rdi+rax*8]
  402896:	62 b3 fd 40 1e ca 06 	vpcmpnleuq k1,zmm16,zmm18
  40289d:	62 a1 ed 40 d4 d3    	vpaddq zmm18,zmm18,zmm19
  4028a3:	62 a1 f5 c1 59 24 c1 	vmulpd zmm20{k1}{z},zmm17,ZMMWORD PTR [rcx+r8*8]
  4028aa:	62 a1 fd 49 11 24 c0 	vmovupd ZMMWORD PTR [rax+r8*8]{k1},zmm20
  4028b1:	49 83 c0 08          	add    r8,0x8
  4028b5:	4c 3b c2             	cmp    r8,rdx
  4028b8:	72 dc                	jb     402896 <scale_ref(double*, double const*, double, unsigned long)+0x116>
  4028ba:	c5 f8 77             	vzeroupper 
  4028bd:	c3                   	ret    
  4028be:	33 c0                	xor    eax,eax
  4028c0:	eb 9d                	jmp    40285f <scale_ref(double*, double const*, double, unsigned long)+0xdf>
  4028c2:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4028c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000402620 <add_ref(double const*, double const*, double*, unsigned long)>:
  402620:	48 85 c9             	test   rcx,rcx
  402623:	0f 86 41 01 00 00    	jbe    40276a <add_ref(double const*, double const*, double*, unsigned long)+0x14a>
  402629:	49 89 d1             	mov    r9,rdx
  40262c:	49 83 e1 3f          	and    r9,0x3f
  402630:	0f 84 88 00 00 00    	je     4026be <add_ref(double const*, double const*, double*, unsigned long)+0x9e>
  402636:	49 f7 c1 07 00 00 00 	test   r9,0x7
  40263d:	0f 85 2b 01 00 00    	jne    40276e <add_ref(double const*, double const*, double*, unsigned long)+0x14e>
  402643:	49 f7 d9             	neg    r9
  402646:	48 89 c8             	mov    rax,rcx
  402649:	49 83 c1 40          	add    r9,0x40
  40264d:	49 c1 e9 03          	shr    r9,0x3
  402651:	49 3b c9             	cmp    rcx,r9
  402654:	4c 0f 42 c9          	cmovb  r9,rcx
  402658:	49 2b c1             	sub    rax,r9
  40265b:	48 83 e0 0f          	and    rax,0xf
  40265f:	48 f7 d8             	neg    rax
  402662:	48 03 c1             	add    rax,rcx
  402665:	49 83 f9 01          	cmp    r9,0x1
  402669:	72 60                	jb     4026cb <add_ref(double const*, double const*, double*, unsigned long)+0xab>
  40266b:	62 e1 7c 48 10 15 0b 	vmovups zmm18,ZMMWORD PTR [rip+0x930b]        # 40b980 <__dso_handle+0xb8>
  402672:	93 00 00 
  402675:	45 33 c0             	xor    r8d,r8d
  402678:	62 e1 7e 48 6f 0d 3e 	vmovdqu32 zmm17,ZMMWORD PTR [rip+0x933e]        # 40b9c0 <__dso_handle+0xf8>
  40267f:	93 00 00 
  402682:	62 c2 fd 48 7c c1    	vpbroadcastq zmm16,r9
  402688:	62 b3 fd 40 1e c9 06 	vpcmpnleuq k1,zmm16,zmm17
  40268f:	62 a1 f5 40 d4 ca    	vpaddq zmm17,zmm17,zmm18
  402695:	62 a1 fd c9 10 1c c7 	vmovupd zmm19{k1}{z},ZMMWORD PTR [rdi+r8*8]
  40269c:	62 a1 e5 c1 58 24 c6 	vaddpd zmm20{k1}{z},zmm19,ZMMWORD PTR [rsi+r8*8]
  4026a3:	62 a1 fd 49 11 24 c2 	vmovupd ZMMWORD PTR [rdx+r8*8]{k1},zmm20
  4026aa:	49 83 c0 08          	add    r8,0x8
  4026ae:	4d 3b c1             	cmp    r8,r9
  4026b1:	72 d5                	jb     402688 <add_ref(double const*, double const*, double*, unsigned long)+0x68>
  4026b3:	49 3b c9             	cmp    rcx,r9
  4026b6:	0f 84 ae 00 00 00    	je     40276a <add_ref(double const*, double const*, double*, unsigned long)+0x14a>
  4026bc:	eb 0d                	jmp    4026cb <add_ref(double const*, double const*, double*, unsigned long)+0xab>
  4026be:	48 89 c8             	mov    rax,rcx
  4026c1:	48 83 e0 0f          	and    rax,0xf
  4026c5:	48 f7 d8             	neg    rax
  4026c8:	48 03 c1             	add    rax,rcx
  4026cb:	4d 8d 41 10          	lea    r8,[r9+0x10]
  4026cf:	49 3b c0             	cmp    rax,r8
  4026d2:	72 36                	jb     40270a <add_ref(double const*, double const*, double*, unsigned long)+0xea>
  4026d4:	62 a1 7c 48 10 04 cf 	vmovups zmm16,ZMMWORD PTR [rdi+r9*8]
  4026db:	62 a1 7c 48 10 54 cf 	vmovups zmm18,ZMMWORD PTR [rdi+r9*8+0x40]
  4026e2:	01 
  4026e3:	62 a1 fd 40 58 0c ce 	vaddpd zmm17,zmm16,ZMMWORD PTR [rsi+r9*8]
  4026ea:	62 a1 ed 40 58 5c ce 	vaddpd zmm19,zmm18,ZMMWORD PTR [rsi+r9*8+0x40]
  4026f1:	01 
  4026f2:	62 a1 fd 48 11 0c ca 	vmovupd ZMMWORD PTR [rdx+r9*8],zmm17
  4026f9:	62 a1 fd 48 11 5c ca 	vmovupd ZMMWORD PTR [rdx+r9*8+0x40],zmm19
  402700:	01 
  402701:	49 83 c1 10          	add    r9,0x10
  402705:	4c 3b c8             	cmp    r9,rax
  402708:	72 ca                	jb     4026d4 <add_ref(double const*, double const*, double*, unsigned long)+0xb4>
  40270a:	4c 8d 40 01          	lea    r8,[rax+0x1]
  40270e:	4c 3b c1             	cmp    r8,rcx
  402711:	77 57                	ja     40276a <add_ref(double const*, double const*, double*, unsigned long)+0x14a>
  402713:	48 2b c8             	sub    rcx,rax
  402716:	45 33 c0             	xor    r8d,r8d
  402719:	62 e1 7c 48 10 15 5d 	vmovups zmm18,ZMMWORD PTR [rip+0x925d]        # 40b980 <__dso_handle+0xb8>
  402720:	92 00 00 
  402723:	48 8d 3c c7          	lea    rdi,[rdi+rax*8]
  402727:	62 e1 7e 48 6f 0d 8f 	vmovdqu32 zmm17,ZMMWORD PTR [rip+0x928f]        # 40b9c0 <__dso_handle+0xf8>
  40272e:	92 00 00 
  402731:	62 e2 fd 48 7c c1    	vpbroadcastq zmm16,rcx
  402737:	48 8d 34 c6          	lea    rsi,[rsi+rax*8]
  40273b:	48 8d 04 c2          	lea    rax,[rdx+rax*8]
  40273f:	62 b3 fd 40 1e c9 06 	vpcmpnleuq k1,zmm16,zmm17
  402746:	62 a1 f5 40 d4 ca    	vpaddq zmm17,zmm17,zmm18
  40274c:	62 a1 fd c9 10 1c c7 	vmovupd zmm19{k1}{z},ZMMWORD PTR [rdi+r8*8]
  402753:	62 a1 e5 c1 58 24 c6 	vaddpd zmm20{k1}{z},zmm19,ZMMWORD PTR [rsi+r8*8]
  40275a:	62 a1 fd 49 11 24 c0 	vmovupd ZMMWORD PTR [rax+r8*8]{k1},zmm20
  402761:	49 83 c0 08          	add    r8,0x8
  402765:	4c 3b c1             	cmp    r8,rcx
  402768:	72 d5                	jb     40273f <add_ref(double const*, double const*, double*, unsigned long)+0x11f>
  40276a:	c5 f8 77             	vzeroupper 
  40276d:	c3                   	ret    
  40276e:	33 c0                	xor    eax,eax
  402770:	eb 98                	jmp    40270a <add_ref(double const*, double const*, double*, unsigned long)+0xea>
  402772:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  402779:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000004024b0 <triadd_ref(double*, double const*, double const*, double, unsigned long)>:
  4024b0:	48 85 c9             	test   rcx,rcx
  4024b3:	0f 86 45 01 00 00    	jbe    4025fe <triadd_ref(double*, double const*, double const*, double, unsigned long)+0x14e>
  4024b9:	48 83 f9 3e          	cmp    rcx,0x3e
  4024bd:	0f 82 43 01 00 00    	jb     402606 <triadd_ref(double*, double const*, double const*, double, unsigned long)+0x156>
  4024c3:	49 89 f8             	mov    r8,rdi
  4024c6:	49 83 e0 3f          	and    r8,0x3f
  4024ca:	0f 84 8e 00 00 00    	je     40255e <triadd_ref(double*, double const*, double const*, double, unsigned long)+0xae>
  4024d0:	49 f7 c0 07 00 00 00 	test   r8,0x7
  4024d7:	0f 85 25 01 00 00    	jne    402602 <triadd_ref(double*, double const*, double const*, double, unsigned long)+0x152>
  4024dd:	49 f7 d8             	neg    r8
  4024e0:	48 89 c8             	mov    rax,rcx
  4024e3:	49 83 c0 40          	add    r8,0x40
  4024e7:	49 c1 e8 03          	shr    r8,0x3
  4024eb:	49 3b c8             	cmp    rcx,r8
  4024ee:	4c 0f 42 c1          	cmovb  r8,rcx
  4024f2:	49 2b c0             	sub    rax,r8
  4024f5:	48 83 e0 07          	and    rax,0x7
  4024f9:	48 f7 d8             	neg    rax
  4024fc:	48 03 c1             	add    rax,rcx
  4024ff:	49 83 f8 01          	cmp    r8,0x1
  402503:	72 66                	jb     40256b <triadd_ref(double*, double const*, double const*, double, unsigned long)+0xbb>
  402505:	62 e1 7c 48 10 1d 71 	vmovups zmm19,ZMMWORD PTR [rip+0x9471]        # 40b980 <__dso_handle+0xb8>
  40250c:	94 00 00 
  40250f:	45 33 c9             	xor    r9d,r9d
  402512:	62 e1 7e 48 6f 15 a4 	vmovdqu32 zmm18,ZMMWORD PTR [rip+0x94a4]        # 40b9c0 <__dso_handle+0xf8>
  402519:	94 00 00 
  40251c:	62 c2 fd 48 7c c8    	vpbroadcastq zmm17,r8
  402522:	62 e2 fd 48 19 c0    	vbroadcastsd zmm16,xmm0
  402528:	62 b3 f5 40 1e ca 06 	vpcmpnleuq k1,zmm17,zmm18
  40252f:	62 a1 ed 40 d4 d3    	vpaddq zmm18,zmm18,zmm19
  402535:	62 a1 fd c9 10 24 ca 	vmovupd zmm20{k1}{z},ZMMWORD PTR [rdx+r9*8]
  40253c:	62 a2 fd c1 a8 24 ce 	vfmadd213pd zmm20{k1}{z},zmm16,ZMMWORD PTR [rsi+r9*8]
  402543:	62 a1 fd 49 11 24 cf 	vmovupd ZMMWORD PTR [rdi+r9*8]{k1},zmm20
  40254a:	49 83 c1 08          	add    r9,0x8
  40254e:	4d 3b c8             	cmp    r9,r8
  402551:	72 d5                	jb     402528 <triadd_ref(double*, double const*, double const*, double, unsigned long)+0x78>
  402553:	49 3b c8             	cmp    rcx,r8
  402556:	0f 84 a2 00 00 00    	je     4025fe <triadd_ref(double*, double const*, double const*, double, unsigned long)+0x14e>
  40255c:	eb 0d                	jmp    40256b <triadd_ref(double*, double const*, double const*, double, unsigned long)+0xbb>
  40255e:	48 89 c8             	mov    rax,rcx
  402561:	48 83 e0 07          	and    rax,0x7
  402565:	48 f7 d8             	neg    rax
  402568:	48 03 c1             	add    rax,rcx
  40256b:	4d 8d 48 08          	lea    r9,[r8+0x8]
  40256f:	49 3b c1             	cmp    rax,r9
  402572:	72 24                	jb     402598 <triadd_ref(double*, double const*, double const*, double, unsigned long)+0xe8>
  402574:	62 e2 fd 48 19 c0    	vbroadcastsd zmm16,xmm0
  40257a:	62 a1 7c 48 10 0c c2 	vmovups zmm17,ZMMWORD PTR [rdx+r8*8]
  402581:	62 a2 fd 40 a8 0c c6 	vfmadd213pd zmm17,zmm16,ZMMWORD PTR [rsi+r8*8]
  402588:	62 a1 fd 48 11 0c c7 	vmovupd ZMMWORD PTR [rdi+r8*8],zmm17
  40258f:	49 83 c0 08          	add    r8,0x8
  402593:	4c 3b c0             	cmp    r8,rax
  402596:	72 e2                	jb     40257a <triadd_ref(double*, double const*, double const*, double, unsigned long)+0xca>
  402598:	4c 8d 40 01          	lea    r8,[rax+0x1]
  40259c:	4c 3b c1             	cmp    r8,rcx
  40259f:	77 5d                	ja     4025fe <triadd_ref(double*, double const*, double const*, double, unsigned long)+0x14e>
  4025a1:	48 2b c8             	sub    rcx,rax
  4025a4:	45 33 c0             	xor    r8d,r8d
  4025a7:	62 e1 7c 48 10 1d cf 	vmovups zmm19,ZMMWORD PTR [rip+0x93cf]        # 40b980 <__dso_handle+0xb8>
  4025ae:	93 00 00 
  4025b1:	48 8d 34 c6          	lea    rsi,[rsi+rax*8]
  4025b5:	62 e1 7e 48 6f 15 01 	vmovdqu32 zmm18,ZMMWORD PTR [rip+0x9401]        # 40b9c0 <__dso_handle+0xf8>
  4025bc:	94 00 00 
  4025bf:	62 e2 fd 48 19 c8    	vbroadcastsd zmm17,xmm0
  4025c5:	62 e2 fd 48 7c c1    	vpbroadcastq zmm16,rcx
  4025cb:	48 8d 14 c2          	lea    rdx,[rdx+rax*8]
  4025cf:	48 8d 04 c7          	lea    rax,[rdi+rax*8]
  4025d3:	62 b3 fd 40 1e ca 06 	vpcmpnleuq k1,zmm16,zmm18
  4025da:	62 a1 ed 40 d4 d3    	vpaddq zmm18,zmm18,zmm19
  4025e0:	62 a1 fd c9 10 24 c2 	vmovupd zmm20{k1}{z},ZMMWORD PTR [rdx+r8*8]
  4025e7:	62 a2 f5 c1 a8 24 c6 	vfmadd213pd zmm20{k1}{z},zmm17,ZMMWORD PTR [rsi+r8*8]
  4025ee:	62 a1 fd 49 11 24 c0 	vmovupd ZMMWORD PTR [rax+r8*8]{k1},zmm20
  4025f5:	49 83 c0 08          	add    r8,0x8
  4025f9:	4c 3b c1             	cmp    r8,rcx
  4025fc:	72 d5                	jb     4025d3 <triadd_ref(double*, double const*, double const*, double, unsigned long)+0x123>
  4025fe:	c5 f8 77             	vzeroupper 
  402601:	c3                   	ret    
  402602:	33 c0                	xor    eax,eax
  402604:	eb 92                	jmp    402598 <triadd_ref(double*, double const*, double const*, double, unsigned long)+0xe8>
  402606:	48 89 c8             	mov    rax,rcx
  402609:	45 33 c0             	xor    r8d,r8d
  40260c:	48 83 e0 f8          	and    rax,0xfffffffffffffff8
  402610:	e9 56 ff ff ff       	jmp    40256b <triadd_ref(double*, double const*, double const*, double, unsigned long)+0xbb>
  402615:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402619:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	
