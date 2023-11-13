;Programa: MediumX
;Author: Diego Fukayama, Mateus Joffre
;Version: 1.0

;MACROS
SYS_EXIT    equ 1
SYS_READ    equ 3
SYS_WRITE   equ 4
STDIN       equ 0
STDOUT      equ 1

section .data
    msg1 db "Insire o 1º número: "
    len1 equ $-msg1

    msg2 db "Insira o 2º número: "
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
    ;Solicita o 1º número
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg1
    mov edx, len1
    int 0x80

    ;Lê o 1º número
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num1
    mov edx, 5
    int  0x80


    ;Solicita o 2º número
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, len2
    int 0x80

    ;Lê o 2º número
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
    ;Efetua a conversão dos números de string para inteiro
    movzx eax, byte [soma]
    sub eax, '0'

    ;Efetua a divisão por 2 (pois são duas notas e a formula da média é: (Soma das notas) / (num. total de notas))
    ;O operando div funciona da seguinte forma: eax / ebx
    ;eax atualmente contém a soma dos números, então ebx terá que ter o número 2
    xor ebx, ebx
    mov bl, 2
    div bl

    ;O resultado será armazenado em eax, o resto da divisão será armazenado em ebx
    add al, '0'
    mov [media], al

;Verifica o tamanho do resultado
xor esi, esi
.loop:
    mov edi, [media + esi]
    cmp edi, 0
    je .print_media
    inc esi
    jmp .loop

.print_media:
    ;Exibe "Média: [MEDIA]"
    mov eax, SYS_WRITE
    mov ebx, STDIN
    mov ecx, msg3
    mov edx, len3
    int 0x80

    ;Imprime a média
    mov eax, SYS_WRITE
    mov ebx, STDIN
    mov ecx, media
    mov edx, esi
    int 0x80

    ;Imprime uma nova linha
    mov eax, SYS_WRITE
    mov ebx, STDIN
    mov ecx, lf
    mov edx, lf_len
    int 0x80

.exit:
    mov eax, SYS_EXIT
    xor ebx, ebx
    int 0x80
