.globl f # this allows other files to find the function f

# f takes in two arguments:
# a0 is the value we want to evaluate f at
# a1 is the address of the "output" array (read the lab spec for more information).
# The return value should be stored in a0
f:
    addi t0 a0 3    # t0 = a0 + 3, a0 is in the set [0~6]
    slli t0 t0 2    # let t0 to be the offset(t0 << 2 == t0 * 4)
    add t0 t0 a1    # calculate the address of the desired element
    lw t1 0(t0)     # load the element.
    add a0 t1 x0    # store the output into a0 to return to the caller
    jr ra
