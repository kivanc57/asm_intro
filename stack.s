.section .data
msg:
    .ascii "Hello World!\n"
len = . - msg

.section .text
.globl _start
_start:
    call output         # call output function

    push $2
    push $4
    push $8             # push some values to stack

    mov $60, %rax       # syscall: exit
    pop %rdi            # get 8 as exit code
    syscall

output:
    mov $1, %rax        # syscall: write
    mov $1, %rdi        # fd: stdout
    mov $msg, %rsi      # buffer
    mov $len, %rdx      # length
    syscall
    ret

