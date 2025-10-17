.section .text
.globl _start
_start:    
    mov $7, %rbx    # b = 7

loop:
    cmp $0, %rbx    # cmp b with 0
    jle endofloop   # if b <= 0, jmp to endofloop

    sub $1, %rbx    # b--
    jmp loop        # repeat

endofloop:
    mov $60, %rax   # sys_exit
    mov %rbx, %rdi  # exit code b = 0
    syscall         # kernel call
