	.file	"kiss_fft.c"
# GNU C11 (GCC) version 5.3.1 20151207 (Red Hat 5.3.1-2) (x86_64-redhat-linux)
#	compiled by GNU C version 5.3.1 20151207 (Red Hat 5.3.1-2), GMP version 6.0.0, MPFR version 3.1.3, MPC version 1.0.2
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  kiss_fft.c --param l1-cache-size=32
# --param l1-cache-line-size=64 --param l2-cache-size=6144 -mtune=ivybridge
# -march=x86-64 -O3 -ffast-math -fomit-frame-pointer -fverbose-asm
# options enabled:  -faggressive-loop-optimizations -falign-labels
# -fassociative-math -fasynchronous-unwind-tables -fauto-inc-dec
# -fbranch-count-reg -fcaller-saves -fchkp-check-incomplete-type
# -fchkp-check-read -fchkp-check-write -fchkp-instrument-calls
# -fchkp-narrow-bounds -fchkp-optimize -fchkp-store-bounds
# -fchkp-use-static-bounds -fchkp-use-static-const-bounds
# -fchkp-use-wrappers -fcombine-stack-adjustments -fcommon -fcompare-elim
# -fcprop-registers -fcrossjumping -fcse-follow-jumps -fcx-limited-range
# -fdefer-pop -fdelete-null-pointer-checks -fdevirtualize
# -fdevirtualize-speculatively -fdwarf2-cfi-asm -fearly-inlining
# -feliminate-unused-debug-types -fexpensive-optimizations
# -ffinite-math-only -fforward-propagate -ffunction-cse -fgcse
# -fgcse-after-reload -fgcse-lm -fgnu-runtime -fgnu-unique
# -fguess-branch-probability -fhoist-adjacent-loads -fident -fif-conversion
# -fif-conversion2 -findirect-inlining -finline -finline-atomics
# -finline-functions -finline-functions-called-once
# -finline-small-functions -fipa-cp -fipa-cp-alignment -fipa-cp-clone
# -fipa-icf -fipa-icf-functions -fipa-icf-variables -fipa-profile
# -fipa-pure-const -fipa-ra -fipa-reference -fipa-sra -fira-hoist-pressure
# -fira-share-save-slots -fira-share-spill-slots
# -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
# -fleading-underscore -flifetime-dse -flra-remat -flto-odr-type-merging
# -fmerge-constants -fmerge-debug-strings -fmove-loop-invariants
# -fomit-frame-pointer -foptimize-sibling-calls -foptimize-strlen
# -fpartial-inlining -fpeephole -fpeephole2 -fpredictive-commoning
# -fprefetch-loop-arrays -freciprocal-math -free -freg-struct-return
# -freorder-blocks -freorder-blocks-and-partition -freorder-functions
# -frerun-cse-after-loop -fsched-critical-path-heuristic
# -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
# -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
# -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-fusion
# -fschedule-insns2 -fsemantic-interposition -fshow-column -fshrink-wrap
# -fsplit-ivs-in-unroller -fsplit-wide-types -fssa-phiopt -fstdarg-opt
# -fstrict-aliasing -fstrict-overflow -fstrict-volatile-bitfields
# -fsync-libcalls -fthread-jumps -ftoplevel-reorder -ftree-bit-ccp
# -ftree-builtin-call-dce -ftree-ccp -ftree-ch -ftree-coalesce-vars
# -ftree-copy-prop -ftree-copyrename -ftree-cselim -ftree-dce
# -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
# -ftree-loop-distribute-patterns -ftree-loop-if-convert -ftree-loop-im
# -ftree-loop-ivcanon -ftree-loop-optimize -ftree-loop-vectorize
# -ftree-parallelize-loops= -ftree-partial-pre -ftree-phiprop -ftree-pre
# -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink
# -ftree-slp-vectorize -ftree-slsr -ftree-sra -ftree-switch-conversion
# -ftree-tail-merge -ftree-ter -ftree-vrp -funit-at-a-time
# -funsafe-math-optimizations -funswitch-loops -funwind-tables
# -fverbose-asm -fzero-initialized-in-bss -m128bit-long-double -m64 -m80387
# -malign-stringops -mavx256-split-unaligned-load
# -mavx256-split-unaligned-store -mfancy-math-387 -mfp-ret-in-387 -mfxsr
# -mglibc -mlong-double-80 -mmmx -mno-sse4 -mpush-args -mred-zone -msse
# -msse2 -mtls-direct-seg-refs -mvzeroupper

	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.type	kf_bfly5, @function
kf_bfly5:
.LFB48:
	.cfi_startproc
# BLOCK 2 freq:900 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	movslq	%ecx, %r9	# m, D.5249
	addq	$264, %rdx	#, twiddles
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%r9, %rax	# D.5249, D.5249
	pushq	%rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	salq	$3, %r9	#, D.5249
	imulq	%rsi, %rax	# fstride, D.5249
	salq	$3, %rax	#, D.5249
	leaq	(%rdx,%rax), %r8	#, D.5250
	movss	4(%r8), %xmm7	# MEM[(struct kiss_fft_cpx *)_15 + 4B], ya$i
	addq	%r8, %rax	# D.5250, D.5250
	movss	(%r8), %xmm15	# MEM[(struct kiss_fft_cpx *)_15], ya$r
	leaq	(%rdi,%r9), %r8	#, Fout1
	movss	%xmm7, -4(%rsp)	# ya$i, %sfp
	movss	(%rax), %xmm7	# MEM[(struct kiss_fft_cpx *)_18], yb$r
	leaq	(%r8,%r9), %r10	#, Fout2
	leaq	(%r10,%r9), %r11	#, Fout3
	movss	%xmm7, -8(%rsp)	# yb$r, %sfp
	movss	4(%rax), %xmm7	# MEM[(struct kiss_fft_cpx *)_18 + 4B], yb$i
	addq	%r11, %r9	# Fout3, Fout4
	movss	%xmm7, -12(%rsp)	# yb$i, %sfp
	testl	%ecx, %ecx	# m
# SUCC: 3 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 5 [9.0%]  (CAN_FALLTHRU)
	jle	.L1	#,
# BLOCK 3 freq:819 seq:1
# PRED: 2 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	0(,%rsi,8), %rbp	#, D.5249
	movss	-4(%rsp), %xmm14	# %sfp, ya$i
	salq	$4, %rsi	#, tmp221
	leal	-1(%rcx), %eax	#, D.5251
	leaq	(%rsi,%rbp), %rbx	#, tmp222
	movq	%rdx, %rsi	# twiddles, ivtmp.98
	leaq	8(%r8,%rax,8), %rcx	#, D.5250
# SUCC: 4 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	xorl	%eax, %eax	# ivtmp.91
# BLOCK 4 freq:9100 seq:2
# PRED: 3 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L3:
	movss	4(%r8), %xmm0	# MEM[base: Fout1_168, offset: 4B], D.5248
	addq	$8, %r8	#, Fout1
	addq	$8, %rdi	#, Fout
	addq	$8, %r10	#, Fout2
	movss	-8(%r8), %xmm3	# MEM[base: Fout1_168, offset: 0B], D.5248
	addq	$8, %r11	#, Fout3
	addq	$8, %r9	#, Fout4
	movss	4(%rdx,%rax), %xmm2	# MEM[base: twiddles_9, index: ivtmp.91_121, offset: 4B], D.5248
	movaps	%xmm0, %xmm4	# D.5248, D.5248
	movss	(%rdx,%rax), %xmm1	# MEM[base: twiddles_9, index: ivtmp.91_121, offset: 0B], D.5248
	movaps	%xmm3, %xmm10	# D.5248, D.5248
	mulss	%xmm2, %xmm4	# D.5248, D.5248
	movss	-8(%r11), %xmm8	# MEM[base: Fout3_175, offset: 0B], D.5248
	mulss	%xmm3, %xmm2	# D.5248, D.5248
	movss	4(%rdx,%rax,2), %xmm3	# MEM[base: twiddles_9, index: ivtmp.91_121, step: 2, offset: 4B], D.5248
	mulss	%xmm1, %xmm10	# D.5248, D.5248
	movaps	%xmm8, %xmm9	# D.5248, D.5248
	movss	-4(%rdi), %xmm7	# MEM[base: Fout_169, offset: 4B], scratch$0$i
	mulss	%xmm1, %xmm0	# D.5248, D.5248
	movss	-8(%r9), %xmm6	# MEM[base: Fout4_174, offset: 0B], D.5248
	movss	-8(%rdi), %xmm13	# MEM[base: Fout_169, offset: 0B], scratch$0$r
	movaps	%xmm2, %xmm1	# D.5248, D.5248
	movss	-4(%r10), %xmm2	# MEM[base: Fout2_173, offset: 4B], D.5248
	subss	%xmm4, %xmm10	# D.5248, D.5248
	movss	-8(%r10), %xmm4	# MEM[base: Fout2_173, offset: 0B], D.5248
	addss	%xmm0, %xmm1	# D.5248, D.5248
	movaps	%xmm2, %xmm5	# D.5248, D.5248
	movss	(%rdx,%rax,2), %xmm0	# MEM[base: twiddles_9, index: ivtmp.91_121, step: 2, offset: 0B], D.5248
	mulss	%xmm3, %xmm5	# D.5248, D.5248
	movaps	%xmm4, %xmm12	# D.5248, D.5248
	mulss	%xmm4, %xmm3	# D.5248, D.5248
	movss	(%rsi), %xmm4	# MEM[base: _358, offset: 0B], D.5248
	mulss	%xmm0, %xmm2	# D.5248, D.5248
	mulss	%xmm0, %xmm12	# D.5248, D.5248
	mulss	%xmm4, %xmm9	# D.5248, D.5248
	movaps	%xmm3, %xmm0	# D.5248, D.5248
	movss	4(%rsi), %xmm3	# MEM[base: _358, offset: 4B], D.5248
	addq	%rbx, %rsi	# tmp222, ivtmp.98
	addss	%xmm2, %xmm0	# D.5248, D.5248
	movss	-4(%r11), %xmm2	# MEM[base: Fout3_175, offset: 4B], D.5248
	subss	%xmm5, %xmm12	# D.5248, D.5248
	movaps	%xmm2, %xmm5	# D.5248, D.5248
	mulss	%xmm3, %xmm5	# D.5248, D.5248
	mulss	%xmm4, %xmm2	# D.5248, D.5248
	movss	(%rdx,%rax,4), %xmm4	# MEM[base: twiddles_9, index: ivtmp.91_121, step: 4, offset: 0B], D.5248
	mulss	%xmm8, %xmm3	# D.5248, D.5248
	subss	%xmm5, %xmm9	# D.5248, D.5248
	movaps	%xmm6, %xmm5	# D.5248, D.5248
	mulss	%xmm4, %xmm5	# D.5248, D.5248
	addss	%xmm2, %xmm3	# D.5248, D.5248
	movss	-4(%r9), %xmm2	# MEM[base: Fout4_174, offset: 4B], D.5248
	movaps	%xmm2, %xmm11	# D.5248, D.5248
	mulss	%xmm4, %xmm2	# D.5248, D.5248
	movaps	%xmm3, %xmm8	# D.5248, D.5248
	movss	4(%rdx,%rax,4), %xmm3	# MEM[base: twiddles_9, index: ivtmp.91_121, step: 4, offset: 4B], D.5248
	movaps	%xmm12, %xmm4	# D.5248, D.5248
	addss	%xmm9, %xmm4	# D.5248, D.5248
	addq	%rbp, %rax	# D.5249, ivtmp.91
	mulss	%xmm3, %xmm11	# D.5248, D.5248
	subss	%xmm9, %xmm12	# D.5248, D.5248
	mulss	%xmm6, %xmm3	# D.5248, D.5248
	movaps	%xmm10, %xmm6	# D.5248, D.5248
	subss	%xmm11, %xmm5	# D.5248, D.5248
	addss	%xmm3, %xmm2	# D.5248, D.5248
	movaps	%xmm1, %xmm3	# D.5248, D.5248
	addss	%xmm5, %xmm6	# D.5248, D.5248
	addss	%xmm2, %xmm3	# D.5248, D.5248
	subss	%xmm2, %xmm1	# D.5248, D.5248
	movaps	%xmm0, %xmm2	# D.5248, D.5248
	addss	%xmm8, %xmm2	# D.5248, D.5248
	movaps	%xmm6, %xmm9	# D.5248, D.5248
	subss	%xmm8, %xmm0	# D.5248, D.5248
	movaps	%xmm6, %xmm8	# D.5248, D.5248
	movaps	%xmm3, %xmm11	# D.5248, D.5248
	addss	%xmm13, %xmm8	# scratch$0$r, D.5248
	mulss	%xmm15, %xmm11	# ya$r, D.5248
	subss	%xmm5, %xmm10	# D.5248, D.5248
	mulss	%xmm15, %xmm9	# ya$r, D.5248
	movss	-8(%rsp), %xmm5	# %sfp, yb$r
	addss	%xmm4, %xmm8	# D.5248, D.5248
	addss	%xmm7, %xmm11	# scratch$0$i, D.5248
	addss	%xmm13, %xmm9	# scratch$0$r, D.5248
	movss	%xmm8, -8(%rdi)	# D.5248, MEM[base: Fout_169, offset: 0B]
	movaps	%xmm3, %xmm8	# D.5248, D.5248
	addss	%xmm7, %xmm8	# scratch$0$i, D.5248
	addss	%xmm2, %xmm8	# D.5248, D.5248
	movss	%xmm8, -4(%rdi)	# D.5248, MEM[base: Fout_169, offset: 4B]
	movaps	%xmm5, %xmm8	# yb$r, D.5248
	mulss	%xmm2, %xmm5	# D.5248, D.5248
	mulss	%xmm4, %xmm8	# D.5248, D.5248
	mulss	%xmm15, %xmm4	# ya$r, D.5248
	mulss	%xmm15, %xmm2	# ya$r, D.5248
	addss	%xmm5, %xmm11	# D.5248, D.5248
	movss	-12(%rsp), %xmm5	# %sfp, D.5248
	addss	%xmm8, %xmm9	# D.5248, D.5248
	movaps	%xmm14, %xmm8	# ya$i, D.5248
	mulss	%xmm0, %xmm5	# D.5248, D.5248
	mulss	%xmm1, %xmm8	# D.5248, D.5248
	mulss	%xmm10, %xmm14	# D.5248, D.5248
	addss	%xmm5, %xmm8	# D.5248, D.5248
	movss	-12(%rsp), %xmm5	# %sfp, D.5248
	mulss	%xmm12, %xmm5	# D.5248, D.5248
	addss	%xmm14, %xmm5	# D.5248, D.5248
	movaps	%xmm9, %xmm14	# D.5248, D.5248
	subss	%xmm8, %xmm14	# D.5248, D.5248
	addss	%xmm9, %xmm8	# D.5248, D.5248
	movss	%xmm14, -8(%r8)	# D.5248, MEM[base: Fout1_168, offset: 0B]
	movaps	%xmm5, %xmm14	# D.5248, D.5248
	addss	%xmm11, %xmm14	# D.5248, D.5248
	subss	%xmm5, %xmm11	# D.5248, D.5248
	movss	-8(%rsp), %xmm5	# %sfp, yb$r
	mulss	%xmm5, %xmm6	# yb$r, D.5248
	movss	%xmm14, -4(%r8)	# D.5248, MEM[base: Fout1_168, offset: 4B]
	movss	-4(%rsp), %xmm14	# %sfp, ya$i
	mulss	%xmm5, %xmm3	# yb$r, D.5248
	movss	-12(%rsp), %xmm5	# %sfp, yb$i
	movss	%xmm8, -8(%r9)	# D.5248, MEM[base: Fout4_174, offset: 0B]
	mulss	%xmm14, %xmm0	# ya$i, D.5248
	movss	%xmm11, -4(%r9)	# D.5248, MEM[base: Fout4_174, offset: 4B]
	mulss	%xmm5, %xmm1	# yb$i, D.5248
	addss	%xmm13, %xmm6	# scratch$0$r, D.5248
	mulss	%xmm5, %xmm10	# yb$i, D.5248
	addss	%xmm7, %xmm3	# scratch$0$i, D.5248
	mulss	%xmm14, %xmm12	# ya$i, D.5248
	addss	%xmm4, %xmm6	# D.5248, D.5248
	subss	%xmm1, %xmm0	# D.5248, D.5248
	addss	%xmm2, %xmm3	# D.5248, D.5248
	movaps	%xmm6, %xmm1	# D.5248, D.5248
	subss	%xmm12, %xmm10	# D.5248, D.5248
	addss	%xmm0, %xmm1	# D.5248, D.5248
	subss	%xmm0, %xmm6	# D.5248, D.5248
	movss	%xmm1, -8(%r10)	# D.5248, MEM[base: Fout2_173, offset: 0B]
	movaps	%xmm3, %xmm1	# D.5248, D.5248
	subss	%xmm10, %xmm3	# D.5248, D.5248
	addss	%xmm10, %xmm1	# D.5248, D.5248
	movss	%xmm1, -4(%r10)	# D.5248, MEM[base: Fout2_173, offset: 4B]
	movss	%xmm6, -8(%r11)	# D.5248, MEM[base: Fout3_175, offset: 0B]
	movss	%xmm3, -4(%r11)	# D.5248, MEM[base: Fout3_175, offset: 4B]
	cmpq	%rcx, %r8	# D.5250, Fout1
# SUCC: 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 5 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L3	#,
# BLOCK 5 freq:900 seq:3
# PRED: 2 [9.0%]  (CAN_FALLTHRU) 4 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
.L1:
	popq	%rbx	#
	.cfi_def_cfa_offset 16
	popq	%rbp	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%] 
	ret
	.cfi_endproc
.LFE48:
	.size	kf_bfly5, .-kf_bfly5
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.text.unlikely
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.type	kf_bfly_generic, @function
kf_bfly_generic:
.LFB49:
	.cfi_startproc
# BLOCK 2 freq:9 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14	# Fout, Fout
	movslq	%r8d, %rdi	# p, D.5294
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	salq	$3, %rdi	#, D.5294
	movl	%ecx, %r13d	# m, m
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12	# fstride, fstride
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	leaq	264(%rdx), %rbp	#, twiddles
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp	#,
	.cfi_def_cfa_offset 96
	movl	(%rdx), %ebx	# st_13(D)->nfft, Norig
	movl	%r8d, 8(%rsp)	# p, %sfp
	call	malloc	#
	testl	%r13d, %r13d	# m
	movl	8(%rsp), %r8d	# %sfp, p
# SUCC: 3 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 12 [9.0%]  (CAN_FALLTHRU)
	jle	.L10	#,
# BLOCK 3 freq:8 seq:1
# PRED: 2 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	leal	-1(%r13), %edx	#, D.5296
	movq	%r14, 8(%rsp)	# ivtmp.141, %sfp
	leaq	8(%r14,%rdx,8), %rdi	#, D.5300
	movl	%r12d, 20(%rsp)	# fstride, %sfp
	leal	-1(%r8), %edx	#, D.5296
	movq	%rdi, 24(%rsp)	# D.5300, %sfp
	movslq	%r13d, %rdi	# m, D.5294
	imull	%r12d, %r13d	# fstride, D.5295
	leaq	8(%rax,%rdx,8), %r14	#, D.5300
	salq	$3, %rdi	#, D.5294
	movl	$0, 16(%rsp)	#, %sfp
	leal	-2(%r8), %edx	#, D.5296
# SUCC: 4 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	16(%rax,%rdx,8), %r10	#, D.5300
# BLOCK 4 freq:89 seq:2
# PRED: 3 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 11 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
.L17:
	movq	%rax, %rdx	# scratch, ivtmp.136
	movq	8(%rsp), %rcx	# %sfp, ivtmp.134
	testl	%r8d, %r8d	# p
# SUCC: 5 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 11 [9.0%]  (CAN_FALLTHRU)
	jle	.L14	#,
# BLOCK 5 freq:900 seq:3
# PRED: 4 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 5 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L19:
	movq	(%rcx), %rsi	# MEM[base: _37, offset: 0B], MEM[base: _37, offset: 0B]
	addq	$8, %rdx	#, ivtmp.136
	addq	%rdi, %rcx	# D.5294, ivtmp.134
	movq	%rsi, -8(%rdx)	# MEM[base: _37, offset: 0B], MEM[base: _111, offset: 0B]
	cmpq	%r14, %rdx	# D.5300, ivtmp.136
# SUCC: 5 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 6 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L19	#,
# BLOCK 6 freq:81 seq:4
# PRED: 5 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	movl	16(%rsp), %r9d	# %sfp, ivtmp.125
	xorl	%r11d, %r11d	# q1
	movq	8(%rsp), %rsi	# %sfp, ivtmp.123
# SUCC: 7 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	(%rax), %r12	# *scratch_21, *scratch_21
# BLOCK 7 freq:900 seq:5
# PRED: 6 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 10 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L13:
	movq	%r12, (%rsi)	# *scratch_21, MEM[base: _120, offset: 0B]
	cmpl	$1, %r8d	#, p
# SUCC: 8 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 10 [9.0%]  (CAN_FALLTHRU)
	je	.L16	#,
# BLOCK 8 freq:819 seq:6
# PRED: 7 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	(%rsi), %xmm6	# MEM[base: _120, offset: 0B], D.5298
	leaq	8(%rax), %rcx	#, ivtmp.113
	xorl	%edx, %edx	# twidx
# SUCC: 9 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	4(%rsi), %xmm5	# MEM[base: _120, offset: 4B], D.5298
# BLOCK 9 freq:9100 seq:7
# PRED: 8 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 9 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L15:
	addl	%r9d, %edx	# ivtmp.125, D.5295
	movss	(%rcx), %xmm3	# MEM[base: _154, offset: 0B], D.5298
	movl	%edx, %r15d	# D.5295, twidx
	movss	4(%rcx), %xmm0	# MEM[base: _154, offset: 4B], D.5298
	subl	%ebx, %r15d	# Norig, twidx
	cmpl	%edx, %ebx	# D.5295, Norig
	movaps	%xmm3, %xmm4	# D.5298, D.5298
	cmovle	%r15d, %edx	# D.5295,, twidx, twidx
	movaps	%xmm0, %xmm7	# D.5298, D.5298
	addq	$8, %rcx	#, ivtmp.113
	movslq	%edx, %r15	# twidx, D.5294
	leaq	0(%rbp,%r15,8), %r15	#, D.5299
	movss	(%r15), %xmm1	# _53->r, D.5298
	movss	4(%r15), %xmm2	# _53->i, D.5298
	mulss	%xmm1, %xmm4	# D.5298, D.5298
	mulss	%xmm2, %xmm7	# D.5298, D.5298
	mulss	%xmm1, %xmm0	# D.5298, D.5298
	mulss	%xmm3, %xmm2	# D.5298, D.5298
	subss	%xmm7, %xmm4	# D.5298, D.5298
	addss	%xmm2, %xmm0	# D.5298, D.5298
	addss	%xmm4, %xmm6	# D.5298, D.5298
	addss	%xmm0, %xmm5	# D.5298, D.5298
	movss	%xmm6, (%rsi)	# D.5298, MEM[base: _120, offset: 0B]
	movss	%xmm5, 4(%rsi)	# D.5298, MEM[base: _120, offset: 4B]
	cmpq	%rcx, %r10	# ivtmp.113, D.5300
# SUCC: 9 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 10 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L15	#,
# BLOCK 10 freq:900 seq:8
# PRED: 7 [9.0%]  (CAN_FALLTHRU) 9 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
.L16:
	addl	$1, %r11d	#, q1
	addq	%rdi, %rsi	# D.5294, ivtmp.123
	addl	%r13d, %r9d	# D.5295, ivtmp.125
	cmpl	%r11d, %r8d	# q1, p
# SUCC: 7 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 11 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L13	#,
# BLOCK 11 freq:89 seq:9
# PRED: 10 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT) 4 [9.0%]  (CAN_FALLTHRU)
.L14:
	addq	$8, 8(%rsp)	#, %sfp
	movl	20(%rsp), %edx	# %sfp, D.5295
	movq	8(%rsp), %rsi	# %sfp, ivtmp.141
	addl	%edx, 16(%rsp)	# D.5295, %sfp
	cmpq	24(%rsp), %rsi	# %sfp, ivtmp.141
# SUCC: 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 12 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L17	#,
# BLOCK 12 freq:9 seq:10
# PRED: 2 [9.0%]  (CAN_FALLTHRU) 11 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
.L10:
	addq	$40, %rsp	#,
	.cfi_def_cfa_offset 56
	movq	%rax, %rdi	# scratch,
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	free	#
	.cfi_endproc
.LFE49:
	.size	kf_bfly_generic, .-kf_bfly_generic
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.text.unlikely
.LCOLDB3:
	.text
.LHOTB3:
	.p2align 4,,15
	.type	kf_work, @function
kf_work:
.LFB50:
	.cfi_startproc
# BLOCK 2 freq:1250 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %r15	# Fout, Fout
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14	# f, f
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movslq	%ecx, %rbp	# in_stride,
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%r9, %rbx	# st, st
	subq	$72, %rsp	#,
	.cfi_def_cfa_offset 128
	movl	(%r8), %eax	# *factors_10(D), p
	movl	4(%r8), %edi	# MEM[(int *)factors_10(D) + 4B], m
	movq	%rdx, 32(%rsp)	# fstride, %sfp
	movl	%eax, %edx	# p, D.5407
	movl	%eax, 40(%rsp)	# p, %sfp
	imull	%edi, %edx	# m, D.5407
	movl	%edi, 44(%rsp)	# m, %sfp
	movslq	%edx, %rdx	# D.5407, D.5408
	leaq	(%r15,%rdx,8), %r12	#, Fout_end
	cmpl	$1, %edi	#, m
# SUCC: 19 [28.0%]  (CAN_FALLTHRU) 3 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L50	#,
# BLOCK 3 freq:900 seq:1
# PRED: 2 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	32(%rsp), %rdi	# %sfp, fstride
	movq	%r15, 56(%rsp)	# Fout, %sfp
	movslq	40(%rsp), %r13	# %sfp, D.5408
	movslq	44(%rsp), %rdx	# %sfp, D.5408
	movq	%rdi, %rax	# fstride, fstride
	imulq	%rdi, %r13	# fstride, D.5408
	salq	$3, %rax	#, D.5408
	movq	%rax, 48(%rsp)	# D.5408, %sfp
	leaq	8(%r8), %rdi	#, factors
	movq	%rax, %rsi	# D.5408, D.5408
	movslq	%ebp, %rax	# in_stride, D.5408
	imulq	%rsi, %rax	# D.5408, D.5408
	movq	%rdi, 24(%rsp)	# factors, %sfp
	leaq	0(,%rdx,8), %rsi	#, D.5408
	movq	%rsi, 16(%rsp)	# D.5408, %sfp
	movq	%rax, 8(%rsp)	# D.5408, %sfp
	movq	%r13, %rax	# D.5408, D.5408
	movq	%r15, %r13	# Fout, Fout
	movq	%rax, %r15	# D.5408, D.5408
	movl	%ebp, %eax	# in_stride, in_stride
	movq	%r13, %rbp	# Fout, Fout
# SUCC: 4 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%eax, %r13d	# in_stride, in_stride
# BLOCK 4 freq:10000 seq:2
# PRED: 3 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L30:
	movq	24(%rsp), %r8	# %sfp,
	movq	%r14, %rsi	# f,
	movq	%rbp, %rdi	# Fout,
	movq	%rbx, %r9	# st,
	movl	%r13d, %ecx	# in_stride,
	movq	%r15, %rdx	# D.5408,
	call	kf_work	#
	addq	16(%rsp), %rbp	# %sfp, Fout
	addq	8(%rsp), %r14	# %sfp, f
	cmpq	%rbp, %r12	# Fout, Fout_end
# SUCC: 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 5 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L30	#,
# BLOCK 5 freq:900 seq:3
# PRED: 4 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$3, 40(%rsp)	#, %sfp
	movq	56(%rsp), %r15	# %sfp, Fout
# SUCC: 22 [20.0%]  (CAN_FALLTHRU) 6 [80.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L32	#,
# BLOCK 6 freq:1000 seq:4
# PRED: 5 [80.0%]  (FALLTHRU,CAN_FALLTHRU) 21 [80.0%]  (CAN_FALLTHRU)
.L53:
# SUCC: 7 [62.5%]  (FALLTHRU,CAN_FALLTHRU) 15 [37.5%]  (CAN_FALLTHRU)
	jle	.L51	#,
# BLOCK 7 freq:625 seq:5
# PRED: 6 [62.5%]  (FALLTHRU,CAN_FALLTHRU)
	movl	40(%rsp), %eax	# %sfp, p
	cmpl	$4, %eax	#, p
# SUCC: 10 [40.0%]  (CAN_FALLTHRU) 8 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L35	#,
# BLOCK 8 freq:375 seq:6
# PRED: 7 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%eax, %r8d	# p,
	cmpl	$5, %eax	#, p
