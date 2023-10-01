; Disassembly of file: main.o
; Sun Oct  1 10:32:25 2023
; Type: ELF64
; Syntax: NASM
; Instruction set: 80386, x64

default rel

global readDfa: function
global simulateDfa: function
global sameLanguage: function

extern __stack_chk_fail                                 ; near
extern atoi                                             ; near
extern strtok                                           ; near
extern fgets                                            ; near
extern free                                             ; near
extern fclose                                           ; near
extern malloc                                           ; near
extern __isoc99_fscanf                                  ; near
extern fopen                                            ; near
extern _GLOBAL_OFFSET_TABLE_                            ; byte


SECTION .text   align=1 exec                            ; section number 1, code

readDfa:; Function begin
        endbr64                                         ; 0000 _ F3: 0F 1E. FA
        push    rbp                                     ; 0004 _ 55
        mov     rbp, rsp                                ; 0005 _ 48: 89. E5
        sub     rsp, 352                                ; 0008 _ 48: 81. EC, 00000160
        mov     qword [rbp-158H], rdi                   ; 000F _ 48: 89. BD, FFFFFEA8
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        mov     rax, qword [fs:abs 28H]                 ; 0016 _ 64 48: 8B. 04 25, 00000028
        mov     qword [rbp-8H], rax                     ; 001F _ 48: 89. 45, F8
        xor     eax, eax                                ; 0023 _ 31. C0
        mov     rax, qword [rbp-158H]                   ; 0025 _ 48: 8B. 85, FFFFFEA8
        lea     rsi, [rel ?_033]                        ; 002C _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 0033 _ 48: 89. C7
        call    fopen                                   ; 0036 _ E8, 00000000(PLT r)
        mov     qword [rbp-120H], rax                   ; 003B _ 48: 89. 85, FFFFFEE0
        cmp     qword [rbp-120H], 0                     ; 0042 _ 48: 83. BD, FFFFFEE0, 00
        jnz     ?_001                                   ; 004A _ 75, 0A
        mov     eax, 0                                  ; 004C _ B8, 00000000
        jmp     ?_016                                   ; 0051 _ E9, 00000404

?_001:  lea     rcx, [rbp-140H]                         ; 0056 _ 48: 8D. 8D, FFFFFEC0
        lea     rdx, [rbp-144H]                         ; 005D _ 48: 8D. 95, FFFFFEBC
        mov     rax, qword [rbp-120H]                   ; 0064 _ 48: 8B. 85, FFFFFEE0
        lea     rsi, [rel ?_034]                        ; 006B _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 0072 _ 48: 89. C7
        mov     eax, 0                                  ; 0075 _ B8, 00000000
        call    __isoc99_fscanf                         ; 007A _ E8, 00000000(PLT r)
        mov     edi, 32                                 ; 007F _ BF, 00000020
        call    malloc                                  ; 0084 _ E8, 00000000(PLT r)
        mov     qword [rbp-118H], rax                   ; 0089 _ 48: 89. 85, FFFFFEE8
        cmp     qword [rbp-118H], 0                     ; 0090 _ 48: 83. BD, FFFFFEE8, 00
        jnz     ?_002                                   ; 0098 _ 75, 19
        mov     rax, qword [rbp-120H]                   ; 009A _ 48: 8B. 85, FFFFFEE0
        mov     rdi, rax                                ; 00A1 _ 48: 89. C7
        call    fclose                                  ; 00A4 _ E8, 00000000(PLT r)
        mov     eax, 0                                  ; 00A9 _ B8, 00000000
        jmp     ?_016                                   ; 00AE _ E9, 000003A7

