;Programa: Calculador de Media
;Author: Bruno Cotrim 
;Versão: 1.0

SYS_EXIT    equ 1
SYS_READ    equ 3
SYS_WRITE   equ 4
STDIN       equ 0
STDOUT      equ 1

section .data
    msg1 db "Insire o primeiro número: "
    len1 equ $-msg1

    msg2 db "Insira o segundo número: "
    len2 equ $-msg2

    msg3 db "Média: "
    len3 equ $-msg3

    lf db 10
    lf_len equ $-lf

section .bss
    num1 resb 5
    num2 resb 5

    soma resb 10
    media resb 10

section .text
    global _start

_start:
    ;Solicita o primeiro número
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg1
    mov edx, len1
    int 0x80

    ;Lê o primeiro número
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num1
    mov edx, 5
    int  0x80


    ;Solicita o segundo número
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, len2
    int 0x80

    ;Lê o segundo número
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num2
    mov edx, 5
    int  0x80

.soma:
    ;Efetua a conversão dos números de string para inteiro
    mov eax, [num1]
    sub eax, '0'

    mov ebx, [num2]
    sub ebx, '0'

    ;Efetua a soma dos dois número
    add eax, ebx

    ;Converte o resultado da soma em string
    add eax, '0'
    mov [soma], eax

.media:
    movzx eax, byte [soma]
    sub eax, '0'

    xor ebx, ebx
    mov bl, 2
    div bl

    add al, '0'
    mov [media], al


.print_media:
    ;Exibe "Média: "
    mov eax, SYS_WRITE
    mov ebx, STDIN
    mov ecx, msg3
    mov edx, len3
    int 0x80

    ;Imprime a média
    mov eax, SYS_WRITE
    mov ebx, STDIN
    mov ecx, media
    mov edx, 5
    int 0x80

    ;Imprime uma nova linha
    mov eax, SYS_WRITE
    mov ebx, STDIN
    mov ecx, lf
    mov edx, lf_len
    int 0x80

    mov eax, SYS_EXIT
    xor ebx, ebx
    int 0x80
