.data           # All global variables are declared under the `.data`
n: .word 12     # All global variables are stored in the memory.
                # n is the name of the variable, 
                # .word means that the size of the data is one word.
                # 12 is the value assigned to n

.text           # All of the code is under the `.text` derivative.
main:
    add t0, x0, x0 # curr_fib = 0
    addi t1, x0, 1 # next_fib = 1
    la t3, n    # load the address of the label n
                # `la rd, label`: load the address of `label` into the `rd`.
    lw t3, 0(t3) # get the value that is stored at the address denoted by the label n
fib:
    beq t3, x0, finish # exit loop once we have completed n iterations
    add t2, t1, t0 # new_fib = curr_fib + next_fib;
    mv t0, t1 # curr_fib = next_fib;
    mv t1, t2 # next_fib = new_fib;
    addi t3, t3, -1 # decrement counter
    j fib # loop
finish:
    addi a0, x0, 1 # argument to ecall to execute print integer
    addi a1, t0, 0 # argument to ecall, the value to be printed
    ecall # print integer ecall "ecall(1, 123)"
    addi a0, x0, 10 # argument to ecall to terminate
    ecall # terminate ecall "ecall(10)"