?_002:  mov     edx, dword [rbp-144H]                   ; 00B3 _ 8B. 95, FFFFFEBC
        mov     rax, qword [rbp-118H]                   ; 00B9 _ 48: 8B. 85, FFFFFEE8
        mov     dword [rax+10H], edx                    ; 00C0 _ 89. 50, 10
        mov     edx, dword [rbp-140H]                   ; 00C3 _ 8B. 95, FFFFFEC0
        mov     rax, qword [rbp-118H]                   ; 00C9 _ 48: 8B. 85, FFFFFEE8
        mov     dword [rax+14H], edx                    ; 00D0 _ 89. 50, 14
        mov     rax, qword [rbp-118H]                   ; 00D3 _ 48: 8B. 85, FFFFFEE8
        mov     dword [rax+18H], 0                      ; 00DA _ C7. 40, 18, 00000000
        mov     eax, dword [rbp-144H]                   ; 00E1 _ 8B. 85, FFFFFEBC
        cdqe                                            ; 00E7 _ 48: 98
        shl     rax, 3                                  ; 00E9 _ 48: C1. E0, 03
        mov     rdi, rax                                ; 00ED _ 48: 89. C7
        call    malloc                                  ; 00F0 _ E8, 00000000(PLT r)
        mov     rdx, rax                                ; 00F5 _ 48: 89. C2
        mov     rax, qword [rbp-118H]                   ; 00F8 _ 48: 8B. 85, FFFFFEE8
        mov     qword [rax], rdx                        ; 00FF _ 48: 89. 10
        mov     eax, dword [rbp-140H]                   ; 0102 _ 8B. 85, FFFFFEC0
        movsxd  rdx, eax                                ; 0108 _ 48: 63. D0
        mov     rax, rdx                                ; 010B _ 48: 89. D0
        add     rax, rax                                ; 010E _ 48: 01. C0
        add     rax, rdx                                ; 0111 _ 48: 01. D0
        shl     rax, 2                                  ; 0114 _ 48: C1. E0, 02
        mov     rdi, rax                                ; 0118 _ 48: 89. C7
        call    malloc                                  ; 011B _ E8, 00000000(PLT r)
        mov     rdx, rax                                ; 0120 _ 48: 89. C2
        mov     rax, qword [rbp-118H]                   ; 0123 _ 48: 8B. 85, FFFFFEE8
        mov     qword [rax+8H], rdx                     ; 012A _ 48: 89. 50, 08
        mov     rax, qword [rbp-118H]                   ; 012E _ 48: 8B. 85, FFFFFEE8
        mov     rax, qword [rax]                        ; 0135 _ 48: 8B. 00
        test    rax, rax                                ; 0138 _ 48: 85. C0
        jz      ?_003                                   ; 013B _ 74, 10
        mov     rax, qword [rbp-118H]                   ; 013D _ 48: 8B. 85, FFFFFEE8
        mov     rax, qword [rax+8H]                     ; 0144 _ 48: 8B. 40, 08
        test    rax, rax                                ; 0148 _ 48: 85. C0
        jnz     ?_004                                   ; 014B _ 75, 4D
?_003:  mov     rax, qword [rbp-118H]                   ; 014D _ 48: 8B. 85, FFFFFEE8
        mov     rax, qword [rax]                        ; 0154 _ 48: 8B. 00
        mov     rdi, rax                                ; 0157 _ 48: 89. C7
        call    free                                    ; 015A _ E8, 00000000(PLT r)
        mov     rax, qword [rbp-118H]                   ; 015F _ 48: 8B. 85, FFFFFEE8
        mov     rax, qword [rax+8H]                     ; 0166 _ 48: 8B. 40, 08
        mov     rdi, rax                                ; 016A _ 48: 89. C7
        call    free                                    ; 016D _ E8, 00000000(PLT r)
        mov     rax, qword [rbp-120H]                   ; 0172 _ 48: 8B. 85, FFFFFEE0
        mov     rdi, rax                                ; 0179 _ 48: 89. C7
        call    fclose                                  ; 017C _ E8, 00000000(PLT r)
        mov     rax, qword [rbp-118H]                   ; 0181 _ 48: 8B. 85, FFFFFEE8
        mov     rdi, rax                                ; 0188 _ 48: 89. C7
        call    free                                    ; 018B _ E8, 00000000(PLT r)
        mov     eax, 0                                  ; 0190 _ B8, 00000000
        jmp     ?_016                                   ; 0195 _ E9, 000002C0

?_004:  mov     dword [rbp-134H], 0                     ; 019A _ C7. 85, FFFFFECC, 00000000
        jmp     ?_008                                   ; 01A4 _ E9, 000000A8

