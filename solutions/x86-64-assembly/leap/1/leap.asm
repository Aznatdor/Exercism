section .text
global leap_year

leap_year:
    ;divive by 100
    mov eax, edi
    xor edx, edx
    mov ecx, 100
    div ecx

    cmp edx, 0
    jne div_by_4

    ;divive by 400
    mov eax, edi
    xor edx, edx
    mov ecx, 400
    div ecx

    cmp edx, 0
    je is_leap
    jne is_not_leap

div_by_4:
    mov eax, edi
    xor edx, edx
    mov ecx, 4
    div ecx
    
    cmp edx, 0
    je is_leap
    jne is_not_leap

is_leap:
    mov eax, 1
    ret

is_not_leap:
    mov eax, 0
    ret
    
%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif