section .data
    message db "HELLOASM", 0
    key db 3
    encrypted db 8 dup(0)
    len db 8

section .text
    global _start

_start:
    mov esi, message
    mov edi, encrypted
    mov al, [key]

encrypt_loop:
    mov bl, [esi]
    cmp bl, 0
    je done

    add bl, al
    mov [edi], bl
    inc esi
    inc edi
    jmp encrypt_loop

done:
    mov rax, 1
    mov rdi, 1
    mov rsi, encrypted
    mov rdx, [len]
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall