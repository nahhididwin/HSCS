


section .text
global compress_delta_avx2

compress_delta_avx2:
    push rbp
    mov rbp, rsp

    vmovdqa ymm1, ymmword [qwa_vector]     ; Load 1000s into ymm1

.loop:
    cmp rdx, 0
    jle .done

    mov rax, rdx
    cmp rax, 8
    jl .scalar_fallback

    ; Load 8 integers from input (32-bit each)
    vmovdqu ymm0, ymmword [rdi]
    ; Subtract QWA (1000)
    vpsubd ymm2, ymm0, ymm1
    ; Store result
    vmovdqu ymmword [rsi], ymm2

    add rdi, 32       ; 8 * 4 bytes
    add rsi, 32
    sub rdx, 8
    jmp .loop

.scalar_fallback:
    cmp rdx, 0
    jle .done

    ; Scalar fallback
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