# SUCC: 25 [33.3%]  (CAN_FALLTHRU) 9 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L31	#,
# BLOCK 9 freq:250 seq:7
# PRED: 8 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movl	44(%rsp), %ecx	# %sfp,
	movq	%rbx, %rdx	# st,
	movq	%r15, %rdi	# Fout,
	movq	32(%rsp), %rsi	# %sfp,
	addq	$72, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	kf_bfly5	#
# BLOCK 10 freq:250 seq:8
# PRED: 7 [40.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L35:
	.cfi_restore_state
	movslq	44(%rsp), %r10	# %sfp, k
	leaq	264(%rbx), %rdi	#, tw3
	movq	32(%rsp), %rax	# %sfp, fstride
	movq	%rdi, %r9	# tw3, tw3
	movq	%rdi, %r8	# tw3, tw3
	movl	4(%rbx), %ebx	# st_32(D)->inverse, D.5407
	leaq	0(,%r10,8), %rdx	#, D.5408
	leaq	(%r15,%rdx), %rsi	#, ivtmp.200
	movq	%rax, %r11	# fstride, D.5408
	leaq	(%rax,%rax,2), %rbp	#, tmp339
	salq	$4, %r11	#, D.5408
	movq	48(%rsp), %rax	# %sfp, D.5408
	leaq	(%rsi,%rdx), %rcx	#, ivtmp.203
	salq	$3, %rbp	#, tmp340
	addq	%rcx, %rdx	# ivtmp.203, ivtmp.206
# SUCC: 13 [100.0%]  (CAN_FALLTHRU)
	jmp	.L43	#
# BLOCK 11 freq:1389 seq:9
# PRED: 13 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L52:
	subss	%xmm5, %xmm0	# D.5409, D.5409
	addss	%xmm5, %xmm3	# D.5409, D.5409
	movss	%xmm0, (%rsi)	# D.5409, MEM[base: _494, offset: 0B]
	movaps	%xmm9, %xmm0	# D.5409, D.5409
	subss	%xmm6, %xmm9	# D.5409, D.5409
	addss	%xmm6, %xmm0	# D.5409, D.5409
	movss	%xmm0, 4(%rsi)	# D.5409, MEM[base: _494, offset: 4B]
	movss	%xmm3, (%rdx)	# D.5409, MEM[base: _490, offset: 0B]
# SUCC: 12 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	%xmm9, 4(%rdx)	# D.5409, MEM[base: _490, offset: 4B]
# BLOCK 12 freq:2778 seq:10
# PRED: 11 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 14 [100.0%]  (CAN_FALLTHRU)
.L42:
	addq	$8, %r15	#, Fout
	addq	$8, %rsi	#, ivtmp.200
	addq	$8, %rcx	#, ivtmp.203
	addq	$8, %rdx	#, ivtmp.206
	subq	$1, %r10	#, k
# SUCC: 13 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 18 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	je	.L26	#,
# BLOCK 13 freq:2778 seq:11
# PRED: 12 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 10 [100.0%]  (CAN_FALLTHRU)
.L43:
	movss	(%rsi), %xmm5	# MEM[base: _494, offset: 0B], D.5409
	movss	4(%rsi), %xmm0	# MEM[base: _494, offset: 4B], D.5409
	movss	(%rdi), %xmm1	# MEM[base: tw3_155, offset: 0B], D.5409
	movaps	%xmm5, %xmm6	# D.5409, D.5409
	movss	4(%rdi), %xmm2	# MEM[base: tw3_155, offset: 4B], D.5409
	movaps	%xmm0, %xmm3	# D.5409, D.5409
	addq	%rax, %rdi	# D.5408, tw3
	mulss	%xmm1, %xmm0	# D.5409, D.5409
	movss	(%rcx), %xmm4	# MEM[base: _492, offset: 0B], D.5409
	mulss	%xmm2, %xmm3	# D.5409, D.5409
	mulss	%xmm1, %xmm6	# D.5409, D.5409
	movss	4(%r8), %xmm1	# MEM[base: tw3_168, offset: 4B], D.5409
	movaps	%xmm4, %xmm7	# D.5409, D.5409
	mulss	%xmm2, %xmm5	# D.5409, D.5409
	movss	(%r9), %xmm2	# MEM[base: tw3_181, offset: 0B], D.5409
	mulss	%xmm1, %xmm4	# D.5409, D.5409
	subss	%xmm3, %xmm6	# D.5409, D.5409
	movss	(%r8), %xmm3	# MEM[base: tw3_168, offset: 0B], D.5409
	addq	%r11, %r8	# D.5408, tw3
	addss	%xmm0, %xmm5	# D.5409, D.5409
	movss	4(%rcx), %xmm0	# MEM[base: _492, offset: 4B], D.5409
	mulss	%xmm3, %xmm7	# D.5409, D.5409
	movaps	%xmm0, %xmm8	# D.5409, D.5409
	mulss	%xmm3, %xmm0	# D.5409, D.5409
	movss	(%rdx), %xmm3	# MEM[base: _490, offset: 0B], D.5409
	mulss	%xmm1, %xmm8	# D.5409, D.5409
	movss	4(%rdx), %xmm1	# MEM[base: _490, offset: 4B], D.5409
	movaps	%xmm1, %xmm9	# D.5409, D.5409
	addss	%xmm0, %xmm4	# D.5409, D.5409
	movss	4(%r9), %xmm0	# MEM[base: tw3_181, offset: 4B], D.5409
	mulss	%xmm2, %xmm1	# D.5409, D.5409
	addq	%rbp, %r9	# tmp340, tw3
	subss	%xmm8, %xmm7	# D.5409, D.5409
	movaps	%xmm3, %xmm8	# D.5409, D.5409
	mulss	%xmm0, %xmm9	# D.5409, D.5409
	mulss	%xmm3, %xmm0	# D.5409, D.5409
	mulss	%xmm2, %xmm8	# D.5409, D.5409
	movss	(%r15), %xmm2	# MEM[base: Fout_152, offset: 0B], D.5409
	movaps	%xmm2, %xmm3	# D.5409, D.5409
	addss	%xmm7, %xmm2	# D.5409, D.5409
	addss	%xmm1, %xmm0	# D.5409, D.5409
	movss	4(%r15), %xmm1	# MEM[base: Fout_152, offset: 4B], D.5409
	subss	%xmm9, %xmm8	# D.5409, D.5409
	movaps	%xmm1, %xmm9	# D.5409, D.5409
	subss	%xmm7, %xmm3	# D.5409, D.5409
	movaps	%xmm6, %xmm7	# D.5409, D.5409
	movss	%xmm2, (%r15)	# D.5409, MEM[base: Fout_152, offset: 0B]
	addss	%xmm4, %xmm1	# D.5409, D.5409
	subss	%xmm4, %xmm9	# D.5409, D.5409
	movaps	%xmm5, %xmm4	# D.5409, D.5409
	addss	%xmm0, %xmm4	# D.5409, D.5409
	addss	%xmm8, %xmm7	# D.5409, D.5409
	movss	%xmm1, 4(%r15)	# D.5409, MEM[base: Fout_152, offset: 4B]
	subss	%xmm0, %xmm5	# D.5409, D.5409
	movaps	%xmm3, %xmm0	# D.5409, D.5409
	subss	%xmm4, %xmm1	# D.5409, D.5409
	subss	%xmm7, %xmm2	# D.5409, D.5409
	subss	%xmm8, %xmm6	# D.5409, D.5409
	movss	%xmm1, 4(%rcx)	# D.5409, MEM[base: _492, offset: 4B]
	movss	%xmm2, (%rcx)	# D.5409, MEM[base: _492, offset: 0B]
	addss	(%r15), %xmm7	# MEM[base: Fout_152, offset: 0B], D.5409
	addss	4(%r15), %xmm4	# MEM[base: Fout_152, offset: 4B], D.5409
	movss	%xmm7, (%r15)	# D.5409, MEM[base: Fout_152, offset: 0B]
	movss	%xmm4, 4(%r15)	# D.5409, MEM[base: Fout_152, offset: 4B]
	testl	%ebx, %ebx	# D.5407
# SUCC: 11 [50.0%]  (CAN_FALLTHRU) 14 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L52	#,
# BLOCK 14 freq:1389 seq:12
# PRED: 13 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	addss	%xmm5, %xmm0	# D.5409, D.5409
	subss	%xmm5, %xmm3	# D.5409, D.5409
	movss	%xmm0, (%rsi)	# D.5409, MEM[base: _494, offset: 0B]
	movaps	%xmm9, %xmm0	# D.5409, D.5409
	subss	%xmm6, %xmm0	# D.5409, D.5409
	addss	%xmm9, %xmm6	# D.5409, D.5409
	movss	%xmm0, 4(%rsi)	# D.5409, MEM[base: _494, offset: 4B]
	movss	%xmm3, (%rdx)	# D.5409, MEM[base: _490, offset: 0B]
	movss	%xmm6, 4(%rdx)	# D.5409, MEM[base: _490, offset: 4B]
# SUCC: 12 [100.0%]  (CAN_FALLTHRU)
	jmp	.L42	#
# BLOCK 15 freq:375 seq:13
# PRED: 6 [37.5%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L51:
	cmpl	$2, 40(%rsp)	#, %sfp
	movl	40(%rsp), %r8d	# %sfp,
# SUCC: 25 [33.3%]  (CAN_FALLTHRU) 16 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L31	#,
# BLOCK 16 freq:250 seq:14
# PRED: 15 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movslq	44(%rsp), %rdx	# %sfp,
	addq	$264, %rbx	#, tw1
	movq	%rdx, %rax	#,
	leal	-1(%rax), %ecx	#, D.5415
	movq	48(%rsp), %rax	# %sfp, D.5408
	leaq	(%r15,%rdx,8), %rdx	#, Fout2
# SUCC: 17 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	8(%rdx,%rcx,8), %rcx	#, D.5410
# BLOCK 17 freq:2778 seq:15
# PRED: 16 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 17 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L37:
	movss	(%rdx), %xmm3	# MEM[base: Fout2_54, offset: 0B], D.5409
	addq	$8, %rdx	#, Fout2
	addq	$8, %r15	#, Fout
	movss	-4(%rdx), %xmm1	# MEM[base: Fout2_54, offset: 4B], D.5409
	movss	(%rbx), %xmm2	# MEM[base: tw1_56, offset: 0B], D.5409
	movaps	%xmm3, %xmm4	# D.5409, D.5409
	movss	4(%rbx), %xmm0	# MEM[base: tw1_56, offset: 4B], D.5409
	movaps	%xmm1, %xmm5	# D.5409, D.5409
	addq	%rax, %rbx	# D.5408, tw1
	mulss	%xmm2, %xmm4	# D.5409, D.5409
	mulss	%xmm0, %xmm5	# D.5409, D.5409
	mulss	%xmm2, %xmm1	# D.5409, D.5409
	mulss	%xmm3, %xmm0	# D.5409, D.5409
	subss	%xmm5, %xmm4	# D.5409, D.5409
	addss	%xmm1, %xmm0	# D.5409, D.5409
	movss	-8(%r15), %xmm1	# MEM[base: Fout_68, offset: 0B], MEM[base: Fout_68, offset: 0B]
	subss	%xmm4, %xmm1	# D.5409, D.5409
	movss	%xmm1, -8(%rdx)	# D.5409, MEM[base: Fout2_54, offset: 0B]
	movss	-4(%r15), %xmm1	# MEM[base: Fout_68, offset: 4B], MEM[base: Fout_68, offset: 4B]
	subss	%xmm0, %xmm1	# D.5409, D.5409
	movss	%xmm1, -4(%rdx)	# D.5409, MEM[base: Fout2_54, offset: 4B]
	addss	-8(%r15), %xmm4	# MEM[base: Fout_68, offset: 0B], D.5409
	addss	-4(%r15), %xmm0	# MEM[base: Fout_68, offset: 4B], D.5409
	movss	%xmm4, -8(%r15)	# D.5409, MEM[base: Fout_68, offset: 0B]
	movss	%xmm0, -4(%r15)	# D.5409, MEM[base: Fout_68, offset: 4B]
	cmpq	%rcx, %rdx	# D.5410, Fout2
# SUCC: 17 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 18 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L37	#,
# BLOCK 18 freq:500 seq:16
# PRED: 17 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT) 12 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT)
.L26:
	addq	$72, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%] 
	ret
# BLOCK 19 freq:350 seq:17
# PRED: 2 [28.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L50:
	.cfi_restore_state
	movq	32(%rsp), %rax	# %sfp, fstride
	movq	%r15, %rdx	# Fout, Fout
	salq	$3, %rax	#, D.5408
	imulq	%rax, %rbp	# D.5408, D.5408
# SUCC: 20 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, 48(%rsp)	# D.5408, %sfp
# BLOCK 20 freq:3889 seq:18
# PRED: 19 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 20 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L28:
	movq	(%r14), %rax	# MEM[base: f_3, offset: 0B], MEM[base: f_3, offset: 0B]
	addq	$8, %rdx	#, Fout
	addq	%rbp, %r14	# D.5408, f
	movq	%rax, -8(%rdx)	# MEM[base: f_3, offset: 0B], MEM[base: Fout_1, offset: 0B]
	cmpq	%rdx, %r12	# Fout, Fout_end
# SUCC: 20 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 21 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L28	#,
# BLOCK 21 freq:350 seq:19
# PRED: 20 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$3, 40(%rsp)	#, %sfp
# SUCC: 22 [20.0%]  (FALLTHRU,CAN_FALLTHRU) 6 [80.0%]  (CAN_FALLTHRU)
	jne	.L53	#,
# BLOCK 22 freq:250 seq:20
# PRED: 5 [20.0%]  (CAN_FALLTHRU) 21 [20.0%]  (FALLTHRU,CAN_FALLTHRU)
.L32:
	movq	32(%rsp), %r8	# %sfp, fstride
	movslq	44(%rsp), %rdi	# %sfp, m
	movq	48(%rsp), %rax	# %sfp, D.5408
	movsd	.LC2(%rip), %xmm6	#, tmp367
	movq	%r8, %rdx	# fstride, D.5408
	salq	$4, %r8	#, D.5408
	imulq	%rdi, %rdx	# m, D.5408
	leaq	0(,%rdi,8), %rcx	#, D.5408
	movss	268(%rbx,%rdx,8), %xmm7	# MEM[(struct  *)_82 + 4B], epi3$i
	addq	$264, %rbx	#, tw2
	leaq	(%r15,%rcx), %rdx	#, ivtmp.176
	movq	%rbx, %rsi	# tw2, tw2
# SUCC: 23 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	addq	%rdx, %rcx	# ivtmp.176, ivtmp.179
# BLOCK 23 freq:2778 seq:21
# PRED: 22 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 23 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L39:
	movss	(%rdx), %xmm2	# MEM[base: _524, offset: 0B], D.5409
	addq	$8, %r15	#, Fout
	addq	$8, %rdx	#, ivtmp.176
	addq	$8, %rcx	#, ivtmp.179
	movss	-4(%rdx), %xmm3	# MEM[base: _524, offset: 4B], D.5409
	movss	(%rbx), %xmm4	# MEM[base: tw2_89, offset: 0B], D.5409
	movaps	%xmm2, %xmm1	# D.5409, D.5409
	movss	4(%rbx), %xmm0	# MEM[base: tw2_89, offset: 4B], D.5409
	movaps	%xmm3, %xmm5	# D.5409, D.5409
	addq	%rax, %rbx	# D.5408, tw2
	mulss	%xmm4, %xmm3	# D.5409, D.5409
	mulss	%xmm0, %xmm5	# D.5409, D.5409
	mulss	%xmm4, %xmm1	# D.5409, D.5409
	movss	(%rsi), %xmm4	# MEM[base: tw2_102, offset: 0B], D.5409
	mulss	%xmm0, %xmm2	# D.5409, D.5409
	movss	4(%rsi), %xmm0	# MEM[base: tw2_102, offset: 4B], D.5409
	addq	%r8, %rsi	# D.5408, tw2
	subss	%xmm5, %xmm1	# D.5409, D.5409
	movss	-8(%rcx), %xmm5	# MEM[base: _522, offset: 0B], D.5409
	addss	%xmm3, %xmm2	# D.5409, D.5409
	movss	-4(%rcx), %xmm3	# MEM[base: _522, offset: 4B], D.5409
	movaps	%xmm5, %xmm8	# D.5409, D.5409
	mulss	%xmm4, %xmm8	# D.5409, D.5409
	movaps	%xmm3, %xmm9	# D.5409, D.5409
	mulss	%xmm0, %xmm9	# D.5409, D.5409
	mulss	%xmm4, %xmm3	# D.5409, D.5409
	movaps	%xmm1, %xmm4	# D.5409, D.5409
	mulss	%xmm5, %xmm0	# D.5409, D.5409
	pxor	%xmm5, %xmm5	# D.5411
	cvtss2sd	-8(%r15), %xmm5	# MEM[base: Fout_86, offset: 0B], D.5411
	subss	%xmm9, %xmm8	# D.5409, D.5409
	pxor	%xmm9, %xmm9	# D.5411
	addss	%xmm3, %xmm0	# D.5409, D.5409
	movaps	%xmm2, %xmm3	# D.5409, D.5409
	addss	%xmm8, %xmm4	# D.5409, D.5409
	subss	%xmm8, %xmm1	# D.5409, D.5409
	addss	%xmm0, %xmm3	# D.5409, D.5409
	cvtss2sd	%xmm4, %xmm9	# D.5409, D.5411
	mulsd	%xmm6, %xmm9	# tmp367, D.5411
	subss	%xmm0, %xmm2	# D.5409, D.5409
	mulss	%xmm7, %xmm1	# epi3$i, D.5409
	movaps	%xmm2, %xmm0	# D.5409, D.5409
	mulss	%xmm7, %xmm0	# epi3$i, D.5409
	subsd	%xmm9, %xmm5	# D.5411, D.5411
	pxor	%xmm9, %xmm9	# D.5411
	cvtss2sd	%xmm3, %xmm9	# D.5409, D.5411
	mulsd	%xmm6, %xmm9	# tmp367, D.5411
	cvtsd2ss	%xmm5, %xmm5	# D.5411, tmp445
	movss	%xmm5, -8(%rdx)	# tmp445, MEM[base: _524, offset: 0B]
	pxor	%xmm5, %xmm5	# D.5411
	cvtss2sd	-4(%r15), %xmm5	# MEM[base: Fout_86, offset: 4B], D.5411
	subsd	%xmm9, %xmm5	# D.5411, D.5411
	cvtsd2ss	%xmm5, %xmm5	# D.5411, tmp446
	movss	%xmm5, -4(%rdx)	# tmp446, MEM[base: _524, offset: 4B]
	addss	-8(%r15), %xmm4	# MEM[base: Fout_86, offset: 0B], D.5409
	addss	-4(%r15), %xmm3	# MEM[base: Fout_86, offset: 4B], D.5409
	movss	%xmm4, -8(%r15)	# D.5409, MEM[base: Fout_86, offset: 0B]
	movss	%xmm3, -4(%r15)	# D.5409, MEM[base: Fout_86, offset: 4B]
	movss	-8(%rdx), %xmm2	# MEM[base: _524, offset: 0B], D.5409
	addss	%xmm0, %xmm2	# D.5409, D.5409
	movss	%xmm2, -8(%rcx)	# D.5409, MEM[base: _522, offset: 0B]
	movss	-4(%rdx), %xmm2	# MEM[base: _524, offset: 4B], MEM[base: _524, offset: 4B]
	subss	%xmm1, %xmm2	# D.5409, D.5409
	movss	%xmm2, -4(%rcx)	# D.5409, MEM[base: _522, offset: 4B]
	movss	-8(%rdx), %xmm2	# MEM[base: _524, offset: 0B], MEM[base: _524, offset: 0B]
	addss	-4(%rdx), %xmm1	# MEM[base: _524, offset: 4B], D.5409
	subss	%xmm0, %xmm2	# D.5409, D.5409
	movss	%xmm1, -4(%rdx)	# D.5409, MEM[base: _524, offset: 4B]
	movss	%xmm2, -8(%rdx)	# D.5409, MEM[base: _524, offset: 0B]
	subq	$1, %rdi	#, m
# SUCC: 23 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 24 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L39	#,
# BLOCK 24 freq:250 seq:22
# PRED: 23 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	addq	$72, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%] 
	ret
# BLOCK 25 freq:250 seq:23
# PRED: 15 [33.3%]  (CAN_FALLTHRU) 8 [33.3%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L31:
	.cfi_restore_state
	movl	44(%rsp), %ecx	# %sfp,
	movq	%rbx, %rdx	# st,
	movq	%r15, %rdi	# Fout,
	movq	32(%rsp), %rsi	# %sfp,
	addq	$72, %rsp	#,
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	kf_bfly_generic	#
	.cfi_endproc
.LFE50:
	.size	kf_work, .-kf_work
	.section	.text.unlikely
.LCOLDE3:
	.text
.LHOTE3:
	.section	.text.unlikely
.LCOLDB4:
	.text
.LHOTB4:
	.p2align 4,,15
	.type	kf_work.constprop.1, @function
kf_work.constprop.1:
.LFB58:
	.cfi_startproc
# BLOCK 2 freq:1250 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %r15	# f, f
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14	# Fout, Fout
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movslq	%edx, %rbp	# in_stride,
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%r8, %rbx	# st, st
	subq	$56, %rsp	#,
	.cfi_def_cfa_offset 112
	movl	(%rcx), %eax	# *factors_1(D), p
	movl	4(%rcx), %edi	# MEM[(int *)factors_1(D) + 4B], m
	movl	%eax, 32(%rsp)	# p, %sfp
	imull	%edi, %eax	# m, D.5591
	movl	%edi, 36(%rsp)	# m, %sfp
	cltq
	leaq	(%r14,%rax,8), %r12	#, Fout_end
	cmpl	$1, %edi	#, m
# SUCC: 31 [28.0%]  (CAN_FALLTHRU) 3 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L109	#,
# BLOCK 3 freq:900 seq:1
# PRED: 2 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	movslq	%ebp, %r13	# in_stride, D.5592
	movq	%r14, 40(%rsp)	# Fout, %sfp
	leaq	0(,%r13,8), %rax	#, D.5592
	movq	%r14, %r13	# Fout, Fout
	movq	%rsi, %r14	# f, f
	movq	%rax, 8(%rsp)	# D.5592, %sfp
	movslq	32(%rsp), %rax	# %sfp, D.5592
	movl	%ebp, %esi	# in_stride, in_stride
	movq	%r13, %rbp	# Fout, Fout
	movl	%esi, %r13d	# in_stride, in_stride
	movq	%rax, 16(%rsp)	# D.5592, %sfp
	movslq	36(%rsp), %rax	# %sfp, D.5592
	salq	$3, %rax	#, D.5592
	movq	%rax, 24(%rsp)	# D.5592, %sfp
	leaq	8(%rcx), %rax	#, factors
# SUCC: 4 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, %r15	# factors, factors
# BLOCK 4 freq:10000 seq:2
# PRED: 3 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L63:
	movq	16(%rsp), %rdx	# %sfp,
	movq	%r14, %rsi	# f,
	movq	%rbp, %rdi	# Fout,
	movq	%rbx, %r9	# st,
	movq	%r15, %r8	# factors,
	movl	%r13d, %ecx	# in_stride,
	call	kf_work	#
	addq	24(%rsp), %rbp	# %sfp, Fout
	addq	8(%rsp), %r14	# %sfp, f
	cmpq	%rbp, %r12	# Fout, Fout_end
# SUCC: 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 5 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L63	#,
# BLOCK 5 freq:900 seq:3
# PRED: 4 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$3, 32(%rsp)	#, %sfp
	movq	40(%rsp), %r14	# %sfp, Fout
# SUCC: 34 [20.0%]  (CAN_FALLTHRU) 6 [80.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L58	#,
# BLOCK 6 freq:1000 seq:4
# PRED: 5 [80.0%]  (FALLTHRU,CAN_FALLTHRU) 33 [80.0%]  (CAN_FALLTHRU)
.L112:
# SUCC: 7 [62.5%]  (FALLTHRU,CAN_FALLTHRU) 15 [37.5%]  (CAN_FALLTHRU)
	jle	.L110	#,
# BLOCK 7 freq:625 seq:5
# PRED: 6 [62.5%]  (FALLTHRU,CAN_FALLTHRU)
	movl	32(%rsp), %eax	# %sfp, p
	cmpl	$4, %eax	#, p
# SUCC: 10 [40.0%]  (CAN_FALLTHRU) 8 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L61	#,
# BLOCK 8 freq:375 seq:6
# PRED: 7 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%eax, %r8d	# p,
	cmpl	$5, %eax	#, p
# SUCC: 37 [33.3%]  (CAN_FALLTHRU) 9 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L57	#,
# BLOCK 9 freq:250 seq:7
# PRED: 8 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movl	36(%rsp), %ecx	# %sfp,
	addq	$56, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbx, %rdx	# st,
	movq	%r14, %rdi	# Fout,
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	movl	$1, %esi	#,
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	kf_bfly5	#
# BLOCK 10 freq:250 seq:8
# PRED: 7 [40.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L61:
	.cfi_restore_state
	movslq	36(%rsp), %r9	# %sfp, k
	leaq	264(%rbx), %rsi	#, tw3
	movl	4(%rbx), %r11d	# st_22(D)->inverse, D.5591
	movq	%rsi, %r8	# tw3, tw3
	movq	%rsi, %rdi	# tw3, tw3
	leaq	0(,%r9,8), %rax	#, D.5592
	leaq	(%r14,%rax), %rcx	#, ivtmp.334
	leaq	(%rcx,%rax), %rdx	#, ivtmp.337
	addq	%rdx, %rax	# ivtmp.337, ivtmp.340
# SUCC: 13 [100.0%]  (CAN_FALLTHRU)
	jmp	.L78	#
# BLOCK 11 freq:1389 seq:9
# PRED: 13 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L111:
	subss	%xmm5, %xmm0	# D.5593, D.5593
	addss	%xmm5, %xmm3	# D.5593, D.5593
	movss	%xmm0, (%rcx)	# D.5593, MEM[base: _601, offset: 0B]
	movaps	%xmm9, %xmm0	# D.5593, D.5593
	subss	%xmm6, %xmm9	# D.5593, D.5593
	addss	%xmm6, %xmm0	# D.5593, D.5593
	movss	%xmm0, 4(%rcx)	# D.5593, MEM[base: _601, offset: 4B]
	movss	%xmm3, (%rax)	# D.5593, MEM[base: _605, offset: 0B]
# SUCC: 12 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	%xmm9, 4(%rax)	# D.5593, MEM[base: _605, offset: 4B]
# BLOCK 12 freq:2778 seq:10
# PRED: 11 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 14 [100.0%]  (CAN_FALLTHRU)
.L77:
	addq	$8, %r14	#, Fout
	addq	$8, %rcx	#, ivtmp.334
	addq	$8, %rdx	#, ivtmp.337
	addq	$8, %rax	#, ivtmp.340
	subq	$1, %r9	#, k
