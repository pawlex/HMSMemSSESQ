#!/usr/bin/env /bin/bash
#struct test tests[] = {
# 0x1    { "Random Value", test_random_value },
# 0x2    { "Compare XOR", test_xor_comparison },
# 0x4    { "Compare SUB", test_sub_comparison },
# 0x8    { "Compare MUL", test_mul_comparison },
# 0x10   { "Compare DIV",test_div_comparison },
# 0x20   { "Compare OR", test_or_comparison },
# 0x40   { "Compare AND", test_and_comparison },
# 0x80   { "Sequential Increment", test_seqinc_comparison },
# 0x100  { "Solid Bits", test_solidbits_comparison },
# 0x200  { "Block Sequential", test_blockseq_comparison },
# 0x400  { "Checkerboard", test_checkerboard_comparison },
# 0x800  { "Bit Spread", test_bitspread_comparison },
# 0x1000 { "Bit Flip", test_bitflip_comparison },
# 0x2000 { "Walking Ones", test_walkbits1_comparison },
# 
MEMTESTER_TEST_MASK=0x3000 memtester 1G 100