?_005:  mov     eax, dword [rbp-144H]                   ; 01A9 _ 8B. 85, FFFFFEBC
        sub     eax, 1                                  ; 01AF _ 83. E8, 01
        cmp     dword [rbp-134H], eax                   ; 01B2 _ 39. 85, FFFFFECC
        jge     ?_006                                   ; 01B8 _ 7D, 3A
        mov     rax, qword [rbp-118H]                   ; 01BA _ 48: 8B. 85, FFFFFEE8
        mov     rax, qword [rax]                        ; 01C1 _ 48: 8B. 00
        mov     edx, dword [rbp-134H]                   ; 01C4 _ 8B. 95, FFFFFECC
        movsxd  rdx, edx                                ; 01CA _ 48: 63. D2
        shl     rdx, 3                                  ; 01CD _ 48: C1. E2, 03
        add     rax, rdx                                ; 01D1 _ 48: 01. D0
        mov     rdx, rax                                ; 01D4 _ 48: 89. C2
        mov     rax, qword [rbp-120H]                   ; 01D7 _ 48: 8B. 85, FFFFFEE0
        lea     rsi, [rel ?_035]                        ; 01DE _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 01E5 _ 48: 89. C7
        mov     eax, 0                                  ; 01E8 _ B8, 00000000
        call    __isoc99_fscanf                         ; 01ED _ E8, 00000000(PLT r)
        jmp     ?_007                                   ; 01F2 _ EB, 38

?_006:  mov     rax, qword [rbp-118H]                   ; 01F4 _ 48: 8B. 85, FFFFFEE8
        mov     rax, qword [rax]                        ; 01FB _ 48: 8B. 00
        mov     edx, dword [rbp-134H]                   ; 01FE _ 8B. 95, FFFFFECC
        movsxd  rdx, edx                                ; 0204 _ 48: 63. D2
        shl     rdx, 3                                  ; 0207 _ 48: C1. E2, 03
        add     rax, rdx                                ; 020B _ 48: 01. D0
        mov     rdx, rax                                ; 020E _ 48: 89. C2
        mov     rax, qword [rbp-120H]                   ; 0211 _ 48: 8B. 85, FFFFFEE0
        lea     rsi, [rel ?_036]                        ; 0218 _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 021F _ 48: 89. C7
        mov     eax, 0                                  ; 0222 _ B8, 00000000
        call    __isoc99_fscanf                         ; 0227 _ E8, 00000000(PLT r)
?_007:  mov     rax, qword [rbp-118H]                   ; 022C _ 48: 8B. 85, FFFFFEE8
        mov     rax, qword [rax]                        ; 0233 _ 48: 8B. 00
        mov     edx, dword [rbp-134H]                   ; 0236 _ 8B. 95, FFFFFECC
        movsxd  rdx, edx                                ; 023C _ 48: 63. D2
        shl     rdx, 3                                  ; 023F _ 48: C1. E2, 03
        add     rax, rdx                                ; 0243 _ 48: 01. D0
        mov     byte [rax+4H], 0                        ; 0246 _ C6. 40, 04, 00
        add     dword [rbp-134H], 1                     ; 024A _ 83. 85, FFFFFECC, 01
?_008:  mov     eax, dword [rbp-144H]                   ; 0251 _ 8B. 85, FFFFFEBC
        cmp     dword [rbp-134H], eax                   ; 0257 _ 39. 85, FFFFFECC
        jl      ?_005                                   ; 025D _ 0F 8C, FFFFFF46
        mov     rdx, qword [rbp-120H]                   ; 0263 _ 48: 8B. 95, FFFFFEE0
        lea     rax, [rbp-110H]                         ; 026A _ 48: 8D. 85, FFFFFEF0
        mov     esi, 256                                ; 0271 _ BE, 00000100
        mov     rdi, rax                                ; 0276 _ 48: 89. C7
        call    fgets                                   ; 0279 _ E8, 00000000(PLT r)
        test    rax, rax                                ; 027E _ 48: 85. C0
        je      ?_012                                   ; 0281 _ 0F 84, 0000008B
        lea     rax, [rbp-110H]                         ; 0287 _ 48: 8D. 85, FFFFFEF0
        lea     rsi, [rel ?_037]                        ; 028E _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 0295 _ 48: 89. C7
        call    strtok                                  ; 0298 _ E8, 00000000(PLT r)
        mov     qword [rbp-128H], rax                   ; 029D _ 48: 89. 85, FFFFFED8
        jmp     ?_011                                   ; 02A4 _ EB, 62