# SUCC: 13 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 30 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	je	.L54	#,
# BLOCK 13 freq:2778 seq:11
# PRED: 12 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 10 [100.0%]  (CAN_FALLTHRU)
.L78:
	movss	(%rcx), %xmm5	# MEM[base: _601, offset: 0B], D.5593
	addq	$8, %rsi	#, tw3
	addq	$16, %rdi	#, tw3
	addq	$24, %r8	#, tw3
	movss	4(%rcx), %xmm0	# MEM[base: _601, offset: 4B], D.5593
	movss	-8(%rsi), %xmm1	# MEM[base: tw3_154, offset: 0B], D.5593
	movaps	%xmm5, %xmm6	# D.5593, D.5593
	movss	-4(%rsi), %xmm2	# MEM[base: tw3_154, offset: 4B], D.5593
	movaps	%xmm0, %xmm3	# D.5593, D.5593
	mulss	%xmm1, %xmm6	# D.5593, D.5593
	movss	(%rdx), %xmm4	# MEM[base: _603, offset: 0B], D.5593
	mulss	%xmm2, %xmm3	# D.5593, D.5593
	mulss	%xmm1, %xmm0	# D.5593, D.5593
	movss	-12(%rdi), %xmm1	# MEM[base: tw3_167, offset: 4B], D.5593
	movaps	%xmm4, %xmm7	# D.5593, D.5593
	mulss	%xmm2, %xmm5	# D.5593, D.5593
	movss	-24(%r8), %xmm2	# MEM[base: tw3_180, offset: 0B], D.5593
	mulss	%xmm1, %xmm4	# D.5593, D.5593
	subss	%xmm3, %xmm6	# D.5593, D.5593
	movss	-16(%rdi), %xmm3	# MEM[base: tw3_167, offset: 0B], D.5593
	addss	%xmm0, %xmm5	# D.5593, D.5593
	movss	4(%rdx), %xmm0	# MEM[base: _603, offset: 4B], D.5593
	mulss	%xmm3, %xmm7	# D.5593, D.5593
	movaps	%xmm0, %xmm8	# D.5593, D.5593
	mulss	%xmm3, %xmm0	# D.5593, D.5593
	movss	(%rax), %xmm3	# MEM[base: _605, offset: 0B], D.5593
	mulss	%xmm1, %xmm8	# D.5593, D.5593
	movss	4(%rax), %xmm1	# MEM[base: _605, offset: 4B], D.5593
	movaps	%xmm1, %xmm9	# D.5593, D.5593
	addss	%xmm0, %xmm4	# D.5593, D.5593
	movss	-20(%r8), %xmm0	# MEM[base: tw3_180, offset: 4B], D.5593
	mulss	%xmm2, %xmm1	# D.5593, D.5593
	subss	%xmm8, %xmm7	# D.5593, D.5593
	movaps	%xmm3, %xmm8	# D.5593, D.5593
	mulss	%xmm0, %xmm9	# D.5593, D.5593
	mulss	%xmm3, %xmm0	# D.5593, D.5593
	mulss	%xmm2, %xmm8	# D.5593, D.5593
	movss	(%r14), %xmm2	# MEM[base: Fout_151, offset: 0B], D.5593
	movaps	%xmm2, %xmm3	# D.5593, D.5593
	addss	%xmm7, %xmm2	# D.5593, D.5593
	addss	%xmm1, %xmm0	# D.5593, D.5593
	movss	4(%r14), %xmm1	# MEM[base: Fout_151, offset: 4B], D.5593
	subss	%xmm9, %xmm8	# D.5593, D.5593
	movaps	%xmm1, %xmm9	# D.5593, D.5593
	subss	%xmm7, %xmm3	# D.5593, D.5593
	movaps	%xmm6, %xmm7	# D.5593, D.5593
	movss	%xmm2, (%r14)	# D.5593, MEM[base: Fout_151, offset: 0B]
	addss	%xmm4, %xmm1	# D.5593, D.5593
	subss	%xmm4, %xmm9	# D.5593, D.5593
	movaps	%xmm5, %xmm4	# D.5593, D.5593
	addss	%xmm0, %xmm4	# D.5593, D.5593
	addss	%xmm8, %xmm7	# D.5593, D.5593
	movss	%xmm1, 4(%r14)	# D.5593, MEM[base: Fout_151, offset: 4B]
	subss	%xmm0, %xmm5	# D.5593, D.5593
	movaps	%xmm3, %xmm0	# D.5593, D.5593
	subss	%xmm4, %xmm1	# D.5593, D.5593
	subss	%xmm7, %xmm2	# D.5593, D.5593
	subss	%xmm8, %xmm6	# D.5593, D.5593
	movss	%xmm1, 4(%rdx)	# D.5593, MEM[base: _603, offset: 4B]
	movss	%xmm2, (%rdx)	# D.5593, MEM[base: _603, offset: 0B]
	addss	(%r14), %xmm7	# MEM[base: Fout_151, offset: 0B], D.5593
	addss	4(%r14), %xmm4	# MEM[base: Fout_151, offset: 4B], D.5593
	movss	%xmm7, (%r14)	# D.5593, MEM[base: Fout_151, offset: 0B]
	movss	%xmm4, 4(%r14)	# D.5593, MEM[base: Fout_151, offset: 4B]
	testl	%r11d, %r11d	# D.5591
# SUCC: 11 [50.0%]  (CAN_FALLTHRU) 14 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L111	#,
# BLOCK 14 freq:1389 seq:12
# PRED: 13 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	addss	%xmm5, %xmm0	# D.5593, D.5593
	subss	%xmm5, %xmm3	# D.5593, D.5593
	movss	%xmm0, (%rcx)	# D.5593, MEM[base: _601, offset: 0B]
	movaps	%xmm9, %xmm0	# D.5593, D.5593
	subss	%xmm6, %xmm0	# D.5593, D.5593
	addss	%xmm9, %xmm6	# D.5593, D.5593
	movss	%xmm0, 4(%rcx)	# D.5593, MEM[base: _601, offset: 4B]
	movss	%xmm3, (%rax)	# D.5593, MEM[base: _605, offset: 0B]
	movss	%xmm6, 4(%rax)	# D.5593, MEM[base: _605, offset: 4B]
# SUCC: 12 [100.0%]  (CAN_FALLTHRU)
	jmp	.L77	#
# BLOCK 15 freq:375 seq:13
# PRED: 6 [37.5%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L110:
	cmpl	$2, 32(%rsp)	#, %sfp
	movl	32(%rsp), %r8d	# %sfp,
# SUCC: 37 [33.3%]  (CAN_FALLTHRU) 16 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L57	#,
# BLOCK 16 freq:250 seq:14
# PRED: 15 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movl	36(%rsp), %r10d	# %sfp, m
	leaq	296(%rbx), %r11	#, D.5602
	leaq	32(%r14), %rbp	#, D.5596
	leaq	264(%rbx), %rdx	#, tw1
	movslq	%r10d, %rcx	# m,
	movl	%r10d, %r8d	# m, D.5601
	salq	$3, %rcx	#, D.5592
	leaq	(%r14,%rcx), %rax	#, Fout2
	addq	$32, %rcx	#, D.5592
	testq	%rcx, %rcx	# D.5592
	setle	%sil	#, tmp492
	cmpq	%r11, %r14	# D.5602, Fout
	setnb	%r9b	#, D.5595
	cmpq	%rbp, %rdx	# D.5596, tw1
	setnb	%dil	#, D.5595
	orl	%r9d, %edi	# D.5595, D.5595
	cmpl	$3, %r10d	#, m
	seta	%r9b	#, D.5595
	andl	%r9d, %edi	# D.5595, D.5595
	cmpq	%rbp, %rax	# D.5596, Fout2
	setnb	%r9b	#, D.5595
	orl	%r9d, %esi	# D.5595, D.5595
	testb	%sil, %dil	# D.5595, D.5595
# SUCC: 38 [10.0%]  (CAN_FALLTHRU) 17 [90.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L65	#,
# BLOCK 17 freq:225 seq:15
# PRED: 16 [90.0%]  (FALLTHRU,CAN_FALLTHRU)
	addq	%r14, %rcx	# Fout, D.5596
	cmpq	%rcx, %rdx	# D.5596, tw1
	setnb	%sil	#, D.5595
	cmpq	%r11, %rax	# D.5602, Fout2
	setnb	%cl	#, D.5595
	orb	%cl, %sil	# D.5595, tmp741
# SUCC: 38 [11.1%]  (CAN_FALLTHRU) 18 [88.9%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L65	#,
# BLOCK 18 freq:200 seq:16
# PRED: 17 [88.9%]  (FALLTHRU,CAN_FALLTHRU)
	leal	-5(%r10), %edi	#, D.5601
	leal	-1(%r10), %ecx	#, m
	shrl	$2, %edi	#, D.5601
	addl	$1, %edi	#, bnd.230
	leal	0(,%rdi,4), %r11d	#, ratio_mult_vf.231
	cmpl	$3, %ecx	#, m
# SUCC: 19 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 23 [33.3%]  (CAN_FALLTHRU)
	jbe	.L66	#,
# BLOCK 19 freq:133 seq:17
# PRED: 18 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%r14, %rsi	# Fout, ivtmp.286
	xorl	%ecx, %ecx	# ivtmp.285
# SUCC: 20 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	xorl	%r9d, %r9d	# ivtmp.281
# BLOCK 20 freq:267 seq:18
# PRED: 19 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 20 [50.0%]  (DFS_BACK,CAN_FALLTHRU)
.L67:
	movups	(%rax,%rcx), %xmm4	# MEM[base: Fout2_52, index: ivtmp.285_578, offset: 0B], tmp515
	addl	$1, %r9d	#, ivtmp.281
	addq	$32, %rsi	#, ivtmp.286
	movups	16(%rax,%rcx), %xmm0	# MEM[base: Fout2_52, index: ivtmp.285_578, offset: 16B], tmp516
	movups	264(%rbx,%rcx), %xmm3	# MEM[base: st_22(D), index: ivtmp.285_578, offset: 264B], tmp517
	movaps	%xmm4, %xmm2	# tmp515, D.5598
	movups	280(%rbx,%rcx), %xmm1	# MEM[base: st_22(D), index: ivtmp.285_578, offset: 280B], tmp518
	shufps	$221, %xmm0, %xmm4	#, tmp516, D.5598
	shufps	$136, %xmm0, %xmm2	#, tmp516, D.5598
	movaps	%xmm3, %xmm0	# tmp517, D.5598
	shufps	$136, %xmm1, %xmm0	#, tmp518, D.5598
	shufps	$221, %xmm1, %xmm3	#, tmp518, D.5598
	movaps	%xmm0, %xmm5	# D.5598, vect__57.244
	movaps	%xmm3, %xmm1	# D.5598, vect__60.245
	mulps	%xmm4, %xmm1	# D.5598, vect__60.245
	mulps	%xmm4, %xmm0	# D.5598, vect__63.248
	movups	-16(%rsi), %xmm4	# MEM[base: _583, offset: 16B], tmp524
	mulps	%xmm2, %xmm5	# D.5598, vect__57.244
	mulps	%xmm3, %xmm2	# D.5598, vect__62.247
	subps	%xmm1, %xmm5	# vect__60.245, vect__61.246
	movaps	%xmm0, %xmm1	# vect__63.248, vect__64.249
	movups	-32(%rsi), %xmm0	# MEM[base: _583, offset: 0B], tmp523
	addps	%xmm2, %xmm1	# vect__62.247, vect__64.249
	movaps	%xmm0, %xmm2	# tmp523, D.5598
	shufps	$221, %xmm4, %xmm0	#, tmp524, D.5598
	shufps	$136, %xmm4, %xmm2	#, tmp524, D.5598
	movaps	%xmm2, %xmm3	# D.5598, vect__69.254
	addps	%xmm5, %xmm2	# vect__61.246, vect__73.262
	movaps	%xmm0, %xmm4	# D.5598, vect__71.259
	subps	%xmm5, %xmm3	# vect__61.246, vect__69.254
	subps	%xmm1, %xmm4	# vect__64.249, vect__71.259
	addps	%xmm1, %xmm0	# vect__64.249, vect__75.263
	movaps	%xmm2, %xmm1	# vect__73.262, D.5598
	movaps	%xmm3, %xmm6	# vect__69.254, D.5598
	unpcklps	%xmm4, %xmm6	# vect__71.259, D.5598
	unpckhps	%xmm4, %xmm3	# vect__71.259, D.5598
	movups	%xmm6, (%rax,%rcx)	# D.5598, MEM[base: Fout2_52, index: ivtmp.285_578, offset: 0B]
	movups	%xmm3, 16(%rax,%rcx)	# D.5598, MEM[base: Fout2_52, index: ivtmp.285_578, offset: 16B]
	unpcklps	%xmm0, %xmm1	# vect__75.263, D.5598
	unpckhps	%xmm0, %xmm2	# vect__75.263, D.5598
	addq	$32, %rcx	#, ivtmp.285
	movups	%xmm1, -32(%rsi)	# D.5598, MEM[base: _583, offset: 0B]
	movups	%xmm2, -16(%rsi)	# D.5598, MEM[base: _583, offset: 16B]
	cmpl	%r9d, %edi	# ivtmp.281, bnd.230
# SUCC: 20 [50.0%]  (DFS_BACK,CAN_FALLTHRU) 21 [50.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	ja	.L67	#,
# BLOCK 21 freq:133 seq:19
# PRED: 20 [50.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	subl	%r11d, 36(%rsp)	# ratio_mult_vf.231, %sfp
	movl	%r11d, %ecx	# ratio_mult_vf.231, D.5594
	salq	$3, %rcx	#, D.5594
	movl	36(%rsp), %esi	# %sfp, m
	addq	%rcx, %r14	# D.5594, Fout
	addq	%rcx, %rax	# D.5594, Fout2
	addq	%rcx, %rdx	# D.5594, tw1
	cmpl	%r8d, %r11d	# D.5601, ratio_mult_vf.231
# SUCC: 22 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 30 [33.3%]  (CAN_FALLTHRU)
	je	.L54	#,
# BLOCK 22 freq:89 seq:20
# PRED: 21 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
# SUCC: 23 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leal	-1(%rsi), %ecx	#, m
# BLOCK 23 freq:156 seq:21
# PRED: 22 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 18 [33.3%]  (CAN_FALLTHRU)
.L66:
	movss	4(%rdx), %xmm4	# tw1_371->i, D.5593
	movss	(%rax), %xmm3	# Fout2_373->r, D.5593
	movss	(%rdx), %xmm1	# tw1_371->r, D.5593
	movaps	%xmm4, %xmm5	# D.5593, D.5593
	movss	4(%rax), %xmm0	# Fout2_373->i, D.5593
	movaps	%xmm3, %xmm2	# D.5593, D.5593
	mulss	%xmm1, %xmm2	# D.5593, D.5593
	mulss	%xmm0, %xmm5	# D.5593, D.5593
	mulss	%xmm0, %xmm1	# D.5593, D.5593
	mulss	%xmm4, %xmm3	# D.5593, D.5593
	subss	%xmm5, %xmm2	# D.5593, D.5593
	addss	%xmm1, %xmm3	# D.5593, D.5593
	movss	(%r14), %xmm1	# Fout_377->r, Fout_377->r
	subss	%xmm2, %xmm1	# D.5593, D.5593
	movaps	%xmm3, %xmm0	# D.5593, D.5593
	movss	%xmm1, (%rax)	# D.5593, Fout2_373->r
	movss	4(%r14), %xmm1	# Fout_377->i, Fout_377->i
	addss	(%r14), %xmm2	# Fout_377->r, D.5593
	subss	%xmm3, %xmm1	# D.5593, D.5593
	movss	%xmm1, 4(%rax)	# D.5593, Fout2_373->i
	addss	4(%r14), %xmm0	# Fout_377->i, D.5593
	movss	%xmm2, (%r14)	# D.5593, Fout_377->r
	movss	%xmm0, 4(%r14)	# D.5593, Fout_377->i
	testl	%ecx, %ecx	# m
# SUCC: 24 [75.0%]  (FALLTHRU,CAN_FALLTHRU) 30 [25.0%]  (CAN_FALLTHRU)
	je	.L54	#,
# BLOCK 24 freq:156 seq:22
# PRED: 23 [75.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	8(%rax), %xmm0	# MEM[(struct kiss_fft_cpx *)Fout2_373 + 8B].r, D.5593
	movss	12(%rdx), %xmm1	# MEM[(struct kiss_fft_cpx *)tw1_371 + 8B].i, D.5593
	movss	8(%rdx), %xmm3	# MEM[(struct kiss_fft_cpx *)tw1_371 + 8B].r, D.5593
	movaps	%xmm0, %xmm2	# D.5593, D.5593
	movss	12(%rax), %xmm4	# MEM[(struct kiss_fft_cpx *)Fout2_373 + 8B].i, D.5593
	movaps	%xmm1, %xmm5	# D.5593, D.5593
	mulss	%xmm3, %xmm2	# D.5593, D.5593
	movl	36(%rsp), %ebx	# %sfp, m
	mulss	%xmm4, %xmm5	# D.5593, D.5593
	mulss	%xmm0, %xmm1	# D.5593, D.5593
	mulss	%xmm4, %xmm3	# D.5593, D.5593
	subss	%xmm5, %xmm2	# D.5593, D.5593
	addss	%xmm1, %xmm3	# D.5593, D.5593
	movss	8(%r14), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_377 + 8B].r, MEM[(struct kiss_fft_cpx *)Fout_377 + 8B].r
	subss	%xmm2, %xmm1	# D.5593, D.5593
	movaps	%xmm3, %xmm0	# D.5593, D.5593
	movss	%xmm1, 8(%rax)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout2_373 + 8B].r
	movss	12(%r14), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_377 + 8B].i, MEM[(struct kiss_fft_cpx *)Fout_377 + 8B].i
	addss	8(%r14), %xmm2	# MEM[(struct kiss_fft_cpx *)Fout_377 + 8B].r, D.5593
	subss	%xmm3, %xmm1	# D.5593, D.5593
	movss	%xmm1, 12(%rax)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout2_373 + 8B].i
	addss	12(%r14), %xmm0	# MEM[(struct kiss_fft_cpx *)Fout_377 + 8B].i, D.5593
	movss	%xmm2, 8(%r14)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout_377 + 8B].r
	movss	%xmm0, 12(%r14)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout_377 + 8B].i
	cmpl	$2, %ebx	#, m
# SUCC: 25 [75.0%]  (FALLTHRU,CAN_FALLTHRU) 30 [25.0%]  (CAN_FALLTHRU)
	je	.L54	#,
# BLOCK 25 freq:156 seq:23
# PRED: 24 [75.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	20(%rdx), %xmm0	# MEM[(struct kiss_fft_cpx *)tw1_371 + 16B].i, D.5593
	movss	16(%rdx), %xmm3	# MEM[(struct kiss_fft_cpx *)tw1_371 + 16B].r, D.5593
	movss	16(%rax), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout2_373 + 16B].r, D.5593
	movaps	%xmm0, %xmm5	# D.5593, D.5593
	movss	20(%rax), %xmm4	# MEM[(struct kiss_fft_cpx *)Fout2_373 + 16B].i, D.5593
	movaps	%xmm3, %xmm2	# D.5593, D.5593
	mulss	%xmm1, %xmm2	# D.5593, D.5593
	mulss	%xmm4, %xmm5	# D.5593, D.5593
	mulss	%xmm0, %xmm1	# D.5593, D.5593
	mulss	%xmm4, %xmm3	# D.5593, D.5593
	subss	%xmm5, %xmm2	# D.5593, D.5593
	addss	%xmm1, %xmm3	# D.5593, D.5593
	movss	16(%r14), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_377 + 16B].r, MEM[(struct kiss_fft_cpx *)Fout_377 + 16B].r
	subss	%xmm2, %xmm1	# D.5593, D.5593
	movaps	%xmm3, %xmm0	# D.5593, D.5593
	movss	%xmm1, 16(%rax)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout2_373 + 16B].r
	movss	20(%r14), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_377 + 16B].i, MEM[(struct kiss_fft_cpx *)Fout_377 + 16B].i
	addss	16(%r14), %xmm2	# MEM[(struct kiss_fft_cpx *)Fout_377 + 16B].r, D.5593
	subss	%xmm3, %xmm1	# D.5593, D.5593
	movss	%xmm1, 20(%rax)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout2_373 + 16B].i
	addss	20(%r14), %xmm0	# MEM[(struct kiss_fft_cpx *)Fout_377 + 16B].i, D.5593
	movss	%xmm2, 16(%r14)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout_377 + 16B].r
	movss	%xmm0, 20(%r14)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout_377 + 16B].i
	cmpl	$3, %ebx	#, m
# SUCC: 26 [75.0%]  (FALLTHRU,CAN_FALLTHRU) 30 [25.0%]  (CAN_FALLTHRU)
	je	.L54	#,
# BLOCK 26 freq:156 seq:24
# PRED: 25 [75.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	24(%rax), %xmm4	# MEM[(struct kiss_fft_cpx *)Fout2_373 + 24B].r, D.5593
	movss	28(%rax), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout2_373 + 24B].i, D.5593
	movss	24(%rdx), %xmm0	# MEM[(struct kiss_fft_cpx *)tw1_371 + 24B].r, D.5593
	movaps	%xmm4, %xmm2	# D.5593, D.5593
	movss	28(%rdx), %xmm3	# MEM[(struct kiss_fft_cpx *)tw1_371 + 24B].i, D.5593
	movaps	%xmm1, %xmm5	# D.5593, D.5593
	mulss	%xmm0, %xmm2	# D.5593, D.5593
	mulss	%xmm3, %xmm5	# D.5593, D.5593
	mulss	%xmm0, %xmm1	# D.5593, D.5593
	mulss	%xmm4, %xmm3	# D.5593, D.5593
	subss	%xmm5, %xmm2	# D.5593, D.5593
	addss	%xmm1, %xmm3	# D.5593, D.5593
	movss	24(%r14), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_377 + 24B].r, MEM[(struct kiss_fft_cpx *)Fout_377 + 24B].r
	subss	%xmm2, %xmm1	# D.5593, D.5593
	movaps	%xmm3, %xmm0	# D.5593, D.5593
	movss	%xmm1, 24(%rax)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout2_373 + 24B].r
	movss	28(%r14), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_377 + 24B].i, MEM[(struct kiss_fft_cpx *)Fout_377 + 24B].i
	addss	24(%r14), %xmm2	# MEM[(struct kiss_fft_cpx *)Fout_377 + 24B].r, D.5593
	subss	%xmm3, %xmm1	# D.5593, D.5593
	movss	%xmm1, 28(%rax)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout2_373 + 24B].i
	addss	28(%r14), %xmm0	# MEM[(struct kiss_fft_cpx *)Fout_377 + 24B].i, D.5593
	movss	%xmm2, 24(%r14)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout_377 + 24B].r
	movss	%xmm0, 28(%r14)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout_377 + 24B].i
	cmpl	$4, %ebx	#, m
# SUCC: 27 [75.0%]  (FALLTHRU,CAN_FALLTHRU) 30 [25.0%]  (CAN_FALLTHRU)
	je	.L54	#,
# BLOCK 27 freq:156 seq:25
# PRED: 26 [75.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	32(%rax), %xmm4	# MEM[(struct kiss_fft_cpx *)Fout2_373 + 32B].r, D.5593
	movss	36(%rax), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout2_373 + 32B].i, D.5593
	movss	32(%rdx), %xmm0	# MEM[(struct kiss_fft_cpx *)tw1_371 + 32B].r, D.5593
	movaps	%xmm4, %xmm2	# D.5593, D.5593
	movss	36(%rdx), %xmm3	# MEM[(struct kiss_fft_cpx *)tw1_371 + 32B].i, D.5593
	movaps	%xmm1, %xmm5	# D.5593, D.5593
	mulss	%xmm0, %xmm2	# D.5593, D.5593
	mulss	%xmm3, %xmm5	# D.5593, D.5593
	mulss	%xmm0, %xmm1	# D.5593, D.5593
	mulss	%xmm4, %xmm3	# D.5593, D.5593
	subss	%xmm5, %xmm2	# D.5593, D.5593
	addss	%xmm1, %xmm3	# D.5593, D.5593
	movss	32(%r14), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_377 + 32B].r, MEM[(struct kiss_fft_cpx *)Fout_377 + 32B].r
	subss	%xmm2, %xmm1	# D.5593, D.5593
	movaps	%xmm3, %xmm0	# D.5593, D.5593
	movss	%xmm1, 32(%rax)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout2_373 + 32B].r
	movss	36(%r14), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_377 + 32B].i, MEM[(struct kiss_fft_cpx *)Fout_377 + 32B].i
	addss	32(%r14), %xmm2	# MEM[(struct kiss_fft_cpx *)Fout_377 + 32B].r, D.5593
	subss	%xmm3, %xmm1	# D.5593, D.5593
	movss	%xmm1, 36(%rax)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout2_373 + 32B].i
	addss	36(%r14), %xmm0	# MEM[(struct kiss_fft_cpx *)Fout_377 + 32B].i, D.5593
	movss	%xmm2, 32(%r14)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout_377 + 32B].r
	movss	%xmm0, 36(%r14)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout_377 + 32B].i
	cmpl	$5, %ebx	#, m
# SUCC: 28 [75.0%]  (FALLTHRU,CAN_FALLTHRU) 30 [25.0%]  (CAN_FALLTHRU)
	je	.L54	#,
# BLOCK 28 freq:156 seq:26
# PRED: 27 [75.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	40(%rax), %xmm4	# MEM[(struct kiss_fft_cpx *)Fout2_373 + 40B].r, D.5593
	movss	44(%rax), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout2_373 + 40B].i, D.5593
	movss	40(%rdx), %xmm0	# MEM[(struct kiss_fft_cpx *)tw1_371 + 40B].r, D.5593
	movaps	%xmm4, %xmm2	# D.5593, D.5593
	movss	44(%rdx), %xmm3	# MEM[(struct kiss_fft_cpx *)tw1_371 + 40B].i, D.5593
	movaps	%xmm1, %xmm5	# D.5593, D.5593
	mulss	%xmm0, %xmm2	# D.5593, D.5593
	mulss	%xmm3, %xmm5	# D.5593, D.5593
	mulss	%xmm0, %xmm1	# D.5593, D.5593
	mulss	%xmm4, %xmm3	# D.5593, D.5593
	subss	%xmm5, %xmm2	# D.5593, D.5593
	addss	%xmm1, %xmm3	# D.5593, D.5593
	movss	40(%r14), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_377 + 40B].r, MEM[(struct kiss_fft_cpx *)Fout_377 + 40B].r
	subss	%xmm2, %xmm1	# D.5593, D.5593
	movaps	%xmm3, %xmm0	# D.5593, D.5593
	movss	%xmm1, 40(%rax)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout2_373 + 40B].r
	movss	44(%r14), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_377 + 40B].i, MEM[(struct kiss_fft_cpx *)Fout_377 + 40B].i
	addss	40(%r14), %xmm2	# MEM[(struct kiss_fft_cpx *)Fout_377 + 40B].r, D.5593
	subss	%xmm3, %xmm1	# D.5593, D.5593
	movss	%xmm1, 44(%rax)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout2_373 + 40B].i
	addss	44(%r14), %xmm0	# MEM[(struct kiss_fft_cpx *)Fout_377 + 40B].i, D.5593
	movss	%xmm2, 40(%r14)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout_377 + 40B].r
	movss	%xmm0, 44(%r14)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout_377 + 40B].i
	cmpl	$6, %ebx	#, m
# SUCC: 29 [75.0%]  (FALLTHRU,CAN_FALLTHRU) 30 [25.0%]  (CAN_FALLTHRU)
	je	.L54	#,
# BLOCK 29 freq:156 seq:27
# PRED: 28 [75.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	52(%rdx), %xmm0	# MEM[(struct kiss_fft_cpx *)tw1_371 + 48B].i, D.5593
	movss	48(%rdx), %xmm3	# MEM[(struct kiss_fft_cpx *)tw1_371 + 48B].r, D.5593
	movss	48(%rax), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout2_373 + 48B].r, D.5593
	movaps	%xmm0, %xmm5	# D.5593, D.5593
	movss	52(%rax), %xmm4	# MEM[(struct kiss_fft_cpx *)Fout2_373 + 48B].i, D.5593
	movaps	%xmm3, %xmm2	# D.5593, D.5593
	mulss	%xmm1, %xmm2	# D.5593, D.5593
	mulss	%xmm4, %xmm5	# D.5593, D.5593
	mulss	%xmm0, %xmm1	# D.5593, D.5593
	mulss	%xmm4, %xmm3	# D.5593, D.5593
	subss	%xmm5, %xmm2	# D.5593, D.5593
	addss	%xmm1, %xmm3	# D.5593, D.5593
	movss	48(%r14), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_377 + 48B].r, MEM[(struct kiss_fft_cpx *)Fout_377 + 48B].r
	subss	%xmm2, %xmm1	# D.5593, D.5593
	movaps	%xmm3, %xmm0	# D.5593, D.5593
	movss	%xmm1, 48(%rax)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout2_373 + 48B].r
	movss	52(%r14), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_377 + 48B].i, MEM[(struct kiss_fft_cpx *)Fout_377 + 48B].i
	addss	48(%r14), %xmm2	# MEM[(struct kiss_fft_cpx *)Fout_377 + 48B].r, D.5593
	subss	%xmm3, %xmm1	# D.5593, D.5593
	movss	%xmm1, 52(%rax)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout2_373 + 48B].i
	addss	52(%r14), %xmm0	# MEM[(struct kiss_fft_cpx *)Fout_377 + 48B].i, D.5593
	movss	%xmm2, 48(%r14)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout_377 + 48B].r
# SUCC: 30 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	%xmm0, 52(%r14)	# D.5593, MEM[(struct kiss_fft_cpx *)Fout_377 + 48B].i
# BLOCK 30 freq:500 seq:28
# PRED: 29 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 28 [25.0%]  (CAN_FALLTHRU) 21 [33.3%]  (CAN_FALLTHRU) 23 [25.0%]  (CAN_FALLTHRU) 24 [25.0%]  (CAN_FALLTHRU) 25 [25.0%]  (CAN_FALLTHRU) 26 [25.0%]  (CAN_FALLTHRU) 27 [25.0%]  (CAN_FALLTHRU) 12 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT) 40 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
.L54:
	addq	$56, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%] 
	ret
# BLOCK 31 freq:350 seq:29
# PRED: 2 [28.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L109:
	.cfi_restore_state
	salq	$3, %rbp	#, D.5592
