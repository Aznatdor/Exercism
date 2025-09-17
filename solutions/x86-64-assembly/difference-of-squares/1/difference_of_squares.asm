section .text
global square_of_sum
square_of_sum:
    ; Provide your implementation here
    mov rcx, 1; initialize loop counter
    mov rax, 0;  initialize sum
    loop_start1:
        add rax, rcx; perform rbx += rcx

        ; exiting condition
        inc rcx; 
        cmp rcx, rdi;
        jle loop_start1;  jump less or equal

    imul rax, rax;  square it
    ret

global sum_of_squares
sum_of_squares:
    ; rdx is a temporary register, whereas rbx is "safe" register
    ; Provide your implementation here
    mov rcx, 1;
    mov rax, 0;

    loop_start2:
        mov rdx, rcx; temporary variable
        imul rdx, rdx;  square it
        add rax, rdx;  accumulate

        inc rcx;
        cmp rcx, rdi;
        jle loop_start2;
    ret

global difference_of_squares
difference_of_squares:
    ; Provide your implementation here
    call square_of_sum;
    mov rbx, rax; % saving the result
    call sum_of_squares;
    sub rbx, rax; % calculate SqOFSum - SumOFSq
    mov rax, rbx; % initialize the return variable
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