?_009:  mov     rax, qword [rbp-128H]                   ; 02A6 _ 48: 8B. 85, FFFFFED8
        mov     rdi, rax                                ; 02AD _ 48: 89. C7
        call    atoi                                    ; 02B0 _ E8, 00000000(PLT r)
        mov     dword [rbp-12CH], eax                   ; 02B5 _ 89. 85, FFFFFED4
        cmp     dword [rbp-12CH], 0                     ; 02BB _ 83. BD, FFFFFED4, 00
        js      ?_010                                   ; 02C2 _ 78, 2C
        mov     eax, dword [rbp-144H]                   ; 02C4 _ 8B. 85, FFFFFEBC
        cmp     dword [rbp-12CH], eax                   ; 02CA _ 39. 85, FFFFFED4
        jge     ?_010                                   ; 02D0 _ 7D, 1E
        mov     rax, qword [rbp-118H]                   ; 02D2 _ 48: 8B. 85, FFFFFEE8
        mov     rax, qword [rax]                        ; 02D9 _ 48: 8B. 00
        mov     edx, dword [rbp-12CH]                   ; 02DC _ 8B. 95, FFFFFED4
        movsxd  rdx, edx                                ; 02E2 _ 48: 63. D2
        shl     rdx, 3                                  ; 02E5 _ 48: C1. E2, 03
        add     rax, rdx                                ; 02E9 _ 48: 01. D0
        mov     byte [rax+4H], 1                        ; 02EC _ C6. 40, 04, 01
?_010:  lea     rsi, [rel ?_037]                        ; 02F0 _ 48: 8D. 35, 00000000(rel)
        mov     edi, 0                                  ; 02F7 _ BF, 00000000
        call    strtok                                  ; 02FC _ E8, 00000000(PLT r)
        mov     qword [rbp-128H], rax                   ; 0301 _ 48: 89. 85, FFFFFED8
?_011:  cmp     qword [rbp-128H], 0                     ; 0308 _ 48: 83. BD, FFFFFED8, 00
        jnz     ?_009                                   ; 0310 _ 75, 94
?_012:  mov     dword [rbp-130H], 0                     ; 0312 _ C7. 85, FFFFFED0, 00000000
        jmp     ?_015                                   ; 031C _ E9, 00000111

