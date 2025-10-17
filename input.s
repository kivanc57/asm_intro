.section .bss
    .lcomm input_buffer, 100

.section .text
.globl _start
_start:
    # sys_read
    mov $0, %rax
    mov $0, %rdi
    mov $input_buffer, %rsi
    mov $100, %rdx
    syscall

    mov %rax, %rcx      # Save bytes read to %rcx

    # sys_write
    mov $1, %rax
    mov $1, %rdi
    mov $input_buffer, %rsi
    mov %rcx, %rdx      # Use saved bytes read
    syscall

    # exit syscall
    mov $60, %rax
    xor %rdi, %rdi
    syscall

