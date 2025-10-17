.section .data
then_msg:
    .ascii "thenbranch\n"
then_len = . - then_msg

else_msg:
    .ascii "elsemsg\n"
else_len = . - else_msg

.section .text
.globl _start
_start:    
    mov $10, %rbx           # b = 10

loop:
    cmp $0, %rbx            # cmp b with 0
    jle endofloop           # if b <= 0, jmp to endofloop

    sub $1, %rbx            # b--
    jmp loop                # repeat

endofloop:
    cmp $0, %rbx            # if (b == 0)
    je thencase             # jmp to thencase if (b == 0)
    jmp elsecase            # else jmp to elsecase

thencase:
    mov $1, %rax            # syscall: write
    mov $1, %rdi            # fd = 1 (stdout)
    mov $then_msg, %rsi     # ptr to $then_msg
    mov $then_len, %rdx     # len of $then_len
    syscall
    jmp ite_end

elsecase:
    mov $1, %rax
    mov $1, %rdi
    mov $else_msg, %rsi
    mov $else_len, %rdx
    syscall

ite_end:
    mov $60, %rax           # sys_exit
    mov $0, %rdi            # return 
    syscall