?_013:  lea     rsi, [rbp-145H]                         ; 0321 _ 48: 8D. B5, FFFFFEBB
        lea     rcx, [rbp-138H]                         ; 0328 _ 48: 8D. 8D, FFFFFEC8
        lea     rdx, [rbp-13CH]                         ; 032F _ 48: 8D. 95, FFFFFEC4
        mov     rax, qword [rbp-120H]                   ; 0336 _ 48: 8B. 85, FFFFFEE0
        mov     r8, rsi                                 ; 033D _ 49: 89. F0
        lea     rsi, [rel ?_038]                        ; 0340 _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 0347 _ 48: 89. C7
        mov     eax, 0                                  ; 034A _ B8, 00000000
        call    __isoc99_fscanf                         ; 034F _ E8, 00000000(PLT r)
        mov     eax, dword [rbp-13CH]                   ; 0354 _ 8B. 85, FFFFFEC4
        test    eax, eax                                ; 035A _ 85. C0
        js      ?_014                                   ; 035C _ 0F 88, 000000C9
        mov     edx, dword [rbp-13CH]                   ; 0362 _ 8B. 95, FFFFFEC4
        mov     eax, dword [rbp-144H]                   ; 0368 _ 8B. 85, FFFFFEBC
        cmp     edx, eax                                ; 036E _ 39. C2
        jge     ?_014                                   ; 0370 _ 0F 8D, 000000B5
        mov     eax, dword [rbp-138H]                   ; 0376 _ 8B. 85, FFFFFEC8
        test    eax, eax                                ; 037C _ 85. C0
        js      ?_014                                   ; 037E _ 0F 88, 000000A7
        mov     edx, dword [rbp-138H]                   ; 0384 _ 8B. 95, FFFFFEC8
        mov     eax, dword [rbp-144H]                   ; 038A _ 8B. 85, FFFFFEBC
        cmp     edx, eax                                ; 0390 _ 39. C2
        jge     ?_014                                   ; 0392 _ 0F 8D, 00000093
        mov     rax, qword [rbp-118H]                   ; 0398 _ 48: 8B. 85, FFFFFEE8
        mov     rcx, qword [rax+8H]                     ; 039F _ 48: 8B. 48, 08
        mov     eax, dword [rbp-130H]                   ; 03A3 _ 8B. 85, FFFFFED0
        movsxd  rdx, eax                                ; 03A9 _ 48: 63. D0
        mov     rax, rdx                                ; 03AC _ 48: 89. D0
        add     rax, rax                                ; 03AF _ 48: 01. C0
        add     rax, rdx                                ; 03B2 _ 48: 01. D0
        shl     rax, 2                                  ; 03B5 _ 48: C1. E0, 02
        lea     rdx, [rcx+rax]                          ; 03B9 _ 48: 8D. 14 01
        mov     eax, dword [rbp-13CH]                   ; 03BD _ 8B. 85, FFFFFEC4
        mov     dword [rdx], eax                        ; 03C3 _ 89. 02
        mov     rax, qword [rbp-118H]                   ; 03C5 _ 48: 8B. 85, FFFFFEE8
        mov     rcx, qword [rax+8H]                     ; 03CC _ 48: 8B. 48, 08
        mov     eax, dword [rbp-130H]                   ; 03D0 _ 8B. 85, FFFFFED0
        movsxd  rdx, eax                                ; 03D6 _ 48: 63. D0
        mov     rax, rdx                                ; 03D9 _ 48: 89. D0
        add     rax, rax                                ; 03DC _ 48: 01. C0
        add     rax, rdx                                ; 03DF _ 48: 01. D0
        shl     rax, 2                                  ; 03E2 _ 48: C1. E0, 02
        lea     rdx, [rcx+rax]                          ; 03E6 _ 48: 8D. 14 01
        mov     eax, dword [rbp-138H]                   ; 03EA _ 8B. 85, FFFFFEC8
        mov     dword [rdx+4H], eax                     ; 03F0 _ 89. 42, 04
        mov     rax, qword [rbp-118H]                   ; 03F3 _ 48: 8B. 85, FFFFFEE8
        mov     rcx, qword [rax+8H]                     ; 03FA _ 48: 8B. 48, 08
        mov     eax, dword [rbp-130H]                   ; 03FE _ 8B. 85, FFFFFED0
        movsxd  rdx, eax                                ; 0404 _ 48: 63. D0
        mov     rax, rdx                                ; 0407 _ 48: 89. D0
        add     rax, rax                                ; 040A _ 48: 01. C0
        add     rax, rdx                                ; 040D _ 48: 01. D0
        shl     rax, 2                                  ; 0410 _ 48: C1. E0, 02
        lea     rdx, [rcx+rax]                          ; 0414 _ 48: 8D. 14 01
        movzx   eax, byte [rbp-145H]                    ; 0418 _ 0F B6. 85, FFFFFEBB
        mov     byte [rdx+8H], al                       ; 041F _ 88. 42, 08
        add     dword [rbp-130H], 1                     ; 0422 _ 83. 85, FFFFFED0, 01
        jmp     ?_015                                   ; 0429 _ EB, 07

?_014:  mov     eax, 0                                  ; 042B _ B8, 00000000
        jmp     ?_016                                   ; 0430 _ EB, 28

?_015:  mov     eax, dword [rbp-140H]                   ; 0432 _ 8B. 85, FFFFFEC0
        cmp     dword [rbp-130H], eax                   ; 0438 _ 39. 85, FFFFFED0
        jl      ?_013                                   ; 043E _ 0F 8C, FFFFFEDD
        mov     rax, qword [rbp-120H]                   ; 0444 _ 48: 8B. 85, FFFFFEE0
        mov     rdi, rax                                ; 044B _ 48: 89. C7
        call    fclose                                  ; 044E _ E8, 00000000(PLT r)
        mov     rax, qword [rbp-118H]                   ; 0453 _ 48: 8B. 85, FFFFFEE8