# SUCC: 32 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%r14, %rax	# Fout, Fout
# BLOCK 32 freq:3889 seq:30
# PRED: 31 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 32 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L56:
	movq	(%r15), %rdx	# MEM[base: f_10, offset: 0B], MEM[base: f_10, offset: 0B]
	addq	$8, %rax	#, Fout
	addq	%rbp, %r15	# D.5592, f
	movq	%rdx, -8(%rax)	# MEM[base: f_10, offset: 0B], MEM[base: Fout_11, offset: 0B]
	cmpq	%rax, %r12	# Fout, Fout_end
# SUCC: 32 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 33 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L56	#,
# BLOCK 33 freq:350 seq:31
# PRED: 32 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$3, 32(%rsp)	#, %sfp
# SUCC: 34 [20.0%]  (FALLTHRU,CAN_FALLTHRU) 6 [80.0%]  (CAN_FALLTHRU)
	jne	.L112	#,
# BLOCK 34 freq:250 seq:32
# PRED: 5 [20.0%]  (CAN_FALLTHRU) 33 [20.0%]  (FALLTHRU,CAN_FALLTHRU)
.L58:
	movslq	36(%rsp), %rsi	# %sfp, m
	movsd	.LC2(%rip), %xmm6	#, tmp697
	leaq	0(,%rsi,8), %rdx	#, D.5592
	movss	268(%rbx,%rsi,8), %xmm7	# MEM[(struct  *)_81 + 4B], epi3$i
	addq	$264, %rbx	#, tw2
	leaq	(%r14,%rdx), %rax	#, ivtmp.311
	movq	%rbx, %rcx	# tw2, tw2
# SUCC: 35 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	addq	%rax, %rdx	# ivtmp.311, ivtmp.314
# BLOCK 35 freq:2778 seq:33
# PRED: 34 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 35 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L74:
	movss	(%rax), %xmm2	# MEM[base: _313, offset: 0B], D.5593
	addq	$8, %rbx	#, tw2
	addq	$16, %rcx	#, tw2
	addq	$8, %r14	#, Fout
	movss	4(%rax), %xmm3	# MEM[base: _313, offset: 4B], D.5593
	addq	$8, %rdx	#, ivtmp.314
	addq	$8, %rax	#, ivtmp.311
	movss	-8(%rbx), %xmm4	# MEM[base: tw2_88, offset: 0B], D.5593
	movaps	%xmm2, %xmm1	# D.5593, D.5593
	movss	-4(%rbx), %xmm0	# MEM[base: tw2_88, offset: 4B], D.5593
	movaps	%xmm3, %xmm5	# D.5593, D.5593
	mulss	%xmm4, %xmm1	# D.5593, D.5593
	mulss	%xmm0, %xmm5	# D.5593, D.5593
	mulss	%xmm4, %xmm3	# D.5593, D.5593
	movss	-16(%rcx), %xmm4	# MEM[base: tw2_101, offset: 0B], D.5593
	mulss	%xmm0, %xmm2	# D.5593, D.5593
	movss	-12(%rcx), %xmm0	# MEM[base: tw2_101, offset: 4B], D.5593
	subss	%xmm5, %xmm1	# D.5593, D.5593
	movss	-8(%rdx), %xmm5	# MEM[base: _305, offset: 0B], D.5593
	addss	%xmm3, %xmm2	# D.5593, D.5593
	movss	-4(%rdx), %xmm3	# MEM[base: _305, offset: 4B], D.5593
	movaps	%xmm5, %xmm8	# D.5593, D.5593
	mulss	%xmm4, %xmm8	# D.5593, D.5593
	movaps	%xmm3, %xmm9	# D.5593, D.5593
	mulss	%xmm0, %xmm9	# D.5593, D.5593
	mulss	%xmm4, %xmm3	# D.5593, D.5593
	movaps	%xmm1, %xmm4	# D.5593, D.5593
	mulss	%xmm5, %xmm0	# D.5593, D.5593
	pxor	%xmm5, %xmm5	# D.5597
	cvtss2sd	-8(%r14), %xmm5	# MEM[base: Fout_85, offset: 0B], D.5597
	subss	%xmm9, %xmm8	# D.5593, D.5593
	pxor	%xmm9, %xmm9	# D.5597
	addss	%xmm3, %xmm0	# D.5593, D.5593
	movaps	%xmm2, %xmm3	# D.5593, D.5593
	addss	%xmm8, %xmm4	# D.5593, D.5593
	subss	%xmm8, %xmm1	# D.5593, D.5593
	addss	%xmm0, %xmm3	# D.5593, D.5593
	cvtss2sd	%xmm4, %xmm9	# D.5593, D.5597
	mulsd	%xmm6, %xmm9	# tmp697, D.5597
	subss	%xmm0, %xmm2	# D.5593, D.5593
	mulss	%xmm7, %xmm1	# epi3$i, D.5593
	movaps	%xmm2, %xmm0	# D.5593, D.5593
	mulss	%xmm7, %xmm0	# epi3$i, D.5593
	subsd	%xmm9, %xmm5	# D.5597, D.5597
	pxor	%xmm9, %xmm9	# D.5597
	cvtss2sd	%xmm3, %xmm9	# D.5593, D.5597
	mulsd	%xmm6, %xmm9	# tmp697, D.5597
	cvtsd2ss	%xmm5, %xmm5	# D.5597, tmp812
	movss	%xmm5, -8(%rax)	# tmp812, MEM[base: _313, offset: 0B]
	pxor	%xmm5, %xmm5	# D.5597
	cvtss2sd	-4(%r14), %xmm5	# MEM[base: Fout_85, offset: 4B], D.5597
	subsd	%xmm9, %xmm5	# D.5597, D.5597
	cvtsd2ss	%xmm5, %xmm5	# D.5597, tmp813
	movss	%xmm5, -4(%rax)	# tmp813, MEM[base: _313, offset: 4B]
	addss	-8(%r14), %xmm4	# MEM[base: Fout_85, offset: 0B], D.5593
	addss	-4(%r14), %xmm3	# MEM[base: Fout_85, offset: 4B], D.5593
	movss	%xmm4, -8(%r14)	# D.5593, MEM[base: Fout_85, offset: 0B]
	movss	%xmm3, -4(%r14)	# D.5593, MEM[base: Fout_85, offset: 4B]
	movss	-8(%rax), %xmm2	# MEM[base: _313, offset: 0B], D.5593
	addss	%xmm0, %xmm2	# D.5593, D.5593
	movss	%xmm2, -8(%rdx)	# D.5593, MEM[base: _305, offset: 0B]
	movss	-4(%rax), %xmm2	# MEM[base: _313, offset: 4B], MEM[base: _313, offset: 4B]
	subss	%xmm1, %xmm2	# D.5593, D.5593
	movss	%xmm2, -4(%rdx)	# D.5593, MEM[base: _305, offset: 4B]
	movss	-8(%rax), %xmm2	# MEM[base: _313, offset: 0B], MEM[base: _313, offset: 0B]
	addss	-4(%rax), %xmm1	# MEM[base: _313, offset: 4B], D.5593
	subss	%xmm0, %xmm2	# D.5593, D.5593
	movss	%xmm1, -4(%rax)	# D.5593, MEM[base: _313, offset: 4B]
	movss	%xmm2, -8(%rax)	# D.5593, MEM[base: _313, offset: 0B]
	subq	$1, %rsi	#, m
# SUCC: 35 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 36 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L74	#,
# BLOCK 36 freq:250 seq:34
# PRED: 35 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	addq	$56, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%] 
	ret
# BLOCK 37 freq:250 seq:35
# PRED: 15 [33.3%]  (CAN_FALLTHRU) 8 [33.3%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L57:
	.cfi_restore_state
	movl	36(%rsp), %ecx	# %sfp,
	addq	$56, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbx, %rdx	# st,
	movq	%r14, %rdi	# Fout,
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	movl	$1, %esi	#,
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	kf_bfly_generic	#
# BLOCK 38 freq:50 seq:36
# PRED: 17 [11.1%]  (CAN_FALLTHRU) 16 [10.0%]  (CAN_FALLTHRU)
.L65:
	.cfi_restore_state
	movl	36(%rsp), %esi	# %sfp, m
	leal	-1(%rsi), %ecx	#, D.5594
# SUCC: 39 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	8(%rdx,%rcx,8), %rcx	#, D.5596
# BLOCK 39 freq:556 seq:37
# PRED: 38 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 39 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L71:
	movss	(%rdx), %xmm0	# MEM[base: tw1_445, offset: 0B], D.5593
	addq	$8, %rdx	#, tw1
	addq	$8, %rax	#, Fout2
	addq	$8, %r14	#, Fout
	movss	-4(%rdx), %xmm2	# MEM[base: tw1_445, offset: 4B], D.5593
	movss	-8(%rax), %xmm1	# MEM[base: Fout2_446, offset: 0B], D.5593
	movaps	%xmm0, %xmm4	# D.5593, D.5593
	movss	-4(%rax), %xmm3	# MEM[base: Fout2_446, offset: 4B], D.5593
	movaps	%xmm2, %xmm5	# D.5593, D.5593
	mulss	%xmm1, %xmm4	# D.5593, D.5593
	mulss	%xmm3, %xmm5	# D.5593, D.5593
	mulss	%xmm2, %xmm1	# D.5593, D.5593
	mulss	%xmm3, %xmm0	# D.5593, D.5593
	subss	%xmm5, %xmm4	# D.5593, D.5593
	addss	%xmm1, %xmm0	# D.5593, D.5593
	movss	-8(%r14), %xmm1	# MEM[base: Fout_448, offset: 0B], MEM[base: Fout_448, offset: 0B]
	subss	%xmm4, %xmm1	# D.5593, D.5593
	movss	%xmm1, -8(%rax)	# D.5593, MEM[base: Fout2_446, offset: 0B]
	movss	-4(%r14), %xmm1	# MEM[base: Fout_448, offset: 4B], MEM[base: Fout_448, offset: 4B]
	subss	%xmm0, %xmm1	# D.5593, D.5593
	movss	%xmm1, -4(%rax)	# D.5593, MEM[base: Fout2_446, offset: 4B]
	addss	-8(%r14), %xmm4	# MEM[base: Fout_448, offset: 0B], D.5593
	addss	-4(%r14), %xmm0	# MEM[base: Fout_448, offset: 4B], D.5593
	movss	%xmm4, -8(%r14)	# D.5593, MEM[base: Fout_448, offset: 0B]
	movss	%xmm0, -4(%r14)	# D.5593, MEM[base: Fout_448, offset: 4B]
	cmpq	%rcx, %rdx	# D.5596, tw1
# SUCC: 39 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 40 [9.0%]  (FALLTHRU)
	jne	.L71	#,
# BLOCK 40 freq:50 seq:38
# PRED: 39 [9.0%]  (FALLTHRU)
# SUCC: 30 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	jmp	.L54	#
	.cfi_endproc
.LFE58:
	.size	kf_work.constprop.1, .-kf_work.constprop.1
	.section	.text.unlikely
.LCOLDE4:
	.text
.LHOTE4:
	.section	.text.unlikely
.LCOLDB13:
	.text
.LHOTB13:
	.p2align 4,,15
	.globl	kiss_fft_alloc
	.type	kiss_fft_alloc, @function
kiss_fft_alloc:
.LFB52:
	.cfi_startproc
# BLOCK 2 freq:501 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	leal	-1(%rdi), %eax	#, D.5656
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	cltq
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edi, %ebx	# nfft, nfft
	leaq	272(,%rax,8), %rdi	#, memneeded
	subq	$40, %rsp	#,
	.cfi_def_cfa_offset 96
	testq	%rcx, %rcx	# lenmem
# SUCC: 72 [6.7%]  (CAN_FALLTHRU) 3 [93.3%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L203	#,
# BLOCK 3 freq:468 seq:1
# PRED: 2 [93.3%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rdx, %r12	# mem, mem
	testq	%rdx, %rdx	# mem
# SUCC: 4 [85.0%]  (FALLTHRU,CAN_FALLTHRU) 5 [15.0%]  (CAN_FALLTHRU)
	je	.L116	#,
# BLOCK 4 freq:397 seq:2
# PRED: 3 [85.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpq	(%rcx), %rdi	# *lenmem_13(D), memneeded
	movl	$0, %eax	#, tmp286
# SUCC: 5 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmova	%rax, %r12	# mem,, tmp286, mem
# BLOCK 5 freq:468 seq:3
# PRED: 3 [15.0%]  (CAN_FALLTHRU) 4 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
.L116:
# SUCC: 6 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rdi, (%rcx)	# memneeded, *lenmem_13(D)
# BLOCK 6 freq:501 seq:4
# PRED: 5 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 72 [100.0%]  (CAN_FALLTHRU)
.L115:
	testq	%r12, %r12	# mem
# SUCC: 7 [89.9%]  (FALLTHRU,CAN_FALLTHRU) 24 [10.1%]  (CAN_FALLTHRU)
	je	.L182	#,
# BLOCK 7 freq:451 seq:5
# PRED: 6 [89.9%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%ebx, (%r12)	# nfft, MEM[(struct kiss_fft_state *)mem_2].nfft
	movl	%esi, 4(%r12)	# inverse_fft, MEM[(struct kiss_fft_state *)mem_2].inverse
	testl	%ebx, %ebx	# nfft
# SUCC: 8 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 71 [9.0%]  (CAN_FALLTHRU)
	jle	.L204	#,
# BLOCK 8 freq:410 seq:6
# PRED: 7 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	pxor	%xmm3, %xmm3	# D.5655
	cvtsi2sd	%ebx, %xmm3	# nfft, D.5655
	xorl	%r15d, %r15d	# i
	movsd	.LC10(%rip), %xmm0	#, tmp260
	leaq	264(%r12), %rbp	#, D.5660
	leaq	24(%rsp), %r14	#, tmp284
	leaq	16(%rsp), %r13	#, tmp283
	divsd	%xmm3, %xmm0	# D.5655, D.5655
	movsd	%xmm3, 8(%rsp)	# D.5655, %sfp
	mulsd	.LC11(%rip), %xmm0	#, D.5655
	movsd	%xmm0, (%rsp)	# D.5655, %sfp
	testl	%esi, %esi	# inverse_fft
# SUCC: 9 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 20 [50.0%]  (CAN_FALLTHRU)
	jne	.L155	#,
# BLOCK 9 freq:2278 seq:7
# PRED: 8 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 9 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L153:
	pxor	%xmm0, %xmm0	# D.5655
	movq	%r13, %rsi	# tmp283,
	movq	%r14, %rdi	# tmp284,
	addq	$8, %rbp	#, ivtmp.365
	cvtsi2sd	%r15d, %xmm0	# i, D.5655
	addl	$1, %r15d	#, i
	mulsd	(%rsp), %xmm0	# %sfp, phase
	call	sincos	#
	movsd	24(%rsp), %xmm0	#, D.5661
	pxor	%xmm4, %xmm4	# tmp325
	pxor	%xmm5, %xmm5	# tmp326
	cvtsd2ss	16(%rsp), %xmm4	#, tmp325
	movss	%xmm4, -8(%rbp)	# tmp325, MEM[base: _41, offset: 0B]
	cvtsd2ss	%xmm0, %xmm5	# D.5661, tmp326
	movss	%xmm5, -4(%rbp)	# tmp326, MEM[base: _41, offset: 4B]
	cmpl	%r15d, %ebx	# i, nfft
# SUCC: 9 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 10 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L153	#,
# BLOCK 10 freq:451 seq:8
# PRED: 21 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT) 9 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT) 71 [100.0%]  (CAN_FALLTHRU)
.L154:
	movsd	.LC8(%rip), %xmm1	#, tmp168
	sqrtsd	8(%rsp), %xmm0	# %sfp, D.5655
	movsd	.LC7(%rip), %xmm2	#, tmp164
	leaq	8(%r12), %rcx	#, facbuf
	andpd	%xmm0, %xmm1	# D.5655, tmp166
	comisd	%xmm1, %xmm2	# tmp166, tmp164
# SUCC: 11 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 54 [50.0%]  (CAN_FALLTHRU)
	ja	.L205	#,
# BLOCK 11 freq:452 seq:9
# PRED: 10 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 54 [100.0%]  (CAN_FALLTHRU)
.L119:
	movsd	.LC9(%rip), %xmm1	#, tmp170
	movl	$4, %esi	#, nfft
	comisd	%xmm0, %xmm1	# D.5655, tmp170
	movsd	.LC6(%rip), %xmm1	#, tmp171
# SUCC: 12 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 25 [50.0%]  (CAN_FALLTHRU)
	jbe	.L193	#,
# BLOCK 12 freq:226 seq:10
# PRED: 11 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	comisd	%xmm0, %xmm1	# D.5655, tmp171
# SUCC: 48 [50.0%]  (CAN_FALLTHRU) 13 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	ja	.L124	#,
# BLOCK 13 freq:113 seq:11
# PRED: 12 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	$1431655766, %r8d	#, tmp287
# SUCC: 16 [100.0%]  (CAN_FALLTHRU)
	jmp	.L132	#
# BLOCK 14 freq:433 seq:12
# PRED: 16 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L206:
# SUCC: 15 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rcx, %rdi	# facbuf, facbuf
# BLOCK 15 freq:973 seq:13
# PRED: 14 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 60 [50.0%]  (CAN_FALLTHRU)
.L131:
	movl	%esi, (%rdi)	# nfft, *facbuf_228
	leaq	8(%rdi), %rcx	#, facbuf
	movl	%ebx, %eax	# nfft, nfft
	cltd
	idivl	%esi	# nfft
	movl	%eax, %ebx	# nfft, nfft
	movl	%eax, 4(%rdi)	# nfft, MEM[(int *)facbuf_228 + 4B]
	cmpl	$1, %eax	#, nfft
# SUCC: 16 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 24 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	jle	.L182	#,
# BLOCK 16 freq:866 seq:14
# PRED: 13 [100.0%]  (CAN_FALLTHRU) 19 [100.0%]  (DFS_BACK,CAN_FALLTHRU) 15 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 63 [100.0%]  (DFS_BACK,CAN_FALLTHRU)
.L132:
	movl	%ebx, %eax	# nfft, tmp174
	cltd
	idivl	%esi	# nfft
	testl	%edx, %edx	# D.5656
# SUCC: 17 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 14 [50.0%]  (CAN_FALLTHRU)
	je	.L206	#,
# BLOCK 17 freq:433 seq:15
# PRED: 16 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$2, %esi	#, nfft
# SUCC: 58 [33.3%]  (CAN_FALLTHRU) 18 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L129	#,
# BLOCK 18 freq:289 seq:16
# PRED: 17 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$4, %esi	#, nfft
# SUCC: 19 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 62 [50.0%]  (CAN_FALLTHRU)
	jne	.L128	#,
# BLOCK 19 freq:144 seq:17
# PRED: 18 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%ebx, %esi	# nfft, nfft
# SUCC: 16 [100.0%]  (DFS_BACK,CAN_FALLTHRU)
	jmp	.L132	#
# BLOCK 20 freq:2278 seq:18
# PRED: 8 [50.0%]  (CAN_FALLTHRU) 20 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L155:
	pxor	%xmm0, %xmm0	# D.5655
	movq	%r13, %rsi	# tmp283,
	movq	%r14, %rdi	# tmp284,
	addq	$8, %rbp	#, ivtmp.371
	cvtsi2sd	%r15d, %xmm0	# i, D.5655
	addl	$1, %r15d	#, i
	mulsd	(%rsp), %xmm0	# %sfp, phase
	xorpd	.LC12(%rip), %xmm0	#, phase
	call	sincos	#
	movsd	24(%rsp), %xmm0	#, D.5661
	pxor	%xmm7, %xmm7	# tmp329
	pxor	%xmm2, %xmm2	# tmp330
	cvtsd2ss	16(%rsp), %xmm7	#, tmp329
	movss	%xmm7, -8(%rbp)	# tmp329, MEM[base: _141, offset: 0B]
	cvtsd2ss	%xmm0, %xmm2	# D.5661, tmp330
	movss	%xmm2, -4(%rbp)	# tmp330, MEM[base: _141, offset: 4B]
	cmpl	%r15d, %ebx	# i, nfft
# SUCC: 20 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 21 [9.0%]  (FALLTHRU)
	jne	.L155	#,
# BLOCK 21 freq:205 seq:19
# PRED: 20 [9.0%]  (FALLTHRU)
# SUCC: 10 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	jmp	.L154	#
# BLOCK 22 freq:417 seq:20
# PRED: 30 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L164:
# SUCC: 23 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	$2, %esi	#, nfft
# BLOCK 23 freq:973 seq:21
# PRED: 27 [50.0%]  (CAN_FALLTHRU) 32 [50.0%]  (CAN_FALLTHRU) 22 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 67 [100.0%]  (CAN_FALLTHRU)
.L136:
	movl	%ebx, %eax	# nfft, nfft
	movl	%esi, (%rcx)	# nfft, *facbuf_219
	cltd
	idivl	%esi	# nfft
	movl	%eax, %ebx	# nfft, nfft
	movl	%ebx, 4(%rcx)	# nfft, MEM[(int *)facbuf_219 + 4B]
	leaq	8(%rcx), %rax	#, facbuf
	cmpl	$1, %ebx	#, nfft
# SUCC: 57 [91.0%]  (CAN_FALLTHRU) 24 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jg	.L143	#,
# BLOCK 24 freq:501 seq:22
# PRED: 46 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT) 6 [10.1%]  (CAN_FALLTHRU) 36 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT) 59 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT) 65 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT) 23 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT) 15 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT) 45 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
.L182:
	addq	$40, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rax	# mem,
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%] 
	ret
# BLOCK 25 freq:226 seq:23
# PRED: 11 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L193:
	.cfi_restore_state
	comisd	%xmm0, %xmm1	# D.5655, D.5655
# SUCC: 39 [50.0%]  (CAN_FALLTHRU) 26 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	ja	.L135	#,
# BLOCK 26 freq:113 seq:24
# PRED: 25 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	$1431655766, %edi	#, tmp290
# SUCC: 27 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
# BLOCK 27 freq:216 seq:25
# PRED: 26 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 57 [100.0%]  (DFS_BACK,CAN_FALLTHRU)
.L145:
	movl	%ebx, %eax	# nfft, tmp200
	cltd
	idivl	%esi	# nfft
	testl	%edx, %edx	# D.5656
# SUCC: 28 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 23 [50.0%]  (CAN_FALLTHRU)
	je	.L136	#,
# BLOCK 28 freq:108 seq:26
# PRED: 27 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$2, %esi	#, nfft
# SUCC: 55 [33.3%]  (CAN_FALLTHRU) 29 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L138	#,
# BLOCK 29 freq:72 seq:27
# PRED: 28 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$4, %esi	#, nfft
# SUCC: 30 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 33 [50.0%]  (CAN_FALLTHRU)
	jne	.L137	#,
# BLOCK 30 freq:833 seq:28
# PRED: 29 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%ebx, %esi	# nfft, tmp210
	sarl	$31, %esi	#, tmp210
	movl	%esi, %edx	# tmp210, tmp211
	shrl	$31, %edx	#, tmp211
	leal	(%rbx,%rdx), %eax	#, tmp212
	andl	$1, %eax	#, tmp213
	cmpl	%edx, %eax	# tmp211, tmp213
# SUCC: 31 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 22 [50.0%]  (CAN_FALLTHRU)
	je	.L164	#,
# BLOCK 31 freq:417 seq:29
# PRED: 30 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	comisd	%xmm0, %xmm1	# D.5655, D.5655
# SUCC: 34 [50.0%]  (CAN_FALLTHRU) 32 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	ja	.L142	#,
# BLOCK 32 freq:835 seq:30
# PRED: 31 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%ebx, %eax	# nfft, tmp297
	imull	%edi	# tmp290
	subl	%esi, %edx	# tmp210, tmp216
	movl	$3, %esi	#, nfft
	leal	(%rdx,%rdx,2), %eax	#, tmp222
	cmpl	%eax, %ebx	# tmp222, nfft
# SUCC: 33 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 23 [50.0%]  (CAN_FALLTHRU)
	je	.L136	#,
# BLOCK 33 freq:186 seq:31
# PRED: 32 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 66 [50.0%]  (CAN_FALLTHRU) 29 [50.0%]  (CAN_FALLTHRU)
.L137:
	addl	$2, %esi	#, D.5656
	pxor	%xmm2, %xmm2	# D.5655
	movq	%rcx, %rax	# facbuf, facbuf
	cvtsi2sd	%esi, %xmm2	# D.5656, D.5655
	comisd	%xmm0, %xmm2	# D.5655, D.5655
# SUCC: 34 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 57 [50.0%]  (CAN_FALLTHRU)
	jbe	.L143	#,
# BLOCK 34 freq:278 seq:32
# PRED: 56 [50.0%]  (CAN_FALLTHRU) 31 [50.0%]  (CAN_FALLTHRU) 33 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
.L142:
	movl	%ebx, %esi	# nfft, nfft
	movq	%rcx, %rax	# facbuf, facbuf
# SUCC: 57 [100.0%]  (CAN_FALLTHRU)
	jmp	.L143	#
# BLOCK 35 freq:833 seq:33
# PRED: 41 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L149:
	movl	%ebx, %edx	# nfft, tmp245
	shrl	$31, %edx	#, tmp245
	leal	(%rbx,%rdx), %eax	#, tmp246
	andl	$1, %eax	#, tmp247
	cmpl	%edx, %eax	# tmp245, tmp247
# SUCC: 64 [50.0%]  (CAN_FALLTHRU) 36 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L170	#,
# BLOCK 36 freq:418 seq:34
# PRED: 35 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	$2, (%rcx)	#, *facbuf_73
	leaq	8(%rcx), %rdi	#, facbuf
	movl	%edx, %eax	# tmp245, tmp250
	addl	%ebx, %eax	# nfft, tmp251
	movl	%eax, %ebx	# tmp251, nfft
	sarl	%ebx	# nfft
	movl	%ebx, 4(%rcx)	# nfft, MEM[(int *)facbuf_73 + 4B]
	cmpl	$1, %ebx	#, nfft
# SUCC: 37 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 24 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	jle	.L182	#,
# BLOCK 37 freq:372 seq:35
# PRED: 36 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	shrl	$31, %eax	#, tmp255
	leal	(%rbx,%rax), %edx	#, tmp256
	andl	$1, %edx	#, tmp257
	cmpl	%eax, %edx	# tmp255, tmp257
# SUCC: 38 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 69 [50.0%]  (CAN_FALLTHRU)
	je	.L171	#,
# BLOCK 38 freq:186 seq:36
# PRED: 37 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%ebx, %esi	# nfft, nfft
# SUCC: 39 [100.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU)
	movq	%rdi, %rcx	# facbuf, facbuf
# BLOCK 39 freq:185 seq:37
# PRED: 38 [100.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 25 [50.0%]  (CAN_FALLTHRU) 44 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 70 [100.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L135:
	movl	%ebx, %eax	# nfft, tmp240
	movq	%rcx, %rdi	# facbuf, facbuf
	cltd
	idivl	%esi	# nfft
	testl	%edx, %edx	# D.5656
# SUCC: 44 [50.0%]  (CAN_FALLTHRU) 40 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L151	#,
# BLOCK 40 freq:370 seq:38
# PRED: 39 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 43 [50.0%]  (CAN_FALLTHRU)
.L207:
	cmpl	$2, %esi	#, nfft
# SUCC: 70 [33.3%]  (CAN_FALLTHRU) 41 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L168	#,
# BLOCK 41 freq:247 seq:39
# PRED: 40 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$4, %esi	#, nfft
# SUCC: 35 [50.0%]  (CAN_FALLTHRU) 42 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L149	#,
# BLOCK 42 freq:417 seq:40
# PRED: 41 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	addl	$2, %esi	#, nfft
	pxor	%xmm2, %xmm2	# D.5655
# SUCC: 43 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	cvtsi2sd	%esi, %xmm2	# nfft, D.5655
# BLOCK 43 freq:556 seq:41
# PRED: 42 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 64 [100.0%]  (CAN_FALLTHRU)
.L150:
	comisd	%xmm0, %xmm2	# D.5655, D.5655
	movl	%ebx, %eax	# nfft, tmp240
	movq	%rcx, %rdi	# facbuf, facbuf
	cmova	%ebx, %esi	# nfft,, nfft, nfft
	cltd
	idivl	%esi	# nfft
	testl	%edx, %edx	# D.5656
# SUCC: 44 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 40 [50.0%]  (CAN_FALLTHRU)
	jne	.L207	#,
# BLOCK 44 freq:833 seq:42
# PRED: 43 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 39 [50.0%]  (CAN_FALLTHRU) 69 [100.0%]  (CAN_FALLTHRU)
.L151:
	movl	%esi, (%rdi)	# nfft, *facbuf_210
	leaq	8(%rdi), %rcx	#, facbuf
	movl	%ebx, %eax	# nfft, nfft
	cltd
	idivl	%esi	# nfft
	movl	%eax, %ebx	# nfft, nfft
	movl	%eax, 4(%rdi)	# nfft, MEM[(int *)facbuf_210 + 4B]
	cmpl	$1, %eax	#, nfft
# SUCC: 39 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 45 [9.0%]  (FALLTHRU)
	jg	.L135	#,
# BLOCK 45 freq:75 seq:43
# PRED: 44 [9.0%]  (FALLTHRU)
# SUCC: 24 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	jmp	.L182	#
# BLOCK 46 freq:1250 seq:44
# PRED: 48 [50.0%]  (CAN_FALLTHRU) 51 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L208:
	movl	%eax, %ebx	# tmp277, nfft
	movl	%esi, (%rcx)	# nfft, *facbuf_51
	leaq	8(%rcx), %rax	#, facbuf
	movl	%ebx, 4(%rcx)	# nfft, MEM[(int *)facbuf_51 + 4B]
	cmpl	$1, %ebx	#, nfft
# SUCC: 47 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 24 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	jle	.L182	#,
# BLOCK 47 freq:1138 seq:45
# PRED: 46 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
# SUCC: 48 [100.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU)
	movq	%rax, %rcx	# facbuf, facbuf
# BLOCK 48 freq:927 seq:46
# PRED: 12 [50.0%]  (CAN_FALLTHRU) 47 [100.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 53 [100.0%]  (DFS_BACK,CAN_FALLTHRU)
.L124:
	movl	%ebx, %eax	# nfft, tmp277
	cltd
	idivl	%esi	# nfft
	testl	%edx, %edx	# D.5656
# SUCC: 49 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 46 [50.0%]  (CAN_FALLTHRU)
	je	.L208	#,
# BLOCK 49 freq:463 seq:47
# PRED: 48 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$2, %esi	#, nfft
# SUCC: 53 [33.3%]  (CAN_FALLTHRU) 50 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L172	#,
# BLOCK 50 freq:371 seq:48
# PRED: 49 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 52 [66.7%]  (CAN_FALLTHRU)
.L209:
	cmpl	$4, %esi	#, nfft
# SUCC: 53 [50.0%]  (CAN_FALLTHRU) 51 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L172	#,
# BLOCK 51 freq:186 seq:49
# PRED: 50 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	addl	$2, %esi	#, nfft
	pxor	%xmm1, %xmm1	# D.5655
	movl	%ebx, %eax	# nfft, tmp277
	cvtsi2sd	%esi, %xmm1	# nfft, D.5655
	comisd	%xmm0, %xmm1	# D.5655, D.5655
	cmova	%ebx, %esi	# nfft,, nfft, nfft
	cltd
	idivl	%esi	# nfft
	testl	%edx, %edx	# D.5656
# SUCC: 52 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 46 [50.0%]  (CAN_FALLTHRU)
	je	.L208	#,
# BLOCK 52 freq:93 seq:50
# PRED: 51 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$2, %esi	#, nfft
# SUCC: 53 [33.3%]  (FALLTHRU,CAN_FALLTHRU) 50 [66.7%]  (CAN_FALLTHRU)
	jne	.L209	#,
# BLOCK 53 freq:371 seq:51
# PRED: 49 [33.3%]  (CAN_FALLTHRU) 50 [50.0%]  (CAN_FALLTHRU) 52 [33.3%]  (FALLTHRU,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L172:
	movl	%ebx, %esi	# nfft, nfft
# SUCC: 48 [100.0%]  (DFS_BACK,CAN_FALLTHRU)
	jmp	.L124	#
# BLOCK 54 freq:226 seq:52
# PRED: 10 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L205:
	cvttsd2siq	%xmm0, %rax	# D.5655, tmp169
	pxor	%xmm0, %xmm0	# D.5655
	cvtsi2sdq	%rax, %xmm0	# tmp169, D.5655
# SUCC: 11 [100.0%]  (CAN_FALLTHRU)
	jmp	.L119	#
# BLOCK 55 freq:556 seq:53
# PRED: 28 [33.3%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L138:
	movl	%ebx, %eax	# nfft, tmp296
	imull	%edi	# tmp290
	movl	%ebx, %eax	# nfft, tmp204
	sarl	$31, %eax	#, tmp204
	subl	%eax, %edx	# tmp204, tmp201
	leal	(%rdx,%rdx,2), %eax	#, tmp207
	cmpl	%eax, %ebx	# tmp207, nfft
# SUCC: 56 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 65 [50.0%]  (CAN_FALLTHRU)
	je	.L210	#,
# BLOCK 56 freq:278 seq:54
# PRED: 55 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movsd	.LC5(%rip), %xmm2	#, D.5655
	movl	$5, %esi	#, nfft
	movq	%rcx, %rax	# facbuf, facbuf
	comisd	%xmm0, %xmm2	# D.5655, D.5655
# SUCC: 34 [50.0%]  (CAN_FALLTHRU) 57 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	ja	.L142	#,
# BLOCK 57 freq:207 seq:55
# PRED: 56 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 23 [91.0%]  (CAN_FALLTHRU) 33 [50.0%]  (CAN_FALLTHRU) 34 [100.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L143:
	movq	%rax, %rcx	# facbuf, facbuf
# SUCC: 27 [100.0%]  (DFS_BACK,CAN_FALLTHRU)
	jmp	.L145	#
# BLOCK 58 freq:556 seq:56
# PRED: 17 [33.3%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L129:
	movl	%ebx, %eax	# nfft, tmp294
	imull	%r8d	# tmp287
	movl	%ebx, %eax	# nfft, tmp180
	sarl	$31, %eax	#, tmp180
	subl	%eax, %edx	# tmp180, tmp177
	leal	(%rdx,%rdx,2), %eax	#, tmp183
	cmpl	%eax, %ebx	# tmp183, nfft
# SUCC: 68 [50.0%]  (CAN_FALLTHRU) 59 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L161	#,
# BLOCK 59 freq:278 seq:57
# PRED: 58 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	$3, (%rcx)	#, *facbuf_131
	leaq	8(%rcx), %rdi	#, facbuf
	movl	%edx, %ebx	# tmp177, nfft
	movl	%edx, 4(%rcx)	# nfft, MEM[(int *)facbuf_131 + 4B]
	cmpl	$1, %edx	#, nfft
# SUCC: 60 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 24 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	jle	.L182	#,
# BLOCK 60 freq:247 seq:58
# PRED: 59 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%edx, %eax	# nfft, tmp295
	movl	$3, %esi	#, nfft
	imull	%r8d	# tmp287
	movl	%ebx, %eax	# nfft, tmp192
	sarl	$31, %eax	#, tmp192
	subl	%eax, %edx	# tmp192, tmp189
	leal	(%rdx,%rdx,2), %eax	#, tmp195
	cmpl	%eax, %ebx	# tmp195, nfft
# SUCC: 15 [50.0%]  (CAN_FALLTHRU) 61 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L131	#,
# BLOCK 61 freq:124 seq:59
# PRED: 60 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rdi, %rcx	# facbuf, facbuf
# SUCC: 62 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	$3, %esi	#, nfft
# BLOCK 62 freq:186 seq:60
# PRED: 61 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 18 [50.0%]  (CAN_FALLTHRU)
.L128:
	addl	$2, %esi	#, D.5656
	pxor	%xmm1, %xmm1	# D.5655
# SUCC: 63 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	cvtsi2sd	%esi, %xmm1	# D.5656, D.5655
# BLOCK 63 freq:556 seq:61
# PRED: 62 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 68 [100.0%]  (CAN_FALLTHRU)
.L130:
	comisd	%xmm0, %xmm1	# D.5655, D.5655
	cmova	%ebx, %esi	# nfft,, nfft, nfft
# SUCC: 16 [100.0%]  (DFS_BACK,CAN_FALLTHRU)
	jmp	.L132	#
# BLOCK 64 freq:417 seq:62
# PRED: 35 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L170:
	movapd	%xmm1, %xmm2	# D.5655, D.5655
	movl	$3, %esi	#, nfft
# SUCC: 43 [100.0%]  (CAN_FALLTHRU)
	jmp	.L150	#
# BLOCK 65 freq:278 seq:63
# PRED: 55 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L210:
	movl	$3, (%rcx)	#, *facbuf_109
	leaq	8(%rcx), %rsi	#, facbuf
	movl	%edx, %ebx	# tmp201, nfft
	movl	%edx, 4(%rcx)	# nfft, MEM[(int *)facbuf_109 + 4B]
	cmpl	$1, %edx	#, nfft
# SUCC: 66 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 24 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	jle	.L182	#,
# BLOCK 66 freq:62 seq:64
# PRED: 65 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%edx, %eax	# nfft, tmp298
	movq	%rsi, %rcx	# facbuf, facbuf
	movl	$3, %esi	#, nfft
	imull	%edi	# tmp290
	movl	%ebx, %eax	# nfft, tmp231
	sarl	$31, %eax	#, tmp231
	subl	%eax, %edx	# tmp231, tmp228
	leal	(%rdx,%rdx,2), %eax	#, tmp234
	cmpl	%eax, %ebx	# tmp234, nfft
# SUCC: 33 [50.0%]  (CAN_FALLTHRU) 67 [50.0%]  (FALLTHRU)
	jne	.L137	#,
# BLOCK 67 freq:31 seq:65
# PRED: 66 [50.0%]  (FALLTHRU)
# SUCC: 23 [100.0%]  (CAN_FALLTHRU)
	jmp	.L136	#
# BLOCK 68 freq:278 seq:66
# PRED: 58 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L161:
	movsd	.LC5(%rip), %xmm1	#, D.5655
	movl	$5, %esi	#, nfft
# SUCC: 63 [100.0%]  (CAN_FALLTHRU)
	jmp	.L130	#
# BLOCK 69 freq:186 seq:67
# PRED: 37 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L171:
	movl	$2, %esi	#, nfft
# SUCC: 44 [100.0%]  (CAN_FALLTHRU)
	jmp	.L151	#
# BLOCK 70 freq:123 seq:68
# PRED: 40 [33.3%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L168:
	movl	%ebx, %esi	# nfft, nfft
# SUCC: 39 [100.0%]  (DFS_BACK,CAN_FALLTHRU)
	jmp	.L135	#
# BLOCK 71 freq:41 seq:69
# PRED: 7 [9.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L204:
	pxor	%xmm5, %xmm5	# D.5655
	cvtsi2sd	%ebx, %xmm5	# nfft, D.5655
	movsd	%xmm5, 8(%rsp)	# D.5655, %sfp
# SUCC: 10 [100.0%]  (CAN_FALLTHRU)
	jmp	.L154	#
# BLOCK 72 freq:34 seq:70
# PRED: 2 [6.7%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L203:
	movl	%esi, (%rsp)	# inverse_fft, %sfp
	call	malloc	#
	movl	(%rsp), %esi	# %sfp, inverse_fft
	movq	%rax, %r12	#, mem
# SUCC: 6 [100.0%]  (CAN_FALLTHRU)
	jmp	.L115	#
	.cfi_endproc
.LFE52:
	.size	kiss_fft_alloc, .-kiss_fft_alloc
	.section	.text.unlikely
.LCOLDE13:
	.text
.LHOTE13:
	.section	.text.unlikely
.LCOLDB14:
	.text
.LHOTB14:
	.p2align 4,,15
	.globl	kiss_fft_stride
	.type	kiss_fft_stride, @function
kiss_fft_stride:
.LFB53:
	.cfi_startproc
# BLOCK 2 freq:10000 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	movq	%rdi, %r8	# st, st
	movq	%rdx, %rdi	# fout, fout
	movl	%ecx, %edx	# in_stride, in_stride
	cmpq	%rdi, %rsi	# fout, fin
# SUCC: 4 [10.1%]  (CAN_FALLTHRU) 3 [89.9%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L214	#,
# BLOCK 3 freq:8986 seq:1
# PRED: 2 [89.9%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	8(%r8), %rcx	#, D.5686
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	kf_work.constprop.1	#
# BLOCK 4 freq:1014 seq:2
# PRED: 2 [10.1%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L214:
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%ecx, %r12d	# in_stride, in_stride
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rsi, %rbp	# fin, fin
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%r8, %rbx	# st, st
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 48
	movslq	(%r8), %rdi	# st_4(D)->nfft, D.5688
	salq	$3, %rdi	#, D.5688
	call	malloc	#
	leaq	8(%rbx), %rcx	#, D.5686
	movq	%rbx, %r8	# st,
	movl	%r12d, %edx	# in_stride,
	movq	%rbp, %rsi	# fin,
	movq	%rax, %rdi	# tmp103,
	movq	%rax, %r13	#, tmp103
	call	kf_work.constprop.1	#
	movslq	(%rbx), %rdx	# st_4(D)->nfft, D.5688
	movq	%rbp, %rdi	# fin,
	movq	%r13, %rsi	# tmp103,
	salq	$3, %rdx	#, D.5688
	call	memcpy	#
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 40
	movq	%r13, %rdi	# tmp103,
	popq	%rbx	#
	.cfi_restore 3
	.cfi_def_cfa_offset 32
	popq	%rbp	#
	.cfi_restore 6
	.cfi_def_cfa_offset 24
	popq	%r12	#
	.cfi_restore 12
	.cfi_def_cfa_offset 16
	popq	%r13	#
	.cfi_restore 13
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	free	#
	.cfi_endproc
.LFE53:
	.size	kiss_fft_stride, .-kiss_fft_stride
	.section	.text.unlikely
.LCOLDE14:
	.text
.LHOTE14:
	.section	.text.unlikely
.LCOLDB15:
	.text
.LHOTB15:
	.p2align 4,,15
	.globl	kiss_fft
	.type	kiss_fft, @function
kiss_fft:
.LFB54:
	.cfi_startproc
# BLOCK 2 freq:1391 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14	# fin, fin
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx	# cfg, cfg
	subq	$56, %rsp	#,
	.cfi_def_cfa_offset 112
	cmpq	%rdx, %rsi	# fout, fin
# SUCC: 39 [10.1%]  (CAN_FALLTHRU) 3 [89.9%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L323	#,
# BLOCK 3 freq:1250 seq:1
# PRED: 2 [89.9%]  (FALLTHRU,CAN_FALLTHRU)
	movl	8(%rdi), %eax	# MEM[(int *)cfg_2(D) + 8B], p
	movq	%rdx, %r15	# fout, fout
	movl	12(%rdi), %edi	# MEM[(int *)cfg_2(D) + 12B], m
	movl	%eax, 16(%rsp)	# p, %sfp
	imull	%edi, %eax	# m, D.6035
	movl	%edi, 28(%rsp)	# m, %sfp
	cltq
	leaq	(%rdx,%rax,8), %r12	#, Fout_end
	cmpl	$1, %edi	#, m
# SUCC: 27 [28.0%]  (CAN_FALLTHRU) 4 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L324	#,
# BLOCK 4 freq:900 seq:2
# PRED: 3 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	movslq	16(%rsp), %rax	# %sfp, D.6036
	leaq	16(%rbx), %rbp	#, factors
	movq	%rdx, 32(%rsp)	# fout, %sfp
	movslq	28(%rsp), %r13	# %sfp, D.6036
	movq	%rax, 8(%rsp)	# D.6036, %sfp
	leaq	0(,%r13,8), %rax	#, D.6036
	movq	%rax, %r13	# D.6036, D.6036
	movq	%rbp, %rax	# factors, factors
	movq	%rsi, %rbp	# fin, fin
# SUCC: 5 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, %r14	# factors, factors
# BLOCK 5 freq:10000 seq:3
# PRED: 4 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 5 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L248:
	movq	8(%rsp), %rdx	# %sfp,
	movq	%rbp, %rsi	# fin,
	movq	%r15, %rdi	# fout,
	movq	%rbx, %r9	# cfg,
	movq	%r14, %r8	# factors,
	movl	$1, %ecx	#,
	addq	%r13, %r15	# D.6036, fout
	addq	$8, %rbp	#, fin
	call	kf_work	#
	cmpq	%r15, %r12	# fout, Fout_end
# SUCC: 5 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 6 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L248	#,
# BLOCK 6 freq:900 seq:4
# PRED: 5 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$3, 16(%rsp)	#, %sfp
	movq	32(%rsp), %r15	# %sfp, fout
# SUCC: 30 [20.0%]  (CAN_FALLTHRU) 7 [80.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L243	#,
# BLOCK 7 freq:1000 seq:5
# PRED: 6 [80.0%]  (FALLTHRU,CAN_FALLTHRU) 29 [80.0%]  (CAN_FALLTHRU)
.L326:
# SUCC: 8 [62.5%]  (FALLTHRU,CAN_FALLTHRU) 11 [37.5%]  (CAN_FALLTHRU)
	jle	.L325	#,
# BLOCK 8 freq:625 seq:6
# PRED: 7 [62.5%]  (FALLTHRU,CAN_FALLTHRU)
	movl	16(%rsp), %eax	# %sfp, p
	cmpl	$4, %eax	#, p
# SUCC: 34 [40.0%]  (CAN_FALLTHRU) 9 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L246	#,
# BLOCK 9 freq:375 seq:7
# PRED: 8 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%eax, %r8d	# p,
	cmpl	$5, %eax	#, p
# SUCC: 33 [33.3%]  (CAN_FALLTHRU) 10 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L242	#,
# BLOCK 10 freq:250 seq:8
# PRED: 9 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movl	28(%rsp), %ecx	# %sfp,
	addq	$56, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbx, %rdx	# cfg,
	movq	%r15, %rdi	# fout,
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	movl	$1, %esi	#,
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	kf_bfly5	#
# BLOCK 11 freq:375 seq:9
# PRED: 7 [37.5%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L325:
	.cfi_restore_state
	cmpl	$2, 16(%rsp)	#, %sfp
	movl	16(%rsp), %r8d	# %sfp,
# SUCC: 33 [33.3%]  (CAN_FALLTHRU) 12 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L242	#,
# BLOCK 12 freq:250 seq:10
# PRED: 11 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movl	28(%rsp), %r11d	# %sfp, m
	leaq	264(%rbx), %rdx	#, tw1
	leaq	32(%r15), %r12	#, D.6040
	leaq	296(%rbx), %r10	#, D.6047
	movslq	%r11d, %rcx	# m,
	movl	%r11d, %r8d	# m, D.6038
	salq	$3, %rcx	#, D.6036
	leaq	(%r15,%rcx), %rax	#, Fout2
	addq	$32, %rcx	#, D.6036
	leaq	(%r15,%rcx), %rsi	#, D.6040
	cmpq	%rsi, %rdx	# D.6040, tw1
	setnb	%sil	#, tmp1074
	cmpq	%rdx, %r12	# tw1, D.6040
	setbe	%r9b	#, D.6039
	cmpq	%r10, %r15	# D.6047, fout
	setnb	%dil	#, D.6039
	orl	%r9d, %edi	# D.6039, D.6039
	cmpl	$3, %r11d	#, m
	seta	%r9b	#, D.6039
	andl	%r9d, %edi	# D.6039, D.6039
	cmpq	%r10, %rax	# D.6047, Fout2
	setnb	%r9b	#, D.6039
	orl	%r9d, %esi	# D.6039, D.6039
	testb	%sil, %dil	# D.6039, D.6039
# SUCC: 54 [10.0%]  (CAN_FALLTHRU) 13 [90.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L250	#,
# BLOCK 13 freq:225 seq:11
# PRED: 12 [90.0%]  (FALLTHRU,CAN_FALLTHRU)
	testq	%rcx, %rcx	# D.6036
	setle	%sil	#, D.6039
	cmpq	%r12, %rax	# D.6040, Fout2
	setnb	%cl	#, D.6039
	orb	%cl, %sil	# D.6039, tmp1365
# SUCC: 54 [11.1%]  (CAN_FALLTHRU) 14 [88.9%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L250	#,
# BLOCK 14 freq:200 seq:12
# PRED: 13 [88.9%]  (FALLTHRU,CAN_FALLTHRU)
	leal	-5(%r11), %edi	#, D.6038
	leal	-1(%r11), %ecx	#, m
	shrl	$2, %edi	#, D.6038
	addl	$1, %edi	#, bnd.418
	leal	0(,%rdi,4), %r10d	#, ratio_mult_vf.419
	cmpl	$3, %ecx	#, m
# SUCC: 15 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 19 [33.3%]  (CAN_FALLTHRU)
	jbe	.L251	#,
# BLOCK 15 freq:133 seq:13
# PRED: 14 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%r15, %rsi	# fout, ivtmp.560
	xorl	%ecx, %ecx	# ivtmp.559
# SUCC: 16 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	xorl	%r9d, %r9d	# ivtmp.555
# BLOCK 16 freq:267 seq:14
# PRED: 15 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 16 [50.0%]  (DFS_BACK,CAN_FALLTHRU)
.L252:
	movups	(%rax,%rcx), %xmm4	# MEM[base: Fout2_256, index: ivtmp.559_1170, offset: 0B], tmp1096
	addl	$1, %r9d	#, ivtmp.555
	addq	$32, %rsi	#, ivtmp.560
	movups	16(%rax,%rcx), %xmm0	# MEM[base: Fout2_256, index: ivtmp.559_1170, offset: 16B], tmp1097
	movups	264(%rbx,%rcx), %xmm3	# MEM[base: cfg_2(D), index: ivtmp.559_1170, offset: 264B], tmp1098
	movaps	%xmm4, %xmm2	# tmp1096, D.6043
	movups	280(%rbx,%rcx), %xmm1	# MEM[base: cfg_2(D), index: ivtmp.559_1170, offset: 280B], tmp1099
	shufps	$221, %xmm0, %xmm4	#, tmp1097, D.6043
	shufps	$136, %xmm0, %xmm2	#, tmp1097, D.6043
	movaps	%xmm3, %xmm0	# tmp1098, D.6043
	shufps	$136, %xmm1, %xmm0	#, tmp1099, D.6043
	shufps	$221, %xmm1, %xmm3	#, tmp1099, D.6043
	movaps	%xmm0, %xmm5	# D.6043, vect__261.432
	movaps	%xmm3, %xmm1	# D.6043, vect__264.433
	mulps	%xmm4, %xmm1	# D.6043, vect__264.433
	mulps	%xmm4, %xmm0	# D.6043, vect__267.436
	movups	-16(%rsi), %xmm4	# MEM[base: _1175, offset: 16B], tmp1105
	mulps	%xmm2, %xmm5	# D.6043, vect__261.432
	mulps	%xmm3, %xmm2	# D.6043, vect__266.435
	subps	%xmm1, %xmm5	# vect__264.433, vect__265.434
	movaps	%xmm0, %xmm1	# vect__267.436, vect__268.437
	movups	-32(%rsi), %xmm0	# MEM[base: _1175, offset: 0B], tmp1104
	addps	%xmm2, %xmm1	# vect__266.435, vect__268.437
	movaps	%xmm0, %xmm2	# tmp1104, D.6043
	shufps	$221, %xmm4, %xmm0	#, tmp1105, D.6043
	shufps	$136, %xmm4, %xmm2	#, tmp1105, D.6043
	movaps	%xmm2, %xmm3	# D.6043, vect__273.442
	addps	%xmm5, %xmm2	# vect__265.434, vect__277.450
	movaps	%xmm0, %xmm4	# D.6043, vect__275.447
	subps	%xmm5, %xmm3	# vect__265.434, vect__273.442
	subps	%xmm1, %xmm4	# vect__268.437, vect__275.447
	addps	%xmm1, %xmm0	# vect__268.437, vect__279.451
	movaps	%xmm2, %xmm1	# vect__277.450, D.6043
	movaps	%xmm3, %xmm6	# vect__273.442, D.6043
	unpcklps	%xmm4, %xmm6	# vect__275.447, D.6043
	unpckhps	%xmm4, %xmm3	# vect__275.447, D.6043
	movups	%xmm6, (%rax,%rcx)	# D.6043, MEM[base: Fout2_256, index: ivtmp.559_1170, offset: 0B]
	movups	%xmm3, 16(%rax,%rcx)	# D.6043, MEM[base: Fout2_256, index: ivtmp.559_1170, offset: 16B]
	unpcklps	%xmm0, %xmm1	# vect__279.451, D.6043
	unpckhps	%xmm0, %xmm2	# vect__279.451, D.6043
	addq	$32, %rcx	#, ivtmp.559
	movups	%xmm1, -32(%rsi)	# D.6043, MEM[base: _1175, offset: 0B]
	movups	%xmm2, -16(%rsi)	# D.6043, MEM[base: _1175, offset: 16B]
	cmpl	%r9d, %edi	# ivtmp.555, bnd.418
# SUCC: 16 [50.0%]  (DFS_BACK,CAN_FALLTHRU) 17 [50.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	ja	.L252	#,
# BLOCK 17 freq:133 seq:15
# PRED: 16 [50.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	subl	%r10d, 28(%rsp)	# ratio_mult_vf.419, %sfp
	movl	%r10d, %ecx	# ratio_mult_vf.419, D.6041
	salq	$3, %rcx	#, D.6041
	movl	28(%rsp), %esi	# %sfp, m
	addq	%rcx, %r15	# D.6041, fout
	addq	%rcx, %rax	# D.6041, Fout2
	addq	%rcx, %rdx	# D.6041, tw1
	cmpl	%r8d, %r10d	# D.6038, ratio_mult_vf.419
# SUCC: 18 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 26 [33.3%]  (CAN_FALLTHRU)
	je	.L215	#,
# BLOCK 18 freq:89 seq:16
# PRED: 17 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
# SUCC: 19 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leal	-1(%rsi), %ecx	#, m
# BLOCK 19 freq:156 seq:17
# PRED: 18 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 14 [33.3%]  (CAN_FALLTHRU)
.L251:
	movss	(%rax), %xmm4	# Fout2_644->r, D.6037
	movss	4(%rax), %xmm1	# Fout2_644->i, D.6037
	movss	(%rdx), %xmm0	# tw1_642->r, D.6037
	movaps	%xmm4, %xmm2	# D.6037, D.6037
	movss	4(%rdx), %xmm3	# tw1_642->i, D.6037
	movaps	%xmm1, %xmm5	# D.6037, D.6037
	mulss	%xmm0, %xmm2	# D.6037, D.6037
	mulss	%xmm3, %xmm5	# D.6037, D.6037
	mulss	%xmm0, %xmm1	# D.6037, D.6037
	mulss	%xmm4, %xmm3	# D.6037, D.6037
	subss	%xmm5, %xmm2	# D.6037, D.6037
	addss	%xmm1, %xmm3	# D.6037, D.6037
	movss	(%r15), %xmm1	# fout_648->r, fout_648->r
	subss	%xmm2, %xmm1	# D.6037, D.6037
	movaps	%xmm3, %xmm0	# D.6037, D.6037
	movss	%xmm1, (%rax)	# D.6037, Fout2_644->r
	movss	4(%r15), %xmm1	# fout_648->i, fout_648->i
	addss	(%r15), %xmm2	# fout_648->r, D.6037
	subss	%xmm3, %xmm1	# D.6037, D.6037
	movss	%xmm1, 4(%rax)	# D.6037, Fout2_644->i
	addss	4(%r15), %xmm0	# fout_648->i, D.6037
	movss	%xmm2, (%r15)	# D.6037, fout_648->r
	movss	%xmm0, 4(%r15)	# D.6037, fout_648->i
	testl	%ecx, %ecx	# m
# SUCC: 20 [75.0%]  (FALLTHRU,CAN_FALLTHRU) 26 [25.0%]  (CAN_FALLTHRU)
	je	.L215	#,
# BLOCK 20 freq:156 seq:18
# PRED: 19 [75.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	8(%rax), %xmm4	# MEM[(struct kiss_fft_cpx *)Fout2_644 + 8B].r, D.6037
	movss	12(%rax), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout2_644 + 8B].i, D.6037
	movss	8(%rdx), %xmm0	# MEM[(struct kiss_fft_cpx *)tw1_642 + 8B].r, D.6037
	movaps	%xmm4, %xmm2	# D.6037, D.6037
	movss	12(%rdx), %xmm3	# MEM[(struct kiss_fft_cpx *)tw1_642 + 8B].i, D.6037
	movaps	%xmm1, %xmm5	# D.6037, D.6037
	mulss	%xmm0, %xmm2	# D.6037, D.6037
	movl	28(%rsp), %esi	# %sfp, m
	mulss	%xmm3, %xmm5	# D.6037, D.6037
	mulss	%xmm0, %xmm1	# D.6037, D.6037
	mulss	%xmm4, %xmm3	# D.6037, D.6037
	subss	%xmm5, %xmm2	# D.6037, D.6037
	addss	%xmm1, %xmm3	# D.6037, D.6037
	movss	8(%r15), %xmm1	# MEM[(struct kiss_fft_cpx *)fout_648 + 8B].r, MEM[(struct kiss_fft_cpx *)fout_648 + 8B].r
	subss	%xmm2, %xmm1	# D.6037, D.6037
	movaps	%xmm3, %xmm0	# D.6037, D.6037
	movss	%xmm1, 8(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_644 + 8B].r
	movss	12(%r15), %xmm1	# MEM[(struct kiss_fft_cpx *)fout_648 + 8B].i, MEM[(struct kiss_fft_cpx *)fout_648 + 8B].i
	addss	8(%r15), %xmm2	# MEM[(struct kiss_fft_cpx *)fout_648 + 8B].r, D.6037
	subss	%xmm3, %xmm1	# D.6037, D.6037
	movss	%xmm1, 12(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_644 + 8B].i
	addss	12(%r15), %xmm0	# MEM[(struct kiss_fft_cpx *)fout_648 + 8B].i, D.6037
	movss	%xmm2, 8(%r15)	# D.6037, MEM[(struct kiss_fft_cpx *)fout_648 + 8B].r
	movss	%xmm0, 12(%r15)	# D.6037, MEM[(struct kiss_fft_cpx *)fout_648 + 8B].i
	cmpl	$2, %esi	#, m
