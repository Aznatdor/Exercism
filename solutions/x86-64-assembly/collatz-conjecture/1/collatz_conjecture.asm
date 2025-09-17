section .text
global steps

steps:
    ; Provide your implementation here
    cmp edi, 0
    jg main_logic
    mov eax, -1
    ret

main_logic:
    mov eax, 0; return variable

main_loop:
    cmp edi, 1; end if rdi is 1
    je end_steps
    inc rax; incriment rax here, not after the test (rax won't be reached)
        
    test edi, 1; if rdi is odd
    jnz odd; jump if equal 1, i.e. go to odd
    ; else we would go to even case, which is right below and therefore jmp is not required

even:
    shr edi, 1; bitwise shift by 1 bit, i.e. division by 2
    jmp main_loop; going back into the loop
    
odd:
    imul edi, 3; multiply by 3
    inc edi
    jmp main_loop; going back into the loop


end_steps:
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