?_016:  mov     rsi, qword [rbp-8H]                     ; 045A _ 48: 8B. 75, F8
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        xor     rsi, qword [fs:abs 28H]                 ; 045E _ 64 48: 33. 34 25, 00000028
        jz      ?_017                                   ; 0467 _ 74, 05
        call    __stack_chk_fail                        ; 0469 _ E8, 00000000(PLT r)
?_017:  leave                                           ; 046E _ C9
        ret                                             ; 046F _ C3
; readDfa End of function

simulateDfa:; Function begin
        endbr64                                         ; 0470 _ F3: 0F 1E. FA
        push    rbp                                     ; 0474 _ 55
        mov     rbp, rsp                                ; 0475 _ 48: 89. E5
        mov     qword [rbp-28H], rdi                    ; 0478 _ 48: 89. 7D, D8
        mov     qword [rbp-30H], rsi                    ; 047C _ 48: 89. 75, D0
        cmp     qword [rbp-28H], 0                      ; 0480 _ 48: 83. 7D, D8, 00
        jz      ?_018                                   ; 0485 _ 74, 07
        cmp     qword [rbp-30H], 0                      ; 0487 _ 48: 83. 7D, D0, 00
        jnz     ?_019                                   ; 048C _ 75, 0A
?_018:  mov     eax, 0                                  ; 048E _ B8, 00000000
        jmp     ?_032                                   ; 0493 _ E9, 00000162

?_019:  mov     qword [rbp-10H], 0                      ; 0498 _ 48: C7. 45, F0, 00000000
        mov     dword [rbp-18H], 0                      ; 04A0 _ C7. 45, E8, 00000000
        jmp     ?_022                                   ; 04A7 _ EB, 3F

?_020:  mov     rax, qword [rbp-28H]                    ; 04A9 _ 48: 8B. 45, D8
        mov     rax, qword [rax]                        ; 04AD _ 48: 8B. 00
        mov     edx, dword [rbp-18H]                    ; 04B0 _ 8B. 55, E8
        movsxd  rdx, edx                                ; 04B3 _ 48: 63. D2
        shl     rdx, 3                                  ; 04B6 _ 48: C1. E2, 03
        add     rax, rdx                                ; 04BA _ 48: 01. D0
        mov     edx, dword [rax]                        ; 04BD _ 8B. 10
        mov     rax, qword [rbp-28H]                    ; 04BF _ 48: 8B. 45, D8
        mov     eax, dword [rax+18H]                    ; 04C3 _ 8B. 40, 18
        cmp     edx, eax                                ; 04C6 _ 39. C2
        jnz     ?_021                                   ; 04C8 _ 75, 1A
        mov     rax, qword [rbp-28H]                    ; 04CA _ 48: 8B. 45, D8
        mov     rax, qword [rax]                        ; 04CE _ 48: 8B. 00
        mov     edx, dword [rbp-18H]                    ; 04D1 _ 8B. 55, E8
        movsxd  rdx, edx                                ; 04D4 _ 48: 63. D2
        shl     rdx, 3                                  ; 04D7 _ 48: C1. E2, 03
        add     rax, rdx                                ; 04DB _ 48: 01. D0
        mov     qword [rbp-10H], rax                    ; 04DE _ 48: 89. 45, F0
        jmp     ?_023                                   ; 04E2 _ EB, 10

?_021:  add     dword [rbp-18H], 1                      ; 04E4 _ 83. 45, E8, 01
?_022:  mov     rax, qword [rbp-28H]                    ; 04E8 _ 48: 8B. 45, D8
        mov     eax, dword [rax+10H]                    ; 04EC _ 8B. 40, 10
        cmp     dword [rbp-18H], eax                    ; 04EF _ 39. 45, E8
        jl      ?_020                                   ; 04F2 _ 7C, B5
?_023:  cmp     qword [rbp-10H], 0                      ; 04F4 _ 48: 83. 7D, F0, 00
        jnz     ?_024                                   ; 04F9 _ 75, 0A
        mov     eax, 0                                  ; 04FB _ B8, 00000000
        jmp     ?_032                                   ; 0500 _ E9, 000000F5