# SUCC: 21 [75.0%]  (FALLTHRU,CAN_FALLTHRU) 26 [25.0%]  (CAN_FALLTHRU)
	je	.L215	#,
# BLOCK 21 freq:156 seq:19
# PRED: 20 [75.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	16(%rax), %xmm4	# MEM[(struct kiss_fft_cpx *)Fout2_644 + 16B].r, D.6037
	movss	20(%rax), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout2_644 + 16B].i, D.6037
	movss	16(%rdx), %xmm0	# MEM[(struct kiss_fft_cpx *)tw1_642 + 16B].r, D.6037
	movaps	%xmm4, %xmm2	# D.6037, D.6037
	movss	20(%rdx), %xmm3	# MEM[(struct kiss_fft_cpx *)tw1_642 + 16B].i, D.6037
	movaps	%xmm1, %xmm5	# D.6037, D.6037
	mulss	%xmm0, %xmm2	# D.6037, D.6037
	mulss	%xmm3, %xmm5	# D.6037, D.6037
	mulss	%xmm0, %xmm1	# D.6037, D.6037
	mulss	%xmm4, %xmm3	# D.6037, D.6037
	subss	%xmm5, %xmm2	# D.6037, D.6037
	addss	%xmm1, %xmm3	# D.6037, D.6037
	movss	16(%r15), %xmm1	# MEM[(struct kiss_fft_cpx *)fout_648 + 16B].r, MEM[(struct kiss_fft_cpx *)fout_648 + 16B].r
	subss	%xmm2, %xmm1	# D.6037, D.6037
	movaps	%xmm3, %xmm0	# D.6037, D.6037
	movss	%xmm1, 16(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_644 + 16B].r
	movss	20(%r15), %xmm1	# MEM[(struct kiss_fft_cpx *)fout_648 + 16B].i, MEM[(struct kiss_fft_cpx *)fout_648 + 16B].i
	addss	16(%r15), %xmm2	# MEM[(struct kiss_fft_cpx *)fout_648 + 16B].r, D.6037
	subss	%xmm3, %xmm1	# D.6037, D.6037
	movss	%xmm1, 20(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_644 + 16B].i
	addss	20(%r15), %xmm0	# MEM[(struct kiss_fft_cpx *)fout_648 + 16B].i, D.6037
	movss	%xmm2, 16(%r15)	# D.6037, MEM[(struct kiss_fft_cpx *)fout_648 + 16B].r
	movss	%xmm0, 20(%r15)	# D.6037, MEM[(struct kiss_fft_cpx *)fout_648 + 16B].i
	cmpl	$3, %esi	#, m
# SUCC: 22 [75.0%]  (FALLTHRU,CAN_FALLTHRU) 26 [25.0%]  (CAN_FALLTHRU)
	je	.L215	#,
# BLOCK 22 freq:156 seq:20
# PRED: 21 [75.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	24(%rax), %xmm4	# MEM[(struct kiss_fft_cpx *)Fout2_644 + 24B].r, D.6037
	movss	28(%rax), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout2_644 + 24B].i, D.6037
	movss	24(%rdx), %xmm0	# MEM[(struct kiss_fft_cpx *)tw1_642 + 24B].r, D.6037
	movaps	%xmm4, %xmm2	# D.6037, D.6037
	movss	28(%rdx), %xmm3	# MEM[(struct kiss_fft_cpx *)tw1_642 + 24B].i, D.6037
	movaps	%xmm1, %xmm5	# D.6037, D.6037
	mulss	%xmm0, %xmm2	# D.6037, D.6037
	mulss	%xmm3, %xmm5	# D.6037, D.6037
	mulss	%xmm0, %xmm1	# D.6037, D.6037
	mulss	%xmm4, %xmm3	# D.6037, D.6037
	subss	%xmm5, %xmm2	# D.6037, D.6037
	addss	%xmm1, %xmm3	# D.6037, D.6037
	movss	24(%r15), %xmm1	# MEM[(struct kiss_fft_cpx *)fout_648 + 24B].r, MEM[(struct kiss_fft_cpx *)fout_648 + 24B].r
	subss	%xmm2, %xmm1	# D.6037, D.6037
	movaps	%xmm3, %xmm0	# D.6037, D.6037
	movss	%xmm1, 24(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_644 + 24B].r
	movss	28(%r15), %xmm1	# MEM[(struct kiss_fft_cpx *)fout_648 + 24B].i, MEM[(struct kiss_fft_cpx *)fout_648 + 24B].i
	addss	24(%r15), %xmm2	# MEM[(struct kiss_fft_cpx *)fout_648 + 24B].r, D.6037
	subss	%xmm3, %xmm1	# D.6037, D.6037
	movss	%xmm1, 28(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_644 + 24B].i
	addss	28(%r15), %xmm0	# MEM[(struct kiss_fft_cpx *)fout_648 + 24B].i, D.6037
	movss	%xmm2, 24(%r15)	# D.6037, MEM[(struct kiss_fft_cpx *)fout_648 + 24B].r
	movss	%xmm0, 28(%r15)	# D.6037, MEM[(struct kiss_fft_cpx *)fout_648 + 24B].i
	cmpl	$4, %esi	#, m
# SUCC: 23 [75.0%]  (FALLTHRU,CAN_FALLTHRU) 26 [25.0%]  (CAN_FALLTHRU)
	je	.L215	#,
# BLOCK 23 freq:156 seq:21
# PRED: 22 [75.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	32(%rax), %xmm4	# MEM[(struct kiss_fft_cpx *)Fout2_644 + 32B].r, D.6037
	movss	36(%rax), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout2_644 + 32B].i, D.6037
	movss	32(%rdx), %xmm0	# MEM[(struct kiss_fft_cpx *)tw1_642 + 32B].r, D.6037
	movaps	%xmm4, %xmm2	# D.6037, D.6037
	movss	36(%rdx), %xmm3	# MEM[(struct kiss_fft_cpx *)tw1_642 + 32B].i, D.6037
	movaps	%xmm1, %xmm5	# D.6037, D.6037
	mulss	%xmm0, %xmm2	# D.6037, D.6037
	mulss	%xmm3, %xmm5	# D.6037, D.6037
	mulss	%xmm0, %xmm1	# D.6037, D.6037
	mulss	%xmm4, %xmm3	# D.6037, D.6037
	subss	%xmm5, %xmm2	# D.6037, D.6037
	addss	%xmm1, %xmm3	# D.6037, D.6037
	movss	32(%r15), %xmm1	# MEM[(struct kiss_fft_cpx *)fout_648 + 32B].r, MEM[(struct kiss_fft_cpx *)fout_648 + 32B].r
	subss	%xmm2, %xmm1	# D.6037, D.6037
	movaps	%xmm3, %xmm0	# D.6037, D.6037
	movss	%xmm1, 32(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_644 + 32B].r
	movss	36(%r15), %xmm1	# MEM[(struct kiss_fft_cpx *)fout_648 + 32B].i, MEM[(struct kiss_fft_cpx *)fout_648 + 32B].i
	addss	32(%r15), %xmm2	# MEM[(struct kiss_fft_cpx *)fout_648 + 32B].r, D.6037
	subss	%xmm3, %xmm1	# D.6037, D.6037
	movss	%xmm1, 36(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_644 + 32B].i
	addss	36(%r15), %xmm0	# MEM[(struct kiss_fft_cpx *)fout_648 + 32B].i, D.6037
	movss	%xmm2, 32(%r15)	# D.6037, MEM[(struct kiss_fft_cpx *)fout_648 + 32B].r
	movss	%xmm0, 36(%r15)	# D.6037, MEM[(struct kiss_fft_cpx *)fout_648 + 32B].i
	cmpl	$5, %esi	#, m
# SUCC: 24 [75.0%]  (FALLTHRU,CAN_FALLTHRU) 26 [25.0%]  (CAN_FALLTHRU)
	je	.L215	#,
# BLOCK 24 freq:156 seq:22
# PRED: 23 [75.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	40(%rax), %xmm4	# MEM[(struct kiss_fft_cpx *)Fout2_644 + 40B].r, D.6037
	movss	44(%rax), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout2_644 + 40B].i, D.6037
	movss	40(%rdx), %xmm0	# MEM[(struct kiss_fft_cpx *)tw1_642 + 40B].r, D.6037
	movaps	%xmm4, %xmm2	# D.6037, D.6037
	movss	44(%rdx), %xmm3	# MEM[(struct kiss_fft_cpx *)tw1_642 + 40B].i, D.6037
	movaps	%xmm1, %xmm5	# D.6037, D.6037
	mulss	%xmm0, %xmm2	# D.6037, D.6037
	mulss	%xmm3, %xmm5	# D.6037, D.6037
	mulss	%xmm0, %xmm1	# D.6037, D.6037
	mulss	%xmm4, %xmm3	# D.6037, D.6037
	subss	%xmm5, %xmm2	# D.6037, D.6037
	addss	%xmm1, %xmm3	# D.6037, D.6037
	movss	40(%r15), %xmm1	# MEM[(struct kiss_fft_cpx *)fout_648 + 40B].r, MEM[(struct kiss_fft_cpx *)fout_648 + 40B].r
	subss	%xmm2, %xmm1	# D.6037, D.6037
	movaps	%xmm3, %xmm0	# D.6037, D.6037
	movss	%xmm1, 40(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_644 + 40B].r
	movss	44(%r15), %xmm1	# MEM[(struct kiss_fft_cpx *)fout_648 + 40B].i, MEM[(struct kiss_fft_cpx *)fout_648 + 40B].i
	addss	40(%r15), %xmm2	# MEM[(struct kiss_fft_cpx *)fout_648 + 40B].r, D.6037
	subss	%xmm3, %xmm1	# D.6037, D.6037
	movss	%xmm1, 44(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_644 + 40B].i
	addss	44(%r15), %xmm0	# MEM[(struct kiss_fft_cpx *)fout_648 + 40B].i, D.6037
	movss	%xmm2, 40(%r15)	# D.6037, MEM[(struct kiss_fft_cpx *)fout_648 + 40B].r
	movss	%xmm0, 44(%r15)	# D.6037, MEM[(struct kiss_fft_cpx *)fout_648 + 40B].i
	cmpl	$6, %esi	#, m
# SUCC: 25 [75.0%]  (FALLTHRU,CAN_FALLTHRU) 26 [25.0%]  (CAN_FALLTHRU)
	je	.L215	#,
# BLOCK 25 freq:156 seq:23
# PRED: 24 [75.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	52(%rdx), %xmm0	# MEM[(struct kiss_fft_cpx *)tw1_642 + 48B].i, D.6037
	movss	48(%rdx), %xmm3	# MEM[(struct kiss_fft_cpx *)tw1_642 + 48B].r, D.6037
	movss	48(%rax), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout2_644 + 48B].r, D.6037
	movaps	%xmm0, %xmm5	# D.6037, D.6037
	movss	52(%rax), %xmm4	# MEM[(struct kiss_fft_cpx *)Fout2_644 + 48B].i, D.6037
	movaps	%xmm3, %xmm2	# D.6037, D.6037
	mulss	%xmm1, %xmm2	# D.6037, D.6037
	mulss	%xmm4, %xmm5	# D.6037, D.6037
	mulss	%xmm0, %xmm1	# D.6037, D.6037
	mulss	%xmm4, %xmm3	# D.6037, D.6037
	subss	%xmm5, %xmm2	# D.6037, D.6037
	addss	%xmm1, %xmm3	# D.6037, D.6037
	movss	48(%r15), %xmm1	# MEM[(struct kiss_fft_cpx *)fout_648 + 48B].r, MEM[(struct kiss_fft_cpx *)fout_648 + 48B].r
	subss	%xmm2, %xmm1	# D.6037, D.6037
	movaps	%xmm3, %xmm0	# D.6037, D.6037
	movss	%xmm1, 48(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_644 + 48B].r
	movss	52(%r15), %xmm1	# MEM[(struct kiss_fft_cpx *)fout_648 + 48B].i, MEM[(struct kiss_fft_cpx *)fout_648 + 48B].i
	addss	48(%r15), %xmm2	# MEM[(struct kiss_fft_cpx *)fout_648 + 48B].r, D.6037
	subss	%xmm3, %xmm1	# D.6037, D.6037
	movss	%xmm1, 52(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_644 + 48B].i
	addss	52(%r15), %xmm0	# MEM[(struct kiss_fft_cpx *)fout_648 + 48B].i, D.6037
	movss	%xmm2, 48(%r15)	# D.6037, MEM[(struct kiss_fft_cpx *)fout_648 + 48B].r
# SUCC: 26 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	%xmm0, 52(%r15)	# D.6037, MEM[(struct kiss_fft_cpx *)fout_648 + 48B].i
# BLOCK 26 freq:500 seq:24
# PRED: 25 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 24 [25.0%]  (CAN_FALLTHRU) 17 [33.3%]  (CAN_FALLTHRU) 19 [25.0%]  (CAN_FALLTHRU) 20 [25.0%]  (CAN_FALLTHRU) 21 [25.0%]  (CAN_FALLTHRU) 22 [25.0%]  (CAN_FALLTHRU) 23 [25.0%]  (CAN_FALLTHRU) 36 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT) 56 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
.L215:
	addq	$56, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%] 
	ret
# BLOCK 27 freq:350 seq:25
# PRED: 3 [28.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L324:
	.cfi_restore_state
# SUCC: 28 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rdx, %rax	# fout, fout
# BLOCK 28 freq:3889 seq:26
# PRED: 27 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 28 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L241:
	movq	(%r14), %rdx	# MEM[base: fin_229, offset: 0B], MEM[base: fin_229, offset: 0B]
	addq	$8, %rax	#, fout
	addq	$8, %r14	#, fin
	movq	%rdx, -8(%rax)	# MEM[base: fin_229, offset: 0B], MEM[base: fout_230, offset: 0B]
	cmpq	%rax, %r12	# fout, Fout_end
# SUCC: 28 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 29 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L241	#,
# BLOCK 29 freq:350 seq:27
# PRED: 28 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$3, 16(%rsp)	#, %sfp
# SUCC: 30 [20.0%]  (FALLTHRU,CAN_FALLTHRU) 7 [80.0%]  (CAN_FALLTHRU)
	jne	.L326	#,
# BLOCK 30 freq:250 seq:28
# PRED: 6 [20.0%]  (CAN_FALLTHRU) 29 [20.0%]  (FALLTHRU,CAN_FALLTHRU)
.L243:
	movslq	28(%rsp), %rbp	# %sfp, m
	movsd	.LC2(%rip), %xmm6	#, tmp1277
	leaq	0(,%rbp,8), %rdx	#, D.6036
	movss	268(%rbx,%rbp,8), %xmm7	# MEM[(struct  *)_286 + 4B], epi3$i
	addq	$264, %rbx	#, tw2
	leaq	(%r15,%rdx), %rax	#, ivtmp.585
	movq	%rbx, %rcx	# tw2, tw2
# SUCC: 31 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	addq	%rax, %rdx	# ivtmp.585, ivtmp.588
# BLOCK 31 freq:2778 seq:29
# PRED: 30 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 31 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L259:
	movss	(%rax), %xmm2	# MEM[base: _584, offset: 0B], D.6037
	addq	$8, %rbx	#, tw2
	addq	$16, %rcx	#, tw2
	addq	$8, %r15	#, fout
	movss	4(%rax), %xmm3	# MEM[base: _584, offset: 4B], D.6037
	addq	$8, %rdx	#, ivtmp.588
	addq	$8, %rax	#, ivtmp.585
	movss	-8(%rbx), %xmm4	# MEM[base: tw2_293, offset: 0B], D.6037
	movaps	%xmm2, %xmm1	# D.6037, D.6037
	movss	-4(%rbx), %xmm0	# MEM[base: tw2_293, offset: 4B], D.6037
	movaps	%xmm3, %xmm5	# D.6037, D.6037
	mulss	%xmm4, %xmm1	# D.6037, D.6037
	mulss	%xmm0, %xmm5	# D.6037, D.6037
	mulss	%xmm4, %xmm3	# D.6037, D.6037
	movss	-16(%rcx), %xmm4	# MEM[base: tw2_306, offset: 0B], D.6037
	mulss	%xmm0, %xmm2	# D.6037, D.6037
	movss	-12(%rcx), %xmm0	# MEM[base: tw2_306, offset: 4B], D.6037
	subss	%xmm5, %xmm1	# D.6037, D.6037
	movss	-8(%rdx), %xmm5	# MEM[base: _576, offset: 0B], D.6037
	addss	%xmm3, %xmm2	# D.6037, D.6037
	movss	-4(%rdx), %xmm3	# MEM[base: _576, offset: 4B], D.6037
	movaps	%xmm5, %xmm8	# D.6037, D.6037
	mulss	%xmm4, %xmm8	# D.6037, D.6037
	movaps	%xmm3, %xmm9	# D.6037, D.6037
	mulss	%xmm0, %xmm9	# D.6037, D.6037
	mulss	%xmm4, %xmm3	# D.6037, D.6037
	movaps	%xmm1, %xmm4	# D.6037, D.6037
	mulss	%xmm5, %xmm0	# D.6037, D.6037
	pxor	%xmm5, %xmm5	# D.6042
	cvtss2sd	-8(%r15), %xmm5	# MEM[base: fout_290, offset: 0B], D.6042
	subss	%xmm9, %xmm8	# D.6037, D.6037
	pxor	%xmm9, %xmm9	# D.6042
	addss	%xmm3, %xmm0	# D.6037, D.6037
	movaps	%xmm2, %xmm3	# D.6037, D.6037
	addss	%xmm8, %xmm4	# D.6037, D.6037
	subss	%xmm8, %xmm1	# D.6037, D.6037
	addss	%xmm0, %xmm3	# D.6037, D.6037
	cvtss2sd	%xmm4, %xmm9	# D.6037, D.6042
	mulsd	%xmm6, %xmm9	# tmp1277, D.6042
	subss	%xmm0, %xmm2	# D.6037, D.6037
	mulss	%xmm7, %xmm1	# epi3$i, D.6037
	movaps	%xmm2, %xmm0	# D.6037, D.6037
	mulss	%xmm7, %xmm0	# epi3$i, D.6037
	subsd	%xmm9, %xmm5	# D.6042, D.6042
	pxor	%xmm9, %xmm9	# D.6042
	cvtss2sd	%xmm3, %xmm9	# D.6037, D.6042
	mulsd	%xmm6, %xmm9	# tmp1277, D.6042
	cvtsd2ss	%xmm5, %xmm5	# D.6042, tmp1525
	movss	%xmm5, -8(%rax)	# tmp1525, MEM[base: _584, offset: 0B]
	pxor	%xmm5, %xmm5	# D.6042
	cvtss2sd	-4(%r15), %xmm5	# MEM[base: fout_290, offset: 4B], D.6042
	subsd	%xmm9, %xmm5	# D.6042, D.6042
	cvtsd2ss	%xmm5, %xmm5	# D.6042, tmp1526
	movss	%xmm5, -4(%rax)	# tmp1526, MEM[base: _584, offset: 4B]
	addss	-8(%r15), %xmm4	# MEM[base: fout_290, offset: 0B], D.6037
	addss	-4(%r15), %xmm3	# MEM[base: fout_290, offset: 4B], D.6037
	movss	%xmm4, -8(%r15)	# D.6037, MEM[base: fout_290, offset: 0B]
	movss	%xmm3, -4(%r15)	# D.6037, MEM[base: fout_290, offset: 4B]
	movss	-8(%rax), %xmm2	# MEM[base: _584, offset: 0B], D.6037
	addss	%xmm0, %xmm2	# D.6037, D.6037
	movss	%xmm2, -8(%rdx)	# D.6037, MEM[base: _576, offset: 0B]
	movss	-4(%rax), %xmm2	# MEM[base: _584, offset: 4B], MEM[base: _584, offset: 4B]
	subss	%xmm1, %xmm2	# D.6037, D.6037
	movss	%xmm2, -4(%rdx)	# D.6037, MEM[base: _576, offset: 4B]
	movss	-8(%rax), %xmm2	# MEM[base: _584, offset: 0B], MEM[base: _584, offset: 0B]
	addss	-4(%rax), %xmm1	# MEM[base: _584, offset: 4B], D.6037
	subss	%xmm0, %xmm2	# D.6037, D.6037
	movss	%xmm1, -4(%rax)	# D.6037, MEM[base: _584, offset: 4B]
	movss	%xmm2, -8(%rax)	# D.6037, MEM[base: _584, offset: 0B]
	subq	$1, %rbp	#, m
# SUCC: 31 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 32 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L259	#,
# BLOCK 32 freq:250 seq:30
# PRED: 31 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	addq	$56, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%] 
	ret
# BLOCK 33 freq:250 seq:31
# PRED: 11 [33.3%]  (CAN_FALLTHRU) 9 [33.3%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L242:
	.cfi_restore_state
	movl	28(%rsp), %ecx	# %sfp,
	addq	$56, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbx, %rdx	# cfg,
	movq	%r15, %rdi	# fout,
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	movl	$1, %esi	#,
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	kf_bfly_generic	#
# BLOCK 34 freq:250 seq:32
# PRED: 8 [40.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L246:
	.cfi_restore_state
	movslq	28(%rsp), %rbp	# %sfp, k
	leaq	264(%rbx), %rsi	#, tw3
	movl	4(%rbx), %r9d	# cfg_2(D)->inverse, D.6035
	movq	%rsi, %r8	# tw3, tw3
	movq	%rsi, %rdi	# tw3, tw3
	leaq	0(,%rbp,8), %rax	#, D.6036
	leaq	(%r15,%rax), %rcx	#, ivtmp.608
	leaq	(%rcx,%rax), %rdx	#, ivtmp.611
	addq	%rdx, %rax	# ivtmp.611, ivtmp.614
# SUCC: 37 [100.0%]  (CAN_FALLTHRU)
	jmp	.L263	#
# BLOCK 35 freq:1389 seq:33
# PRED: 37 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L327:
	subss	%xmm5, %xmm0	# D.6037, D.6037
	addss	%xmm5, %xmm3	# D.6037, D.6037
	movss	%xmm0, (%rcx)	# D.6037, MEM[base: _1193, offset: 0B]
	movaps	%xmm9, %xmm0	# D.6037, D.6037
	subss	%xmm6, %xmm9	# D.6037, D.6037
	addss	%xmm6, %xmm0	# D.6037, D.6037
	movss	%xmm0, 4(%rcx)	# D.6037, MEM[base: _1193, offset: 4B]
	movss	%xmm3, (%rax)	# D.6037, MEM[base: _1197, offset: 0B]
# SUCC: 36 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	%xmm9, 4(%rax)	# D.6037, MEM[base: _1197, offset: 4B]
# BLOCK 36 freq:2778 seq:34
# PRED: 35 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 38 [100.0%]  (CAN_FALLTHRU)
.L262:
	addq	$8, %r15	#, fout
	addq	$8, %rcx	#, ivtmp.608
	addq	$8, %rdx	#, ivtmp.611
	addq	$8, %rax	#, ivtmp.614
	subq	$1, %rbp	#, k
# SUCC: 37 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 26 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	je	.L215	#,
# BLOCK 37 freq:2778 seq:35
# PRED: 36 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 34 [100.0%]  (CAN_FALLTHRU)
.L263:
	movss	(%rcx), %xmm5	# MEM[base: _1193, offset: 0B], D.6037
	addq	$8, %rsi	#, tw3
	addq	$16, %rdi	#, tw3
	addq	$24, %r8	#, tw3
	movss	4(%rcx), %xmm0	# MEM[base: _1193, offset: 4B], D.6037
	movss	-8(%rsi), %xmm1	# MEM[base: tw3_360, offset: 0B], D.6037
	movaps	%xmm5, %xmm6	# D.6037, D.6037
	movss	-4(%rsi), %xmm2	# MEM[base: tw3_360, offset: 4B], D.6037
	movaps	%xmm0, %xmm3	# D.6037, D.6037
	mulss	%xmm1, %xmm6	# D.6037, D.6037
	movss	(%rdx), %xmm4	# MEM[base: _1195, offset: 0B], D.6037
	mulss	%xmm2, %xmm3	# D.6037, D.6037
	mulss	%xmm1, %xmm0	# D.6037, D.6037
	movss	-12(%rdi), %xmm1	# MEM[base: tw3_373, offset: 4B], D.6037
	movaps	%xmm4, %xmm7	# D.6037, D.6037
	mulss	%xmm2, %xmm5	# D.6037, D.6037
	movss	-24(%r8), %xmm2	# MEM[base: tw3_386, offset: 0B], D.6037
	mulss	%xmm1, %xmm4	# D.6037, D.6037
	subss	%xmm3, %xmm6	# D.6037, D.6037
	movss	-16(%rdi), %xmm3	# MEM[base: tw3_373, offset: 0B], D.6037
	addss	%xmm0, %xmm5	# D.6037, D.6037
	movss	4(%rdx), %xmm0	# MEM[base: _1195, offset: 4B], D.6037
	mulss	%xmm3, %xmm7	# D.6037, D.6037
	movaps	%xmm0, %xmm8	# D.6037, D.6037
	mulss	%xmm3, %xmm0	# D.6037, D.6037
	movss	(%rax), %xmm3	# MEM[base: _1197, offset: 0B], D.6037
	mulss	%xmm1, %xmm8	# D.6037, D.6037
	movss	4(%rax), %xmm1	# MEM[base: _1197, offset: 4B], D.6037
	movaps	%xmm1, %xmm9	# D.6037, D.6037
	addss	%xmm0, %xmm4	# D.6037, D.6037
	movss	-20(%r8), %xmm0	# MEM[base: tw3_386, offset: 4B], D.6037
	mulss	%xmm2, %xmm1	# D.6037, D.6037
	subss	%xmm8, %xmm7	# D.6037, D.6037
	movaps	%xmm3, %xmm8	# D.6037, D.6037
	mulss	%xmm0, %xmm9	# D.6037, D.6037
	mulss	%xmm3, %xmm0	# D.6037, D.6037
	mulss	%xmm2, %xmm8	# D.6037, D.6037
	movss	(%r15), %xmm2	# MEM[base: fout_357, offset: 0B], D.6037
	movaps	%xmm2, %xmm3	# D.6037, D.6037
	addss	%xmm7, %xmm2	# D.6037, D.6037
	addss	%xmm1, %xmm0	# D.6037, D.6037
	movss	4(%r15), %xmm1	# MEM[base: fout_357, offset: 4B], D.6037
	subss	%xmm9, %xmm8	# D.6037, D.6037
	movaps	%xmm1, %xmm9	# D.6037, D.6037
	subss	%xmm7, %xmm3	# D.6037, D.6037
	movaps	%xmm6, %xmm7	# D.6037, D.6037
	movss	%xmm2, (%r15)	# D.6037, MEM[base: fout_357, offset: 0B]
	addss	%xmm4, %xmm1	# D.6037, D.6037
	subss	%xmm4, %xmm9	# D.6037, D.6037
	movaps	%xmm5, %xmm4	# D.6037, D.6037
	addss	%xmm0, %xmm4	# D.6037, D.6037
	addss	%xmm8, %xmm7	# D.6037, D.6037
	movss	%xmm1, 4(%r15)	# D.6037, MEM[base: fout_357, offset: 4B]
	subss	%xmm0, %xmm5	# D.6037, D.6037
	movaps	%xmm3, %xmm0	# D.6037, D.6037
	subss	%xmm4, %xmm1	# D.6037, D.6037
	subss	%xmm7, %xmm2	# D.6037, D.6037
	subss	%xmm8, %xmm6	# D.6037, D.6037
	movss	%xmm1, 4(%rdx)	# D.6037, MEM[base: _1195, offset: 4B]
	movss	%xmm2, (%rdx)	# D.6037, MEM[base: _1195, offset: 0B]
	addss	(%r15), %xmm7	# MEM[base: fout_357, offset: 0B], D.6037
	addss	4(%r15), %xmm4	# MEM[base: fout_357, offset: 4B], D.6037
	movss	%xmm7, (%r15)	# D.6037, MEM[base: fout_357, offset: 0B]
	movss	%xmm4, 4(%r15)	# D.6037, MEM[base: fout_357, offset: 4B]
	testl	%r9d, %r9d	# D.6035
