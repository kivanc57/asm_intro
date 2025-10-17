.section .data
msg:
    .ascii "Hello world!\n"
    len = . -msg                # calculate len by substracting current address from msg

.section .text
.globl _start
_start:                         # entry point
    mov $1, %rax                # sys_write
    mov $1, %rdi                # stdout
    mov $msg, %rsi              # msg addr
    mov $len, %rdx              # msg len
    syscall                     # call kernel

    mov $60, %rax               # sys_exit
    xor %rdi, %rdi              # exit code 0
    syscall                     # call kernel