?_024:  mov     rax, qword [rbp-30H]                    ; 0505 _ 48: 8B. 45, D0
        mov     qword [rbp-8H], rax                     ; 0509 _ 48: 89. 45, F8
        jmp     ?_031                                   ; 050D _ E9, 000000D1

?_025:  mov     rax, qword [rbp-8H]                     ; 0512 _ 48: 8B. 45, F8
        movzx   eax, byte [rax]                         ; 0516 _ 0F B6. 00
        mov     byte [rbp-19H], al                      ; 0519 _ 88. 45, E7
        mov     byte [rbp-1AH], 0                       ; 051C _ C6. 45, E6, 00
        mov     dword [rbp-14H], 0                      ; 0520 _ C7. 45, EC, 00000000
        jmp     ?_028                                   ; 0527 _ E9, 00000090

?_026:  mov     rax, qword [rbp-28H]                    ; 052C _ 48: 8B. 45, D8
        mov     rcx, qword [rax+8H]                     ; 0530 _ 48: 8B. 48, 08
        mov     eax, dword [rbp-14H]                    ; 0534 _ 8B. 45, EC
        movsxd  rdx, eax                                ; 0537 _ 48: 63. D0
        mov     rax, rdx                                ; 053A _ 48: 89. D0
        add     rax, rax                                ; 053D _ 48: 01. C0
        add     rax, rdx                                ; 0540 _ 48: 01. D0
        shl     rax, 2                                  ; 0543 _ 48: C1. E0, 02
        add     rax, rcx                                ; 0547 _ 48: 01. C8
        mov     edx, dword [rax]                        ; 054A _ 8B. 10
        mov     rax, qword [rbp-10H]                    ; 054C _ 48: 8B. 45, F0
        mov     eax, dword [rax]                        ; 0550 _ 8B. 00
        cmp     edx, eax                                ; 0552 _ 39. C2
        jnz     ?_027                                   ; 0554 _ 75, 62
        mov     rax, qword [rbp-28H]                    ; 0556 _ 48: 8B. 45, D8
        mov     rcx, qword [rax+8H]                     ; 055A _ 48: 8B. 48, 08
        mov     eax, dword [rbp-14H]                    ; 055E _ 8B. 45, EC
        movsxd  rdx, eax                                ; 0561 _ 48: 63. D0
        mov     rax, rdx                                ; 0564 _ 48: 89. D0
        add     rax, rax                                ; 0567 _ 48: 01. C0
        add     rax, rdx                                ; 056A _ 48: 01. D0
        shl     rax, 2                                  ; 056D _ 48: C1. E0, 02
        add     rax, rcx                                ; 0571 _ 48: 01. C8
        movzx   eax, byte [rax+8H]                      ; 0574 _ 0F B6. 40, 08
        cmp     byte [rbp-19H], al                      ; 0578 _ 38. 45, E7
        jnz     ?_027                                   ; 057B _ 75, 3B
        mov     rax, qword [rbp-28H]                    ; 057D _ 48: 8B. 45, D8
        mov     rcx, qword [rax]                        ; 0581 _ 48: 8B. 08
        mov     rax, qword [rbp-28H]                    ; 0584 _ 48: 8B. 45, D8
        mov     rsi, qword [rax+8H]                     ; 0588 _ 48: 8B. 70, 08
        mov     eax, dword [rbp-14H]                    ; 058C _ 8B. 45, EC
        movsxd  rdx, eax                                ; 058F _ 48: 63. D0
        mov     rax, rdx                                ; 0592 _ 48: 89. D0
        add     rax, rax                                ; 0595 _ 48: 01. C0
        add     rax, rdx                                ; 0598 _ 48: 01. D0
        shl     rax, 2                                  ; 059B _ 48: C1. E0, 02
        add     rax, rsi                                ; 059F _ 48: 01. F0
        mov     eax, dword [rax+4H]                     ; 05A2 _ 8B. 40, 04
        cdqe                                            ; 05A5 _ 48: 98
        shl     rax, 3                                  ; 05A7 _ 48: C1. E0, 03
        add     rax, rcx                                ; 05AB _ 48: 01. C8
        mov     qword [rbp-10H], rax                    ; 05AE _ 48: 89. 45, F0
        mov     byte [rbp-1AH], 1                       ; 05B2 _ C6. 45, E6, 01
        jmp     ?_029                                   ; 05B6 _ EB, 14