# SUCC: 35 [50.0%]  (CAN_FALLTHRU) 38 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L327	#,
# BLOCK 38 freq:1389 seq:36
# PRED: 37 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	addss	%xmm5, %xmm0	# D.6037, D.6037
	subss	%xmm5, %xmm3	# D.6037, D.6037
	movss	%xmm0, (%rcx)	# D.6037, MEM[base: _1193, offset: 0B]
	movaps	%xmm9, %xmm0	# D.6037, D.6037
	subss	%xmm6, %xmm0	# D.6037, D.6037
	addss	%xmm9, %xmm6	# D.6037, D.6037
	movss	%xmm0, 4(%rcx)	# D.6037, MEM[base: _1193, offset: 4B]
	movss	%xmm3, (%rax)	# D.6037, MEM[base: _1197, offset: 0B]
	movss	%xmm6, 4(%rax)	# D.6037, MEM[base: _1197, offset: 4B]
# SUCC: 36 [100.0%]  (CAN_FALLTHRU)
	jmp	.L262	#
# BLOCK 39 freq:141 seq:37
# PRED: 2 [10.1%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L323:
	movslq	(%rdi), %rdi	# cfg_2(D)->nfft, D.6036
	salq	$3, %rdi	#, D.6036
	call	malloc	#
	movl	8(%rbx), %esi	# MEM[(int *)cfg_2(D) + 8B], p
	movl	12(%rbx), %edi	# MEM[(int *)cfg_2(D) + 12B], m
	movq	%rax, %rcx	#, Fout
	movq	%rax, 16(%rsp)	# Fout, %sfp
	movl	%esi, 28(%rsp)	# p, %sfp
	imull	%edi, %esi	# m, D.6035
	movl	%edi, 32(%rsp)	# m, %sfp
	movslq	%esi, %rax	# D.6035,
	movq	%rcx, %rsi	# Fout, Fout
	leaq	(%rcx,%rax,8), %r13	#, Fout_end
	cmpl	$1, %edi	#, m
# SUCC: 72 [28.0%]  (CAN_FALLTHRU) 40 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L328	#,
# BLOCK 40 freq:102 seq:38
# PRED: 39 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	movslq	28(%rsp), %rax	# %sfp, D.6036
	leaq	16(%rbx), %rbp	#, factors
	movq	%r14, 40(%rsp)	# fin, %sfp
	movslq	32(%rsp), %r12	# %sfp, D.6036
	movq	%rbp, %r15	# factors, factors
	movq	%rax, 8(%rsp)	# D.6036, %sfp
	leaq	0(,%r12,8), %rax	#, D.6036
	movq	%r14, %r12	# fin, fin
	movq	%rsi, %r14	# Fout, Fout
	movq	%r12, %rbp	# fin, fin
# SUCC: 41 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, %r12	# D.6036, D.6036
# BLOCK 41 freq:1128 seq:39
# PRED: 40 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 41 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L224:
	movq	8(%rsp), %rdx	# %sfp,
	movq	%rbp, %rsi	# fin,
	movq	%r14, %rdi	# Fout,
	movq	%rbx, %r9	# cfg,
	movq	%r15, %r8	# factors,
	movl	$1, %ecx	#,
	addq	%r12, %r14	# D.6036, Fout
	addq	$8, %rbp	#, fin
	call	kf_work	#
	cmpq	%r14, %r13	# Fout, Fout_end
# SUCC: 41 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 42 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L224	#,
# BLOCK 42 freq:102 seq:40
# PRED: 41 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
# SUCC: 43 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	40(%rsp), %r14	# %sfp, fin
# BLOCK 43 freq:142 seq:41
# PRED: 42 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 72 [100.0%]  (CAN_FALLTHRU)
.L225:
	cmpl	$3, 28(%rsp)	#, %sfp
# SUCC: 73 [20.0%]  (CAN_FALLTHRU) 44 [80.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L219	#,
# BLOCK 44 freq:114 seq:42
# PRED: 43 [80.0%]  (FALLTHRU,CAN_FALLTHRU)
# SUCC: 45 [62.5%]  (FALLTHRU,CAN_FALLTHRU) 57 [37.5%]  (CAN_FALLTHRU)
	jle	.L329	#,
# BLOCK 45 freq:71 seq:43
# PRED: 44 [62.5%]  (FALLTHRU,CAN_FALLTHRU)
	movl	28(%rsp), %eax	# %sfp, p
	cmpl	$4, %eax	#, p
# SUCC: 49 [40.0%]  (CAN_FALLTHRU) 46 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L222	#,
# BLOCK 46 freq:43 seq:44
# PRED: 45 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%eax, %r8d	# p,
	cmpl	$5, %eax	#, p
# SUCC: 76 [33.3%]  (CAN_FALLTHRU) 47 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L218	#,
# BLOCK 47 freq:28 seq:45
# PRED: 46 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movl	32(%rsp), %ecx	# %sfp,
	movq	%rbx, %rdx	# cfg,
	movl	$1, %esi	#,
	movq	16(%rsp), %rdi	# %sfp,
# SUCC: 48 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	call	kf_bfly5	#
# BLOCK 48 freq:141 seq:46
# PRED: 71 [100.0%]  (CAN_FALLTHRU) 76 [100.0%]  (CAN_FALLTHRU) 75 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT) 70 [25.0%]  (CAN_FALLTHRU) 63 [33.3%]  (CAN_FALLTHRU) 65 [25.0%]  (CAN_FALLTHRU) 66 [25.0%]  (CAN_FALLTHRU) 67 [25.0%]  (CAN_FALLTHRU) 68 [25.0%]  (CAN_FALLTHRU) 69 [25.0%]  (CAN_FALLTHRU) 51 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT) 47 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 80 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
.L234:
	movslq	(%rbx), %rdx	# cfg_2(D)->nfft, D.6036
	movq	%r14, %rdi	# fin,
	movq	16(%rsp), %rbx	# %sfp, Fout
	salq	$3, %rdx	#, D.6036
	movq	%rbx, %rsi	# Fout,
	call	memcpy	#
	addq	$56, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbx, %rdi	# Fout,
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	free	#
# BLOCK 49 freq:28 seq:47
# PRED: 45 [40.0%]  (CAN_FALLTHRU)
.L222:
	.cfi_restore_state
	movslq	32(%rsp), %r15	# %sfp, k
	leaq	264(%rbx), %rdi	#, tw3
	movq	16(%rsp), %rax	# %sfp, Fout
	movq	%rdi, %r9	# tw3, tw3
	movq	%rdi, %r8	# tw3, tw3
	movl	4(%rbx), %r11d	# cfg_2(D)->inverse, D.6035
	leaq	0(,%r15,8), %rdx	#, D.6036
	leaq	(%rax,%rdx), %rsi	#, ivtmp.522
	leaq	(%rsi,%rdx), %rcx	#, ivtmp.525
	addq	%rcx, %rdx	# ivtmp.525, ivtmp.528
# SUCC: 52 [100.0%]  (CAN_FALLTHRU)
	jmp	.L239	#
# BLOCK 50 freq:157 seq:48
# PRED: 52 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L330:
	subss	%xmm5, %xmm0	# D.6037, D.6037
	addss	%xmm5, %xmm3	# D.6037, D.6037
	movss	%xmm0, (%rsi)	# D.6037, MEM[base: _1151, offset: 0B]
	movaps	%xmm9, %xmm0	# D.6037, D.6037
	subss	%xmm6, %xmm9	# D.6037, D.6037
	addss	%xmm6, %xmm0	# D.6037, D.6037
	movss	%xmm0, 4(%rsi)	# D.6037, MEM[base: _1151, offset: 4B]
	movss	%xmm3, (%rdx)	# D.6037, MEM[base: _1155, offset: 0B]
# SUCC: 51 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	%xmm9, 4(%rdx)	# D.6037, MEM[base: _1155, offset: 4B]
# BLOCK 51 freq:313 seq:49
# PRED: 50 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 53 [100.0%]  (CAN_FALLTHRU)
.L238:
	addq	$8, %rax	#, Fout
	addq	$8, %rsi	#, ivtmp.522
	addq	$8, %rcx	#, ivtmp.525
	addq	$8, %rdx	#, ivtmp.528
	subq	$1, %r15	#, k
# SUCC: 52 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 48 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	je	.L234	#,
# BLOCK 52 freq:313 seq:50
# PRED: 51 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 49 [100.0%]  (CAN_FALLTHRU)
.L239:
	movss	(%rsi), %xmm5	# MEM[base: _1151, offset: 0B], D.6037
	addq	$8, %rdi	#, tw3
	addq	$16, %r8	#, tw3
	addq	$24, %r9	#, tw3
	movss	4(%rsi), %xmm0	# MEM[base: _1151, offset: 4B], D.6037
	movss	-8(%rdi), %xmm1	# MEM[base: tw3_152, offset: 0B], D.6037
	movaps	%xmm5, %xmm6	# D.6037, D.6037
	movss	-4(%rdi), %xmm2	# MEM[base: tw3_152, offset: 4B], D.6037
	movaps	%xmm0, %xmm3	# D.6037, D.6037
	mulss	%xmm1, %xmm6	# D.6037, D.6037
	movss	(%rcx), %xmm4	# MEM[base: _1153, offset: 0B], D.6037
	mulss	%xmm2, %xmm3	# D.6037, D.6037
	mulss	%xmm1, %xmm0	# D.6037, D.6037
	movss	-12(%r8), %xmm1	# MEM[base: tw3_165, offset: 4B], D.6037
	movaps	%xmm4, %xmm7	# D.6037, D.6037
	mulss	%xmm2, %xmm5	# D.6037, D.6037
	movss	-24(%r9), %xmm2	# MEM[base: tw3_178, offset: 0B], D.6037
	mulss	%xmm1, %xmm4	# D.6037, D.6037
	subss	%xmm3, %xmm6	# D.6037, D.6037
	movss	-16(%r8), %xmm3	# MEM[base: tw3_165, offset: 0B], D.6037
	addss	%xmm0, %xmm5	# D.6037, D.6037
	movss	4(%rcx), %xmm0	# MEM[base: _1153, offset: 4B], D.6037
	mulss	%xmm3, %xmm7	# D.6037, D.6037
	movaps	%xmm0, %xmm8	# D.6037, D.6037
	mulss	%xmm3, %xmm0	# D.6037, D.6037
	movss	(%rdx), %xmm3	# MEM[base: _1155, offset: 0B], D.6037
	mulss	%xmm1, %xmm8	# D.6037, D.6037
	movss	4(%rdx), %xmm1	# MEM[base: _1155, offset: 4B], D.6037
	movaps	%xmm1, %xmm9	# D.6037, D.6037
	addss	%xmm0, %xmm4	# D.6037, D.6037
	movss	-20(%r9), %xmm0	# MEM[base: tw3_178, offset: 4B], D.6037
	mulss	%xmm2, %xmm1	# D.6037, D.6037
	subss	%xmm8, %xmm7	# D.6037, D.6037
	movaps	%xmm3, %xmm8	# D.6037, D.6037
	mulss	%xmm0, %xmm9	# D.6037, D.6037
	mulss	%xmm3, %xmm0	# D.6037, D.6037
	mulss	%xmm2, %xmm8	# D.6037, D.6037
	movss	(%rax), %xmm2	# MEM[base: Fout_149, offset: 0B], D.6037
	movaps	%xmm2, %xmm3	# D.6037, D.6037
	addss	%xmm7, %xmm2	# D.6037, D.6037
	addss	%xmm1, %xmm0	# D.6037, D.6037
	movss	4(%rax), %xmm1	# MEM[base: Fout_149, offset: 4B], D.6037
	subss	%xmm9, %xmm8	# D.6037, D.6037
	movaps	%xmm1, %xmm9	# D.6037, D.6037
	subss	%xmm7, %xmm3	# D.6037, D.6037
	movaps	%xmm6, %xmm7	# D.6037, D.6037
	movss	%xmm2, (%rax)	# D.6037, MEM[base: Fout_149, offset: 0B]
	addss	%xmm4, %xmm1	# D.6037, D.6037
	subss	%xmm4, %xmm9	# D.6037, D.6037
	movaps	%xmm5, %xmm4	# D.6037, D.6037
	addss	%xmm0, %xmm4	# D.6037, D.6037
	addss	%xmm8, %xmm7	# D.6037, D.6037
	movss	%xmm1, 4(%rax)	# D.6037, MEM[base: Fout_149, offset: 4B]
	subss	%xmm0, %xmm5	# D.6037, D.6037
	movaps	%xmm3, %xmm0	# D.6037, D.6037
	subss	%xmm4, %xmm1	# D.6037, D.6037
	subss	%xmm7, %xmm2	# D.6037, D.6037
	subss	%xmm8, %xmm6	# D.6037, D.6037
	movss	%xmm1, 4(%rcx)	# D.6037, MEM[base: _1153, offset: 4B]
	movss	%xmm2, (%rcx)	# D.6037, MEM[base: _1153, offset: 0B]
	addss	(%rax), %xmm7	# MEM[base: Fout_149, offset: 0B], D.6037
	addss	4(%rax), %xmm4	# MEM[base: Fout_149, offset: 4B], D.6037
	movss	%xmm7, (%rax)	# D.6037, MEM[base: Fout_149, offset: 0B]
	movss	%xmm4, 4(%rax)	# D.6037, MEM[base: Fout_149, offset: 4B]
	testl	%r11d, %r11d	# D.6035
# SUCC: 50 [50.0%]  (CAN_FALLTHRU) 53 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L330	#,
# BLOCK 53 freq:157 seq:51
# PRED: 52 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	addss	%xmm5, %xmm0	# D.6037, D.6037
	subss	%xmm5, %xmm3	# D.6037, D.6037
	movss	%xmm0, (%rsi)	# D.6037, MEM[base: _1151, offset: 0B]
	movaps	%xmm9, %xmm0	# D.6037, D.6037
	subss	%xmm6, %xmm0	# D.6037, D.6037
	addss	%xmm9, %xmm6	# D.6037, D.6037
	movss	%xmm0, 4(%rsi)	# D.6037, MEM[base: _1151, offset: 4B]
	movss	%xmm3, (%rdx)	# D.6037, MEM[base: _1155, offset: 0B]
	movss	%xmm6, 4(%rdx)	# D.6037, MEM[base: _1155, offset: 4B]
# SUCC: 51 [100.0%]  (CAN_FALLTHRU)
	jmp	.L238	#
# BLOCK 54 freq:50 seq:52
# PRED: 13 [11.1%]  (CAN_FALLTHRU) 12 [10.0%]  (CAN_FALLTHRU)
.L250:
	movl	28(%rsp), %ebx	# %sfp, m
	leal	-1(%rbx), %ecx	#, D.6041
# SUCC: 55 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	8(%rdx,%rcx,8), %rcx	#, D.6040
# BLOCK 55 freq:556 seq:53
# PRED: 54 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 55 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L256:
	movss	(%rdx), %xmm0	# MEM[base: tw1_716, offset: 0B], D.6037
	addq	$8, %rdx	#, tw1
	addq	$8, %rax	#, Fout2
	addq	$8, %r15	#, fout
	movss	-4(%rdx), %xmm2	# MEM[base: tw1_716, offset: 4B], D.6037
	movss	-8(%rax), %xmm1	# MEM[base: Fout2_717, offset: 0B], D.6037
	movaps	%xmm0, %xmm4	# D.6037, D.6037
	movss	-4(%rax), %xmm3	# MEM[base: Fout2_717, offset: 4B], D.6037
	movaps	%xmm2, %xmm5	# D.6037, D.6037
	mulss	%xmm1, %xmm4	# D.6037, D.6037
	mulss	%xmm3, %xmm5	# D.6037, D.6037
	mulss	%xmm2, %xmm1	# D.6037, D.6037
	mulss	%xmm3, %xmm0	# D.6037, D.6037
	subss	%xmm5, %xmm4	# D.6037, D.6037
	addss	%xmm1, %xmm0	# D.6037, D.6037
	movss	-8(%r15), %xmm1	# MEM[base: fout_719, offset: 0B], MEM[base: fout_719, offset: 0B]
	subss	%xmm4, %xmm1	# D.6037, D.6037
	movss	%xmm1, -8(%rax)	# D.6037, MEM[base: Fout2_717, offset: 0B]
	movss	-4(%r15), %xmm1	# MEM[base: fout_719, offset: 4B], MEM[base: fout_719, offset: 4B]
	subss	%xmm0, %xmm1	# D.6037, D.6037
	movss	%xmm1, -4(%rax)	# D.6037, MEM[base: Fout2_717, offset: 4B]
	addss	-8(%r15), %xmm4	# MEM[base: fout_719, offset: 0B], D.6037
	addss	-4(%r15), %xmm0	# MEM[base: fout_719, offset: 4B], D.6037
	movss	%xmm4, -8(%r15)	# D.6037, MEM[base: fout_719, offset: 0B]
	movss	%xmm0, -4(%r15)	# D.6037, MEM[base: fout_719, offset: 4B]
	cmpq	%rcx, %rdx	# D.6040, tw1
# SUCC: 55 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 56 [9.0%]  (FALLTHRU)
	jne	.L256	#,
# BLOCK 56 freq:50 seq:54
# PRED: 55 [9.0%]  (FALLTHRU)
# SUCC: 26 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	jmp	.L215	#
# BLOCK 57 freq:43 seq:55
# PRED: 44 [37.5%]  (CAN_FALLTHRU)
.L329:
	cmpl	$2, 28(%rsp)	#, %sfp
	movl	28(%rsp), %r8d	# %sfp,
# SUCC: 76 [33.3%]  (CAN_FALLTHRU) 58 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L218	#,
# BLOCK 58 freq:28 seq:56
# PRED: 57 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movl	32(%rsp), %edi	# %sfp, m
	leaq	264(%rbx), %rcx	#, tw1
	movq	16(%rsp), %r10	# %sfp, Fout
	movslq	%edi, %rdx	# m,
	movl	%edi, %r8d	# m, D.6038
	salq	$3, %rdx	#, D.6036
	movq	%r10, %rax	# Fout, Fout
	movq	%r10, %rsi	# Fout, Fout
	addq	%rdx, %rax	# D.6036, Fout2
	addq	$32, %rsi	#, D.6040
	cmpq	%rsi, %rax	# D.6040, Fout2
	setnb	%sil	#, D.6039
	addq	$32, %rdx	#, D.6036
	testq	%rdx, %rdx	# D.6036
	setle	%dl	#, D.6039
	orb	%dl, %sil	# D.6039, tmp1364
# SUCC: 78 [10.0%]  (CAN_FALLTHRU) 59 [90.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L226	#,
# BLOCK 59 freq:25 seq:57
# PRED: 58 [90.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$3, %edi	#, m
# SUCC: 78 [11.1%]  (CAN_FALLTHRU) 60 [88.9%]  (FALLTHRU,CAN_FALLTHRU)
	jbe	.L226	#,
# BLOCK 60 freq:22 seq:58
# PRED: 59 [88.9%]  (FALLTHRU,CAN_FALLTHRU)
	leal	-1(%r8), %esi	#, m
	subl	$5, %edi	#, D.6038
	shrl	$2, %edi	#, D.6038
	addl	$1, %edi	#, bnd.380
	leal	0(,%rdi,4), %r11d	#, ratio_mult_vf.381
	cmpl	$3, %esi	#, m
# SUCC: 61 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 77 [33.3%]  (CAN_FALLTHRU)
	jbe	.L264	#,
# BLOCK 61 freq:15 seq:59
# PRED: 60 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%r10, %rsi	# Fout, ivtmp.474
	xorl	%edx, %edx	# ivtmp.473
# SUCC: 62 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	xorl	%r9d, %r9d	# ivtmp.469
# BLOCK 62 freq:30 seq:60
# PRED: 61 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 62 [50.0%]  (DFS_BACK,CAN_FALLTHRU)
.L228:
	movups	(%rax,%rdx), %xmm0	# MEM[base: Fout2_48, index: ivtmp.473_637, offset: 0B], tmp877
	addl	$1, %r9d	#, ivtmp.469
	addq	$32, %rsi	#, ivtmp.474
	movups	16(%rax,%rdx), %xmm1	# MEM[base: Fout2_48, index: ivtmp.473_637, offset: 16B], tmp878
	movups	280(%rbx,%rdx), %xmm4	# MEM[base: cfg_2(D), index: ivtmp.473_637, offset: 280B], tmp880
	movaps	%xmm0, %xmm2	# tmp877, D.6043
	movups	264(%rbx,%rdx), %xmm3	# MEM[base: cfg_2(D), index: ivtmp.473_637, offset: 264B], tmp879
	shufps	$136, %xmm1, %xmm2	#, tmp878, D.6043
	shufps	$221, %xmm1, %xmm0	#, tmp878, D.6043
	movaps	%xmm3, %xmm1	# tmp879, D.6043
	shufps	$221, %xmm4, %xmm3	#, tmp880, D.6043
	movaps	%xmm3, %xmm5	# D.6043, vect__56.395
	shufps	$136, %xmm4, %xmm1	#, tmp880, D.6043
	mulps	%xmm0, %xmm5	# D.6043, vect__56.395
	movaps	%xmm1, %xmm4	# D.6043, vect__53.394
	mulps	%xmm1, %xmm0	# D.6043, vect__59.398
	mulps	%xmm2, %xmm4	# D.6043, vect__53.394
	mulps	%xmm3, %xmm2	# D.6043, vect__58.397
	movaps	%xmm0, %xmm1	# vect__59.398, vect__60.399
	movups	-32(%rsi), %xmm0	# MEM[base: _1133, offset: 0B], tmp885
	subps	%xmm5, %xmm4	# vect__56.395, vect__57.396
	movups	-16(%rsi), %xmm5	# MEM[base: _1133, offset: 16B], tmp886
	addps	%xmm2, %xmm1	# vect__58.397, vect__60.399
	movaps	%xmm0, %xmm2	# tmp885, D.6043
	shufps	$136, %xmm5, %xmm2	#, tmp886, D.6043
	movaps	%xmm2, %xmm3	# D.6043, vect__65.404
	shufps	$221, %xmm5, %xmm0	#, tmp886, D.6043
	movaps	%xmm0, %xmm5	# D.6043, vect__67.409
	subps	%xmm4, %xmm3	# vect__57.396, vect__65.404
	addps	%xmm4, %xmm2	# vect__57.396, vect__69.412
	subps	%xmm1, %xmm5	# vect__60.399, vect__67.409
	addps	%xmm1, %xmm0	# vect__60.399, vect__71.413
	movaps	%xmm3, %xmm6	# vect__65.404, D.6043
	movaps	%xmm2, %xmm1	# vect__69.412, D.6043
	unpcklps	%xmm5, %xmm6	# vect__67.409, D.6043
	unpckhps	%xmm5, %xmm3	# vect__67.409, D.6043
	movups	%xmm6, (%rax,%rdx)	# D.6043, MEM[base: Fout2_48, index: ivtmp.473_637, offset: 0B]
	movups	%xmm3, 16(%rax,%rdx)	# D.6043, MEM[base: Fout2_48, index: ivtmp.473_637, offset: 16B]
	unpcklps	%xmm0, %xmm1	# vect__71.413, D.6043
	unpckhps	%xmm0, %xmm2	# vect__71.413, D.6043
	addq	$32, %rdx	#, ivtmp.473
	movups	%xmm1, -32(%rsi)	# D.6043, MEM[base: _1133, offset: 0B]
	movups	%xmm2, -16(%rsi)	# D.6043, MEM[base: _1133, offset: 16B]
	cmpl	%r9d, %edi	# ivtmp.469, bnd.380
# SUCC: 62 [50.0%]  (DFS_BACK,CAN_FALLTHRU) 63 [50.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	ja	.L228	#,
# BLOCK 63 freq:15 seq:61
# PRED: 62 [50.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	movq	16(%rsp), %rdi	# %sfp, Fout
	movl	%r11d, %esi	# ratio_mult_vf.381, D.6041
	subl	%r11d, 32(%rsp)	# ratio_mult_vf.381, %sfp
	salq	$3, %rsi	#, D.6041
	addq	%rsi, %rax	# D.6041, Fout2
	addq	%rsi, %rcx	# D.6041, tw1
	leaq	(%rdi,%rsi), %rdx	#, Fout
	movl	32(%rsp), %edi	# %sfp, m
	cmpl	%r11d, %r8d	# ratio_mult_vf.381, D.6038
# SUCC: 64 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 48 [33.3%]  (CAN_FALLTHRU)
	je	.L234	#,
# BLOCK 64 freq:10 seq:62
# PRED: 63 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
# SUCC: 65 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leal	-1(%rdi), %esi	#, m
# BLOCK 65 freq:17 seq:63
# PRED: 64 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 77 [100.0%]  (CAN_FALLTHRU)
.L227:
	movss	4(%rcx), %xmm0	# tw1_829->i, D.6037
	movss	(%rax), %xmm1	# Fout2_831->r, D.6037
	movss	(%rcx), %xmm3	# tw1_829->r, D.6037
	movaps	%xmm0, %xmm5	# D.6037, D.6037
	movss	4(%rax), %xmm4	# Fout2_831->i, D.6037
	movaps	%xmm1, %xmm2	# D.6037, D.6037
	mulss	%xmm3, %xmm2	# D.6037, D.6037
	mulss	%xmm4, %xmm5	# D.6037, D.6037
	mulss	%xmm0, %xmm1	# D.6037, D.6037
	mulss	%xmm4, %xmm3	# D.6037, D.6037
	subss	%xmm5, %xmm2	# D.6037, D.6037
	addss	%xmm1, %xmm3	# D.6037, D.6037
	movss	(%rdx), %xmm1	# Fout_835->r, Fout_835->r
	subss	%xmm2, %xmm1	# D.6037, D.6037
	movaps	%xmm3, %xmm0	# D.6037, D.6037
	movss	%xmm1, (%rax)	# D.6037, Fout2_831->r
	movss	4(%rdx), %xmm1	# Fout_835->i, Fout_835->i
	addss	(%rdx), %xmm2	# Fout_835->r, D.6037
	subss	%xmm3, %xmm1	# D.6037, D.6037
	movss	%xmm1, 4(%rax)	# D.6037, Fout2_831->i
	addss	4(%rdx), %xmm0	# Fout_835->i, D.6037
	movss	%xmm2, (%rdx)	# D.6037, Fout_835->r
	movss	%xmm0, 4(%rdx)	# D.6037, Fout_835->i
	testl	%esi, %esi	# m
# SUCC: 66 [75.0%]  (FALLTHRU,CAN_FALLTHRU) 48 [25.0%]  (CAN_FALLTHRU)
	je	.L234	#,
# BLOCK 66 freq:17 seq:64
# PRED: 65 [75.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	8(%rax), %xmm4	# MEM[(struct kiss_fft_cpx *)Fout2_831 + 8B].r, D.6037
	movss	12(%rax), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout2_831 + 8B].i, D.6037
	movss	8(%rcx), %xmm0	# MEM[(struct kiss_fft_cpx *)tw1_829 + 8B].r, D.6037
	movaps	%xmm4, %xmm2	# D.6037, D.6037
	movss	12(%rcx), %xmm3	# MEM[(struct kiss_fft_cpx *)tw1_829 + 8B].i, D.6037
	movaps	%xmm1, %xmm5	# D.6037, D.6037
	mulss	%xmm0, %xmm2	# D.6037, D.6037
	movl	32(%rsp), %esi	# %sfp, m
	mulss	%xmm3, %xmm5	# D.6037, D.6037
	mulss	%xmm0, %xmm1	# D.6037, D.6037
	mulss	%xmm4, %xmm3	# D.6037, D.6037
	subss	%xmm5, %xmm2	# D.6037, D.6037
	addss	%xmm1, %xmm3	# D.6037, D.6037
	movss	8(%rdx), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_835 + 8B].r, MEM[(struct kiss_fft_cpx *)Fout_835 + 8B].r
	subss	%xmm2, %xmm1	# D.6037, D.6037
	movaps	%xmm3, %xmm0	# D.6037, D.6037
	movss	%xmm1, 8(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_831 + 8B].r
	movss	12(%rdx), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_835 + 8B].i, MEM[(struct kiss_fft_cpx *)Fout_835 + 8B].i
	addss	8(%rdx), %xmm2	# MEM[(struct kiss_fft_cpx *)Fout_835 + 8B].r, D.6037
	subss	%xmm3, %xmm1	# D.6037, D.6037
	movss	%xmm1, 12(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_831 + 8B].i
	addss	12(%rdx), %xmm0	# MEM[(struct kiss_fft_cpx *)Fout_835 + 8B].i, D.6037
	movss	%xmm2, 8(%rdx)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout_835 + 8B].r
	movss	%xmm0, 12(%rdx)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout_835 + 8B].i
	cmpl	$2, %esi	#, m
# SUCC: 67 [75.0%]  (FALLTHRU,CAN_FALLTHRU) 48 [25.0%]  (CAN_FALLTHRU)
	je	.L234	#,
# BLOCK 67 freq:17 seq:65
# PRED: 66 [75.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	16(%rax), %xmm4	# MEM[(struct kiss_fft_cpx *)Fout2_831 + 16B].r, D.6037
	movss	20(%rax), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout2_831 + 16B].i, D.6037
	movss	16(%rcx), %xmm0	# MEM[(struct kiss_fft_cpx *)tw1_829 + 16B].r, D.6037
	movaps	%xmm4, %xmm2	# D.6037, D.6037
	movss	20(%rcx), %xmm3	# MEM[(struct kiss_fft_cpx *)tw1_829 + 16B].i, D.6037
	movaps	%xmm1, %xmm5	# D.6037, D.6037
	mulss	%xmm0, %xmm2	# D.6037, D.6037
	mulss	%xmm3, %xmm5	# D.6037, D.6037
	mulss	%xmm0, %xmm1	# D.6037, D.6037
	mulss	%xmm4, %xmm3	# D.6037, D.6037
	subss	%xmm5, %xmm2	# D.6037, D.6037
	addss	%xmm1, %xmm3	# D.6037, D.6037
	movss	16(%rdx), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_835 + 16B].r, MEM[(struct kiss_fft_cpx *)Fout_835 + 16B].r
	subss	%xmm2, %xmm1	# D.6037, D.6037
	movaps	%xmm3, %xmm0	# D.6037, D.6037
	movss	%xmm1, 16(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_831 + 16B].r
	movss	20(%rdx), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_835 + 16B].i, MEM[(struct kiss_fft_cpx *)Fout_835 + 16B].i
	addss	16(%rdx), %xmm2	# MEM[(struct kiss_fft_cpx *)Fout_835 + 16B].r, D.6037
	subss	%xmm3, %xmm1	# D.6037, D.6037
	movss	%xmm1, 20(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_831 + 16B].i
	addss	20(%rdx), %xmm0	# MEM[(struct kiss_fft_cpx *)Fout_835 + 16B].i, D.6037
	movss	%xmm2, 16(%rdx)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout_835 + 16B].r
	movss	%xmm0, 20(%rdx)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout_835 + 16B].i
	cmpl	$3, %esi	#, m
# SUCC: 68 [75.0%]  (FALLTHRU,CAN_FALLTHRU) 48 [25.0%]  (CAN_FALLTHRU)
	je	.L234	#,
# BLOCK 68 freq:17 seq:66
# PRED: 67 [75.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	28(%rcx), %xmm0	# MEM[(struct kiss_fft_cpx *)tw1_829 + 24B].i, D.6037
	movss	24(%rcx), %xmm3	# MEM[(struct kiss_fft_cpx *)tw1_829 + 24B].r, D.6037
	movss	24(%rax), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout2_831 + 24B].r, D.6037
	movaps	%xmm0, %xmm5	# D.6037, D.6037
	movss	28(%rax), %xmm4	# MEM[(struct kiss_fft_cpx *)Fout2_831 + 24B].i, D.6037
	movaps	%xmm3, %xmm2	# D.6037, D.6037
	mulss	%xmm1, %xmm2	# D.6037, D.6037
	mulss	%xmm4, %xmm5	# D.6037, D.6037
	mulss	%xmm0, %xmm1	# D.6037, D.6037
	mulss	%xmm4, %xmm3	# D.6037, D.6037
	subss	%xmm5, %xmm2	# D.6037, D.6037
	addss	%xmm1, %xmm3	# D.6037, D.6037
	movss	24(%rdx), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_835 + 24B].r, MEM[(struct kiss_fft_cpx *)Fout_835 + 24B].r
	subss	%xmm2, %xmm1	# D.6037, D.6037
	movaps	%xmm3, %xmm0	# D.6037, D.6037
	movss	%xmm1, 24(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_831 + 24B].r
	movss	28(%rdx), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_835 + 24B].i, MEM[(struct kiss_fft_cpx *)Fout_835 + 24B].i
	addss	24(%rdx), %xmm2	# MEM[(struct kiss_fft_cpx *)Fout_835 + 24B].r, D.6037
	subss	%xmm3, %xmm1	# D.6037, D.6037
	movss	%xmm1, 28(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_831 + 24B].i
	addss	28(%rdx), %xmm0	# MEM[(struct kiss_fft_cpx *)Fout_835 + 24B].i, D.6037
	movss	%xmm2, 24(%rdx)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout_835 + 24B].r
	movss	%xmm0, 28(%rdx)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout_835 + 24B].i
	cmpl	$4, %esi	#, m
# SUCC: 69 [75.0%]  (FALLTHRU,CAN_FALLTHRU) 48 [25.0%]  (CAN_FALLTHRU)
	je	.L234	#,
# BLOCK 69 freq:17 seq:67
# PRED: 68 [75.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	36(%rcx), %xmm0	# MEM[(struct kiss_fft_cpx *)tw1_829 + 32B].i, D.6037
	movss	32(%rcx), %xmm3	# MEM[(struct kiss_fft_cpx *)tw1_829 + 32B].r, D.6037
	movss	32(%rax), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout2_831 + 32B].r, D.6037
	movaps	%xmm0, %xmm5	# D.6037, D.6037
	movss	36(%rax), %xmm4	# MEM[(struct kiss_fft_cpx *)Fout2_831 + 32B].i, D.6037
	movaps	%xmm3, %xmm2	# D.6037, D.6037
	mulss	%xmm1, %xmm2	# D.6037, D.6037
	mulss	%xmm4, %xmm5	# D.6037, D.6037
	mulss	%xmm0, %xmm1	# D.6037, D.6037
	mulss	%xmm4, %xmm3	# D.6037, D.6037
	subss	%xmm5, %xmm2	# D.6037, D.6037
	addss	%xmm1, %xmm3	# D.6037, D.6037
	movss	32(%rdx), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_835 + 32B].r, MEM[(struct kiss_fft_cpx *)Fout_835 + 32B].r
	subss	%xmm2, %xmm1	# D.6037, D.6037
	movaps	%xmm3, %xmm0	# D.6037, D.6037
	movss	%xmm1, 32(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_831 + 32B].r
	movss	36(%rdx), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_835 + 32B].i, MEM[(struct kiss_fft_cpx *)Fout_835 + 32B].i
	addss	32(%rdx), %xmm2	# MEM[(struct kiss_fft_cpx *)Fout_835 + 32B].r, D.6037
	subss	%xmm3, %xmm1	# D.6037, D.6037
	movss	%xmm1, 36(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_831 + 32B].i
	addss	36(%rdx), %xmm0	# MEM[(struct kiss_fft_cpx *)Fout_835 + 32B].i, D.6037
	movss	%xmm2, 32(%rdx)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout_835 + 32B].r
	movss	%xmm0, 36(%rdx)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout_835 + 32B].i
	cmpl	$5, %esi	#, m
# SUCC: 70 [75.0%]  (FALLTHRU,CAN_FALLTHRU) 48 [25.0%]  (CAN_FALLTHRU)
	je	.L234	#,
# BLOCK 70 freq:17 seq:68
# PRED: 69 [75.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	44(%rcx), %xmm0	# MEM[(struct kiss_fft_cpx *)tw1_829 + 40B].i, D.6037
	movss	40(%rcx), %xmm3	# MEM[(struct kiss_fft_cpx *)tw1_829 + 40B].r, D.6037
	movss	40(%rax), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout2_831 + 40B].r, D.6037
	movaps	%xmm0, %xmm5	# D.6037, D.6037
	movss	44(%rax), %xmm4	# MEM[(struct kiss_fft_cpx *)Fout2_831 + 40B].i, D.6037
	movaps	%xmm3, %xmm2	# D.6037, D.6037
	mulss	%xmm1, %xmm2	# D.6037, D.6037
	mulss	%xmm4, %xmm5	# D.6037, D.6037
	mulss	%xmm0, %xmm1	# D.6037, D.6037
	mulss	%xmm4, %xmm3	# D.6037, D.6037
	subss	%xmm5, %xmm2	# D.6037, D.6037
	addss	%xmm1, %xmm3	# D.6037, D.6037
	movss	40(%rdx), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_835 + 40B].r, MEM[(struct kiss_fft_cpx *)Fout_835 + 40B].r
	subss	%xmm2, %xmm1	# D.6037, D.6037
	movaps	%xmm3, %xmm0	# D.6037, D.6037
	movss	%xmm1, 40(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_831 + 40B].r
	movss	44(%rdx), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_835 + 40B].i, MEM[(struct kiss_fft_cpx *)Fout_835 + 40B].i
	addss	40(%rdx), %xmm2	# MEM[(struct kiss_fft_cpx *)Fout_835 + 40B].r, D.6037
	subss	%xmm3, %xmm1	# D.6037, D.6037
	movss	%xmm1, 44(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_831 + 40B].i
	addss	44(%rdx), %xmm0	# MEM[(struct kiss_fft_cpx *)Fout_835 + 40B].i, D.6037
	movss	%xmm2, 40(%rdx)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout_835 + 40B].r
	movss	%xmm0, 44(%rdx)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout_835 + 40B].i
	cmpl	$6, %esi	#, m
# SUCC: 71 [75.0%]  (FALLTHRU,CAN_FALLTHRU) 48 [25.0%]  (CAN_FALLTHRU)
	je	.L234	#,
# BLOCK 71 freq:17 seq:69
# PRED: 70 [75.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	52(%rcx), %xmm0	# MEM[(struct kiss_fft_cpx *)tw1_829 + 48B].i, D.6037
	movss	48(%rcx), %xmm3	# MEM[(struct kiss_fft_cpx *)tw1_829 + 48B].r, D.6037
	movss	48(%rax), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout2_831 + 48B].r, D.6037
	movaps	%xmm0, %xmm5	# D.6037, D.6037
	movss	52(%rax), %xmm4	# MEM[(struct kiss_fft_cpx *)Fout2_831 + 48B].i, D.6037
	movaps	%xmm3, %xmm2	# D.6037, D.6037
	mulss	%xmm1, %xmm2	# D.6037, D.6037
	mulss	%xmm4, %xmm5	# D.6037, D.6037
	mulss	%xmm0, %xmm1	# D.6037, D.6037
	mulss	%xmm4, %xmm3	# D.6037, D.6037
	subss	%xmm5, %xmm2	# D.6037, D.6037
	addss	%xmm1, %xmm3	# D.6037, D.6037
	movss	48(%rdx), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_835 + 48B].r, MEM[(struct kiss_fft_cpx *)Fout_835 + 48B].r
	subss	%xmm2, %xmm1	# D.6037, D.6037
	movaps	%xmm3, %xmm0	# D.6037, D.6037
	movss	%xmm1, 48(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_831 + 48B].r
	movss	52(%rdx), %xmm1	# MEM[(struct kiss_fft_cpx *)Fout_835 + 48B].i, MEM[(struct kiss_fft_cpx *)Fout_835 + 48B].i
	addss	48(%rdx), %xmm2	# MEM[(struct kiss_fft_cpx *)Fout_835 + 48B].r, D.6037
	subss	%xmm3, %xmm1	# D.6037, D.6037
	movss	%xmm1, 52(%rax)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout2_831 + 48B].i
	addss	52(%rdx), %xmm0	# MEM[(struct kiss_fft_cpx *)Fout_835 + 48B].i, D.6037
	movss	%xmm2, 48(%rdx)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout_835 + 48B].r
	movss	%xmm0, 52(%rdx)	# D.6037, MEM[(struct kiss_fft_cpx *)Fout_835 + 48B].i
# SUCC: 48 [100.0%]  (CAN_FALLTHRU)
	jmp	.L234	#
# BLOCK 72 freq:40 seq:70
# PRED: 39 [28.0%]  (CAN_FALLTHRU)
.L328:
	movq	%rcx, %rax	# Fout, Fout
	movq	%r13, %rbp	# Fout_end, D.6048
	movq	%rcx, %rdi	# Fout, Fout
	addq	$8, %rax	#, D.6040
	movq	%r14, %rsi	# fin,
	subq	%rax, %rbp	# D.6040, D.6048
	shrq	$3, %rbp	#, D.6048
	leaq	8(,%rbp,8), %rdx	#, D.6041
	call	memcpy	#
# SUCC: 43 [100.0%]  (CAN_FALLTHRU)
	jmp	.L225	#
# BLOCK 73 freq:28 seq:71
# PRED: 43 [20.0%]  (CAN_FALLTHRU)
.L219:
	movslq	32(%rsp), %r15	# %sfp, m
	leaq	264(%rbx), %rsi	#, tw2
	movq	16(%rsp), %rdx	# %sfp, Fout
	movq	%rsi, %rdi	# tw2, tw2
	movsd	.LC2(%rip), %xmm6	#, tmp1277
	leaq	0(,%r15,8), %rcx	#, D.6036
	movss	268(%rbx,%r15,8), %xmm7	# MEM[(struct  *)_78 + 4B], epi3$i
	movq	%rdx, %rax	# Fout, Fout
	addq	%rcx, %rax	# D.6036, ivtmp.499
# SUCC: 74 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	addq	%rax, %rcx	# ivtmp.499, ivtmp.502
# BLOCK 74 freq:313 seq:72
# PRED: 73 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 74 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L235:
	movss	(%rax), %xmm2	# MEM[base: _769, offset: 0B], D.6037
	addq	$8, %rsi	#, tw2
	addq	$16, %rdi	#, tw2
	addq	$8, %rdx	#, Fout
	movss	4(%rax), %xmm3	# MEM[base: _769, offset: 4B], D.6037
	addq	$8, %rcx	#, ivtmp.502
	addq	$8, %rax	#, ivtmp.499
	movss	-8(%rsi), %xmm4	# MEM[base: tw2_85, offset: 0B], D.6037
	movaps	%xmm2, %xmm1	# D.6037, D.6037
	movss	-4(%rsi), %xmm0	# MEM[base: tw2_85, offset: 4B], D.6037
	movaps	%xmm3, %xmm5	# D.6037, D.6037
	mulss	%xmm4, %xmm1	# D.6037, D.6037
	mulss	%xmm0, %xmm5	# D.6037, D.6037
	mulss	%xmm4, %xmm3	# D.6037, D.6037
	movss	-16(%rdi), %xmm4	# MEM[base: tw2_98, offset: 0B], D.6037
	mulss	%xmm0, %xmm2	# D.6037, D.6037
	movss	-12(%rdi), %xmm0	# MEM[base: tw2_98, offset: 4B], D.6037
	subss	%xmm5, %xmm1	# D.6037, D.6037
	movss	-8(%rcx), %xmm5	# MEM[base: _761, offset: 0B], D.6037
	addss	%xmm3, %xmm2	# D.6037, D.6037
	movss	-4(%rcx), %xmm3	# MEM[base: _761, offset: 4B], D.6037
	movaps	%xmm5, %xmm8	# D.6037, D.6037
	mulss	%xmm4, %xmm8	# D.6037, D.6037
	movaps	%xmm3, %xmm9	# D.6037, D.6037
	mulss	%xmm0, %xmm9	# D.6037, D.6037
	mulss	%xmm4, %xmm3	# D.6037, D.6037
	movaps	%xmm2, %xmm4	# D.6037, D.6037
	mulss	%xmm5, %xmm0	# D.6037, D.6037
	pxor	%xmm5, %xmm5	# D.6042
	cvtss2sd	-8(%rdx), %xmm5	# MEM[base: Fout_82, offset: 0B], D.6042
	subss	%xmm9, %xmm8	# D.6037, D.6037
	pxor	%xmm9, %xmm9	# D.6042
	addss	%xmm3, %xmm0	# D.6037, D.6037
	movaps	%xmm1, %xmm3	# D.6037, D.6037
	addss	%xmm8, %xmm3	# D.6037, D.6037
	subss	%xmm8, %xmm1	# D.6037, D.6037
	addss	%xmm0, %xmm4	# D.6037, D.6037
	cvtss2sd	%xmm3, %xmm9	# D.6037, D.6042
	mulsd	%xmm6, %xmm9	# tmp1277, D.6042
	subss	%xmm0, %xmm2	# D.6037, D.6037
	mulss	%xmm7, %xmm1	# epi3$i, D.6037
	movaps	%xmm2, %xmm0	# D.6037, D.6037
	mulss	%xmm7, %xmm0	# epi3$i, D.6037
	subsd	%xmm9, %xmm5	# D.6042, D.6042
	pxor	%xmm9, %xmm9	# D.6042
	cvtss2sd	%xmm4, %xmm9	# D.6037, D.6042
	mulsd	%xmm6, %xmm9	# tmp1277, D.6042
	cvtsd2ss	%xmm5, %xmm5	# D.6042, tmp1439
	movss	%xmm5, -8(%rax)	# tmp1439, MEM[base: _769, offset: 0B]
	pxor	%xmm5, %xmm5	# D.6042
	cvtss2sd	-4(%rdx), %xmm5	# MEM[base: Fout_82, offset: 4B], D.6042
	subsd	%xmm9, %xmm5	# D.6042, D.6042
	cvtsd2ss	%xmm5, %xmm5	# D.6042, tmp1440
	movss	%xmm5, -4(%rax)	# tmp1440, MEM[base: _769, offset: 4B]
	addss	-8(%rdx), %xmm3	# MEM[base: Fout_82, offset: 0B], D.6037
	addss	-4(%rdx), %xmm4	# MEM[base: Fout_82, offset: 4B], D.6037
	movss	%xmm3, -8(%rdx)	# D.6037, MEM[base: Fout_82, offset: 0B]
	movss	%xmm4, -4(%rdx)	# D.6037, MEM[base: Fout_82, offset: 4B]
	movss	-8(%rax), %xmm2	# MEM[base: _769, offset: 0B], D.6037
	addss	%xmm0, %xmm2	# D.6037, D.6037
	movss	%xmm2, -8(%rcx)	# D.6037, MEM[base: _761, offset: 0B]
	movss	-4(%rax), %xmm2	# MEM[base: _769, offset: 4B], MEM[base: _769, offset: 4B]
	subss	%xmm1, %xmm2	# D.6037, D.6037
	movss	%xmm2, -4(%rcx)	# D.6037, MEM[base: _761, offset: 4B]
	movss	-8(%rax), %xmm2	# MEM[base: _769, offset: 0B], MEM[base: _769, offset: 0B]
	addss	-4(%rax), %xmm1	# MEM[base: _769, offset: 4B], D.6037
	subss	%xmm0, %xmm2	# D.6037, D.6037
	movss	%xmm1, -4(%rax)	# D.6037, MEM[base: _769, offset: 4B]
	movss	%xmm2, -8(%rax)	# D.6037, MEM[base: _769, offset: 0B]
	subq	$1, %r15	#, m
# SUCC: 74 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 75 [9.0%]  (FALLTHRU)
	jne	.L235	#,
# BLOCK 75 freq:28 seq:73
# PRED: 74 [9.0%]  (FALLTHRU)
# SUCC: 48 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	jmp	.L234	#
# BLOCK 76 freq:28 seq:74
# PRED: 57 [33.3%]  (CAN_FALLTHRU) 46 [33.3%]  (CAN_FALLTHRU)
.L218:
	movl	32(%rsp), %ecx	# %sfp,
	movq	%rbx, %rdx	# cfg,
	movl	$1, %esi	#,
	movq	16(%rsp), %rdi	# %sfp,
	call	kf_bfly_generic	#
# SUCC: 48 [100.0%]  (CAN_FALLTHRU)
	jmp	.L234	#
# BLOCK 77 freq:7 seq:75
# PRED: 60 [33.3%]  (CAN_FALLTHRU)
.L264:
	movq	%r10, %rdx	# Fout, Fout
# SUCC: 65 [100.0%]  (CAN_FALLTHRU)
	jmp	.L227	#
# BLOCK 78 freq:6 seq:76
# PRED: 59 [11.1%]  (CAN_FALLTHRU) 58 [10.0%]  (CAN_FALLTHRU)
.L226:
	movl	32(%rsp), %esi	# %sfp, m
	leal	-1(%rsi), %edx	#, D.6041
	leaq	8(%rcx,%rdx,8), %rsi	#, D.6040
# SUCC: 79 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	16(%rsp), %rdx	# %sfp, Fout
# BLOCK 79 freq:63 seq:77
# PRED: 78 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 79 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
.L232:
	movss	(%rcx), %xmm0	# MEM[base: tw1_912, offset: 0B], D.6037
	addq	$8, %rcx	#, tw1
	addq	$8, %rax	#, Fout2
	addq	$8, %rdx	#, Fout
	movss	-4(%rcx), %xmm2	# MEM[base: tw1_912, offset: 4B], D.6037
	movss	-8(%rax), %xmm1	# MEM[base: Fout2_913, offset: 0B], D.6037
	movaps	%xmm0, %xmm4	# D.6037, D.6037
	movss	-4(%rax), %xmm3	# MEM[base: Fout2_913, offset: 4B], D.6037
	movaps	%xmm2, %xmm5	# D.6037, D.6037
	mulss	%xmm1, %xmm4	# D.6037, D.6037
	mulss	%xmm3, %xmm5	# D.6037, D.6037
	mulss	%xmm2, %xmm1	# D.6037, D.6037
	mulss	%xmm3, %xmm0	# D.6037, D.6037
	subss	%xmm5, %xmm4	# D.6037, D.6037
	addss	%xmm1, %xmm0	# D.6037, D.6037
	movss	-8(%rdx), %xmm1	# MEM[base: Fout_915, offset: 0B], MEM[base: Fout_915, offset: 0B]
	subss	%xmm4, %xmm1	# D.6037, D.6037
	movss	%xmm1, -8(%rax)	# D.6037, MEM[base: Fout2_913, offset: 0B]
	movss	-4(%rdx), %xmm1	# MEM[base: Fout_915, offset: 4B], MEM[base: Fout_915, offset: 4B]
	subss	%xmm0, %xmm1	# D.6037, D.6037
	movss	%xmm1, -4(%rax)	# D.6037, MEM[base: Fout2_913, offset: 4B]
	addss	-8(%rdx), %xmm4	# MEM[base: Fout_915, offset: 0B], D.6037
	addss	-4(%rdx), %xmm0	# MEM[base: Fout_915, offset: 4B], D.6037
	movss	%xmm4, -8(%rdx)	# D.6037, MEM[base: Fout_915, offset: 0B]
	movss	%xmm0, -4(%rdx)	# D.6037, MEM[base: Fout_915, offset: 4B]
	cmpq	%rcx, %rsi	# tw1, D.6040
# SUCC: 79 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 80 [9.0%]  (FALLTHRU)
	jne	.L232	#,
# BLOCK 80 freq:6 seq:78
# PRED: 79 [9.0%]  (FALLTHRU)
# SUCC: 48 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	jmp	.L234	#
	.cfi_endproc
.LFE54:
	.size	kiss_fft, .-kiss_fft
	.section	.text.unlikely
.LCOLDE15:
	.text
.LHOTE15:
	.section	.text.unlikely
.LCOLDB16:
	.text
.LHOTB16:
	.p2align 4,,15
	.globl	kiss_fft_cleanup
	.type	kiss_fft_cleanup, @function
kiss_fft_cleanup:
.LFB55:
	.cfi_startproc
# BLOCK 2 freq:10000 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
# SUCC: EXIT [100.0%] 
	ret
	.cfi_endproc
.LFE55:
	.size	kiss_fft_cleanup, .-kiss_fft_cleanup
	.section	.text.unlikely
.LCOLDE16:
	.text
.LHOTE16:
	.section	.text.unlikely
.LCOLDB17:
	.text
.LHOTB17:
	.p2align 4,,15
	.globl	kiss_fft_next_fast_size
	.type	kiss_fft_next_fast_size, @function
kiss_fft_next_fast_size:
.LFB56:
	.cfi_startproc
# BLOCK 2 freq:81 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	movl	$1431655766, %r8d	#, tmp154
# SUCC: 3 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	$1717986919, %esi	#, tmp155
# BLOCK 3 freq:900 seq:1
# PRED: 2 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 12 [100.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L340:
	movl	%edi, %ecx	# n, n
	testb	$1, %dil	#, n
# SUCC: 4 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 7 [9.0%]  (CAN_FALLTHRU)
	jne	.L333	#,
# BLOCK 4 freq:9100 seq:2
# PRED: 3 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L334:
	movl	%ecx, %eax	# n, tmp104
	shrl	$31, %eax	#, tmp104
	addl	%eax, %ecx	# tmp104, tmp105
	sarl	%ecx	# n
	testb	$1, %cl	#, n
# SUCC: 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 5 [9.0%]  (FALLTHRU)
	je	.L334	#,
# BLOCK 5 freq:819 seq:3
# PRED: 4 [9.0%]  (FALLTHRU)
# SUCC: 7 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	jmp	.L333	#
# BLOCK 6 freq:9100 seq:4
# PRED: 7 [91.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L348:
	movl	%ecx, %eax	# n, tmp157
	sarl	$31, %ecx	#, tmp119
	imull	%r8d	# tmp154
	subl	%ecx, %edx	# tmp119, n
# SUCC: 7 [100.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU)
	movl	%edx, %ecx	# n, n
# BLOCK 7 freq:10000 seq:5
# PRED: 3 [9.0%]  (CAN_FALLTHRU) 6 [100.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 5 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
.L333:
	movl	%ecx, %eax	# n, tmp156
	imull	%r8d	# tmp154
	movl	%ecx, %eax	# n, tmp111
	sarl	$31, %eax	#, tmp111
	subl	%eax, %edx	# tmp111, tmp108
	leal	(%rdx,%rdx,2), %eax	#, tmp114
	cmpl	%eax, %ecx	# tmp114, n
# SUCC: 6 [91.0%]  (CAN_FALLTHRU) 8 [9.0%]  (FALLTHRU)
	je	.L348	#,
# BLOCK 8 freq:900 seq:6
# PRED: 7 [9.0%]  (FALLTHRU)
# SUCC: 10 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	jmp	.L335	#
# BLOCK 9 freq:9100 seq:7
# PRED: 10 [91.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L349:
	movl	%ecx, %eax	# n, tmp160
	sarl	$31, %ecx	#, tmp141
	imull	%esi	# tmp155
	sarl	%edx	# tmp140
	subl	%ecx, %edx	# tmp141, n
# SUCC: 10 [100.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU)
	movl	%edx, %ecx	# n, n
# BLOCK 10 freq:10000 seq:8
# PRED: 9 [100.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 8 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
.L335:
	movl	%ecx, %eax	# n, tmp159
	imull	%esi	# tmp155
	movl	%ecx, %eax	# n, tmp132
	sarl	$31, %eax	#, tmp132
	sarl	%edx	# tmp131
	subl	%eax, %edx	# tmp132, tmp128
	leal	(%rdx,%rdx,4), %eax	#, tmp135
	cmpl	%eax, %ecx	# tmp135, n
# SUCC: 9 [91.0%]  (CAN_FALLTHRU) 11 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	je	.L349	#,
# BLOCK 11 freq:900 seq:9
# PRED: 10 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$1, %ecx	#, n
# SUCC: 13 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT) 12 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	jle	.L339	#,
# BLOCK 12 freq:819 seq:10
# PRED: 11 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	addl	$1, %edi	#, n
# SUCC: 3 [100.0%]  (DFS_BACK,CAN_FALLTHRU)
	jmp	.L340	#
# BLOCK 13 freq:81 seq:11
# PRED: 11 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT)
.L339:
	movl	%edi, %eax	# n,
# SUCC: EXIT [100.0%] 
	ret
	.cfi_endproc
.LFE56:
	.size	kiss_fft_next_fast_size, .-kiss_fft_next_fast_size
	.section	.text.unlikely
.LCOLDE17:
	.text
.LHOTE17:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1071644672
	.align 8
.LC5:
	.long	0
	.long	1075052544
	.align 8
.LC6:
	.long	0
	.long	1074266112
	.align 8
.LC7:
	.long	0
	.long	1127219200
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC8:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC9:
	.long	0
	.long	1073741824
	.align 8
.LC10:
	.long	0
	.long	1072693248
	.align 8
.LC11:
	.long	1413754136
	.long	-1072094725
	.section	.rodata.cst16
	.align 16
.LC12:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.ident	"GCC: (GNU) 5.3.1 20151207 (Red Hat 5.3.1-2)"
	.section	.note.GNU-stack,"",@progbits
