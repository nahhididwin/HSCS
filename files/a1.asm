


section .text
global compress_delta_avx2

compress_delta_avx2:
    push rbp
    mov rbp, rsp

    vmovdqa ymm1, ymmword [qwa_vector]     

.loop:
    cmp rdx, 0
    jle .done

    mov rax, rdx
    cmp rax, 8
    jl .scalar_fallback

    vmovdqu ymm0, ymmword [rdi]
    vpsubd ymm2, ymm0, ymm1
    vmovdqu ymmword [rsi], ymm2

    add rdi, 32       
    add rsi, 32
    sub rdx, 8
    jmp .loop

.scalar_fallback:
    cmp rdx, 0
    jle .done

    mov eax, dword [rdi]
    sub eax, 1000
    mov dword [rsi], eax

    add rdi, 4
    add rsi, 4
    dec rdx
    jmp .scalar_fallback

.done:
    vzeroupper
    pop rbp
    ret

section .data
align 32
qwa_vector: dd 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000