?_027:  add     dword [rbp-14H], 1                      ; 05B8 _ 83. 45, EC, 01
?_028:  mov     rax, qword [rbp-28H]                    ; 05BC _ 48: 8B. 45, D8
        mov     eax, dword [rax+14H]                    ; 05C0 _ 8B. 40, 14
        cmp     dword [rbp-14H], eax                    ; 05C3 _ 39. 45, EC
        jl      ?_026                                   ; 05C6 _ 0F 8C, FFFFFF60
?_029:  movzx   eax, byte [rbp-1AH]                     ; 05CC _ 0F B6. 45, E6
        xor     eax, 01H                                ; 05D0 _ 83. F0, 01
        test    al, al                                  ; 05D3 _ 84. C0
        jz      ?_030                                   ; 05D5 _ 74, 07
        mov     eax, 0                                  ; 05D7 _ B8, 00000000
        jmp     ?_032                                   ; 05DC _ EB, 1C

?_030:  add     qword [rbp-8H], 1                       ; 05DE _ 48: 83. 45, F8, 01
?_031:  mov     rax, qword [rbp-8H]                     ; 05E3 _ 48: 8B. 45, F8
        movzx   eax, byte [rax]                         ; 05E7 _ 0F B6. 00
        test    al, al                                  ; 05EA _ 84. C0
        jne     ?_025                                   ; 05EC _ 0F 85, FFFFFF20
        mov     rax, qword [rbp-10H]                    ; 05F2 _ 48: 8B. 45, F0
        movzx   eax, byte [rax+4H]                      ; 05F6 _ 0F B6. 40, 04
?_032:  pop     rbp                                     ; 05FA _ 5D
        ret                                             ; 05FB _ C3
; simulateDfa End of function

sameLanguage:; Function begin
        endbr64                                         ; 05FC _ F3: 0F 1E. FA
        push    rbp                                     ; 0600 _ 55
        mov     rbp, rsp                                ; 0601 _ 48: 89. E5
        mov     qword [rbp-8H], rdi                     ; 0604 _ 48: 89. 7D, F8
        mov     qword [rbp-10H], rsi                    ; 0608 _ 48: 89. 75, F0
        mov     eax, 0                                  ; 060C _ B8, 00000000
        pop     rbp                                     ; 0611 _ 5D
        ret                                             ; 0612 _ C3
; sameLanguage End of function


SECTION .data   align=1 noexec                          ; section number 2, data


SECTION .bss    align=1 noexec                          ; section number 3, bss


SECTION .rodata align=1 noexec                          ; section number 4, const

?_033:                                                  ; byte
        db 72H, 00H                                     ; 0000 _ r.

?_034:                                                  ; byte
        db 25H, 64H, 2CH, 25H, 64H, 0AH, 00H            ; 0002 _ %d,%d..

?_035:                                                  ; byte
        db 25H, 64H, 2CH, 00H                           ; 0009 _ %d,.

?_036:                                                  ; byte
        db 25H, 64H, 0AH, 00H                           ; 000D _ %d..

?_037:                                                  ; byte
        db 2CH, 00H                                     ; 0011 _ ,.

?_038:                                                  ; byte
        db 25H, 64H, 2CH, 25H, 64H, 2CH, 25H, 63H       ; 0013 _ %d,%d,%c
        db 00H                                          ; 001B _ .


SECTION .note.gnu.property align=8 noexec               ; section number 5, const

        db 04H, 00H, 00H, 00H, 10H, 00H, 00H, 00H       ; 0000 _ ........
        db 05H, 00H, 00H, 00H, 47H, 4EH, 55H, 00H       ; 0008 _ ....GNU.
        db 02H, 00H, 00H, 0C0H, 04H, 00H, 00H, 00H      ; 0010 _ ........
        db 03H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0018 _ ........


