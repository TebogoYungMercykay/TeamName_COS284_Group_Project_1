; Disassembly of file: main.o
; Mon Oct 30 23:20:52 2023
; Type: ELF64
; Syntax: NASM
; Instruction set: 80386, x64

default rel

global sameLanguage: function


SECTION .text   align=1 exec                            ; section number 1, code

sameLanguage:; Function begin
        endbr64                                         ; 0000 _ F3: 0F 1E. FA
        push    rbp                                     ; 0004 _ 55
        mov     rbp, rsp                                ; 0005 _ 48: 89. E5
        mov     qword [rbp-28H], rdi                    ; 0008 _ 48: 89. 7D, D8
        mov     qword [rbp-30H], rsi                    ; 000C _ 48: 89. 75, D0
        mov     rax, qword [rbp-28H]                    ; 0010 _ 48: 8B. 45, D8
        mov     edx, dword [rax+10H]                    ; 0014 _ 8B. 50, 10
        mov     rax, qword [rbp-30H]                    ; 0017 _ 48: 8B. 45, D0
        mov     eax, dword [rax+10H]                    ; 001B _ 8B. 40, 10
        cmp     edx, eax                                ; 001E _ 39. C2
        jnz     ?_001                                   ; 0020 _ 75, 12
        mov     rax, qword [rbp-28H]                    ; 0022 _ 48: 8B. 45, D8
        mov     edx, dword [rax+14H]                    ; 0026 _ 8B. 50, 14
        mov     rax, qword [rbp-30H]                    ; 0029 _ 48: 8B. 45, D0
        mov     eax, dword [rax+14H]                    ; 002D _ 8B. 40, 14
        cmp     edx, eax                                ; 0030 _ 39. C2
        jz      ?_002                                   ; 0032 _ 74, 0A
?_001:  mov     eax, 0                                  ; 0034 _ B8, 00000000
        jmp     ?_017                                   ; 0039 _ E9, 000001B8

?_002:  mov     dword [rbp-10H], 0                      ; 003E _ C7. 45, F0, 00000000
        jmp     ?_009                                   ; 0045 _ EB, 6C

?_003:  mov     byte [rbp-12H], 0                       ; 0047 _ C6. 45, EE, 00
        mov     dword [rbp-0CH], 0                      ; 004B _ C7. 45, F4, 00000000
        jmp     ?_006                                   ; 0052 _ EB, 3A

?_004:  mov     rax, qword [rbp-28H]                    ; 0054 _ 48: 8B. 45, D8
        mov     rax, qword [rax]                        ; 0058 _ 48: 8B. 00
        mov     edx, dword [rbp-10H]                    ; 005B _ 8B. 55, F0
        movsxd  rdx, edx                                ; 005E _ 48: 63. D2
        shl     rdx, 3                                  ; 0061 _ 48: C1. E2, 03
        add     rax, rdx                                ; 0065 _ 48: 01. D0
        mov     edx, dword [rax]                        ; 0068 _ 8B. 10
        mov     rax, qword [rbp-30H]                    ; 006A _ 48: 8B. 45, D0
        mov     rax, qword [rax]                        ; 006E _ 48: 8B. 00
        mov     ecx, dword [rbp-0CH]                    ; 0071 _ 8B. 4D, F4
        movsxd  rcx, ecx                                ; 0074 _ 48: 63. C9
        shl     rcx, 3                                  ; 0077 _ 48: C1. E1, 03
        add     rax, rcx                                ; 007B _ 48: 01. C8
        mov     eax, dword [rax]                        ; 007E _ 8B. 00
        cmp     edx, eax                                ; 0080 _ 39. C2
        jnz     ?_005                                   ; 0082 _ 75, 06
        mov     byte [rbp-12H], 1                       ; 0084 _ C6. 45, EE, 01
        jmp     ?_007                                   ; 0088 _ EB, 10

?_005:  add     dword [rbp-0CH], 1                      ; 008A _ 83. 45, F4, 01
?_006:  mov     rax, qword [rbp-30H]                    ; 008E _ 48: 8B. 45, D0
        mov     eax, dword [rax+10H]                    ; 0092 _ 8B. 40, 10
        cmp     dword [rbp-0CH], eax                    ; 0095 _ 39. 45, F4
        jl      ?_004                                   ; 0098 _ 7C, BA
?_007:  movzx   eax, byte [rbp-12H]                     ; 009A _ 0F B6. 45, EE
        xor     eax, 01H                                ; 009E _ 83. F0, 01
        test    al, al                                  ; 00A1 _ 84. C0
        jz      ?_008                                   ; 00A3 _ 74, 0A
        mov     eax, 0                                  ; 00A5 _ B8, 00000000
        jmp     ?_017                                   ; 00AA _ E9, 00000147

?_008:  add     dword [rbp-10H], 1                      ; 00AF _ 83. 45, F0, 01
?_009:  mov     rax, qword [rbp-28H]                    ; 00B3 _ 48: 8B. 45, D8
        mov     eax, dword [rax+10H]                    ; 00B7 _ 8B. 40, 10
        cmp     dword [rbp-10H], eax                    ; 00BA _ 39. 45, F0
        jl      ?_003                                   ; 00BD _ 7C, 88
        mov     dword [rbp-8H], 0                       ; 00BF _ C7. 45, F8, 00000000
        jmp     ?_016                                   ; 00C6 _ E9, 00000116

?_010:  mov     byte [rbp-11H], 0                       ; 00CB _ C6. 45, EF, 00
        mov     dword [rbp-4H], 0                       ; 00CF _ C7. 45, FC, 00000000
        jmp     ?_013                                   ; 00D6 _ E9, 000000E0

?_011:  mov     rax, qword [rbp-28H]                    ; 00DB _ 48: 8B. 45, D8
        mov     rcx, qword [rax+8H]                     ; 00DF _ 48: 8B. 48, 08
        mov     eax, dword [rbp-8H]                     ; 00E3 _ 8B. 45, F8
        movsxd  rdx, eax                                ; 00E6 _ 48: 63. D0
        mov     rax, rdx                                ; 00E9 _ 48: 89. D0
        add     rax, rax                                ; 00EC _ 48: 01. C0
        add     rax, rdx                                ; 00EF _ 48: 01. D0
        shl     rax, 2                                  ; 00F2 _ 48: C1. E0, 02
        add     rax, rcx                                ; 00F6 _ 48: 01. C8
        mov     ecx, dword [rax]                        ; 00F9 _ 8B. 08
        mov     rax, qword [rbp-30H]                    ; 00FB _ 48: 8B. 45, D0
        mov     rsi, qword [rax+8H]                     ; 00FF _ 48: 8B. 70, 08
        mov     eax, dword [rbp-4H]                     ; 0103 _ 8B. 45, FC
        movsxd  rdx, eax                                ; 0106 _ 48: 63. D0
        mov     rax, rdx                                ; 0109 _ 48: 89. D0
        add     rax, rax                                ; 010C _ 48: 01. C0
        add     rax, rdx                                ; 010F _ 48: 01. D0
        shl     rax, 2                                  ; 0112 _ 48: C1. E0, 02
        add     rax, rsi                                ; 0116 _ 48: 01. F0
        mov     eax, dword [rax]                        ; 0119 _ 8B. 00
        cmp     ecx, eax                                ; 011B _ 39. C1
        jne     ?_012                                   ; 011D _ 0F 85, 00000094
        mov     rax, qword [rbp-28H]                    ; 0123 _ 48: 8B. 45, D8
        mov     rcx, qword [rax+8H]                     ; 0127 _ 48: 8B. 48, 08
        mov     eax, dword [rbp-8H]                     ; 012B _ 8B. 45, F8
        movsxd  rdx, eax                                ; 012E _ 48: 63. D0
        mov     rax, rdx                                ; 0131 _ 48: 89. D0
        add     rax, rax                                ; 0134 _ 48: 01. C0
        add     rax, rdx                                ; 0137 _ 48: 01. D0
        shl     rax, 2                                  ; 013A _ 48: C1. E0, 02
        add     rax, rcx                                ; 013E _ 48: 01. C8
        mov     ecx, dword [rax+4H]                     ; 0141 _ 8B. 48, 04
        mov     rax, qword [rbp-30H]                    ; 0144 _ 48: 8B. 45, D0
        mov     rsi, qword [rax+8H]                     ; 0148 _ 48: 8B. 70, 08
        mov     eax, dword [rbp-4H]                     ; 014C _ 8B. 45, FC
        movsxd  rdx, eax                                ; 014F _ 48: 63. D0
        mov     rax, rdx                                ; 0152 _ 48: 89. D0
        add     rax, rax                                ; 0155 _ 48: 01. C0
        add     rax, rdx                                ; 0158 _ 48: 01. D0
        shl     rax, 2                                  ; 015B _ 48: C1. E0, 02
        add     rax, rsi                                ; 015F _ 48: 01. F0
        mov     eax, dword [rax+4H]                     ; 0162 _ 8B. 40, 04
        cmp     ecx, eax                                ; 0165 _ 39. C1
        jnz     ?_012                                   ; 0167 _ 75, 4E
        mov     rax, qword [rbp-28H]                    ; 0169 _ 48: 8B. 45, D8
        mov     rcx, qword [rax+8H]                     ; 016D _ 48: 8B. 48, 08
        mov     eax, dword [rbp-8H]                     ; 0171 _ 8B. 45, F8
        movsxd  rdx, eax                                ; 0174 _ 48: 63. D0
        mov     rax, rdx                                ; 0177 _ 48: 89. D0
        add     rax, rax                                ; 017A _ 48: 01. C0
        add     rax, rdx                                ; 017D _ 48: 01. D0
        shl     rax, 2                                  ; 0180 _ 48: C1. E0, 02
        add     rax, rcx                                ; 0184 _ 48: 01. C8
        movzx   ecx, byte [rax+8H]                      ; 0187 _ 0F B6. 48, 08
        mov     rax, qword [rbp-30H]                    ; 018B _ 48: 8B. 45, D0
        mov     rsi, qword [rax+8H]                     ; 018F _ 48: 8B. 70, 08
        mov     eax, dword [rbp-4H]                     ; 0193 _ 8B. 45, FC
        movsxd  rdx, eax                                ; 0196 _ 48: 63. D0
        mov     rax, rdx                                ; 0199 _ 48: 89. D0
        add     rax, rax                                ; 019C _ 48: 01. C0
        add     rax, rdx                                ; 019F _ 48: 01. D0
        shl     rax, 2                                  ; 01A2 _ 48: C1. E0, 02
        add     rax, rsi                                ; 01A6 _ 48: 01. F0
        movzx   eax, byte [rax+8H]                      ; 01A9 _ 0F B6. 40, 08
        cmp     cl, al                                  ; 01AD _ 38. C1
        jnz     ?_012                                   ; 01AF _ 75, 06
        mov     byte [rbp-11H], 1                       ; 01B1 _ C6. 45, EF, 01
        jmp     ?_014                                   ; 01B5 _ EB, 14

?_012:  add     dword [rbp-4H], 1                       ; 01B7 _ 83. 45, FC, 01
?_013:  mov     rax, qword [rbp-30H]                    ; 01BB _ 48: 8B. 45, D0
        mov     eax, dword [rax+14H]                    ; 01BF _ 8B. 40, 14
        cmp     dword [rbp-4H], eax                     ; 01C2 _ 39. 45, FC
        jl      ?_011                                   ; 01C5 _ 0F 8C, FFFFFF10
?_014:  movzx   eax, byte [rbp-11H]                     ; 01CB _ 0F B6. 45, EF
        xor     eax, 01H                                ; 01CF _ 83. F0, 01
        test    al, al                                  ; 01D2 _ 84. C0
        jz      ?_015                                   ; 01D4 _ 74, 07
        mov     eax, 0                                  ; 01D6 _ B8, 00000000
        jmp     ?_017                                   ; 01DB _ EB, 19

?_015:  add     dword [rbp-8H], 1                       ; 01DD _ 83. 45, F8, 01
?_016:  mov     rax, qword [rbp-28H]                    ; 01E1 _ 48: 8B. 45, D8
        mov     eax, dword [rax+14H]                    ; 01E5 _ 8B. 40, 14
        cmp     dword [rbp-8H], eax                     ; 01E8 _ 39. 45, F8
        jl      ?_010                                   ; 01EB _ 0F 8C, FFFFFEDA
        mov     eax, 1                                  ; 01F1 _ B8, 00000001
?_017:  pop     rbp                                     ; 01F6 _ 5D
        ret                                             ; 01F7 _ C3
; sameLanguage End of function


SECTION .data   align=1 noexec                          ; section number 2, data


SECTION .bss    align=1 noexec                          ; section number 3, bss


SECTION .note.gnu.property align=8 noexec               ; section number 4, const

        db 04H, 00H, 00H, 00H, 10H, 00H, 00H, 00H       ; 0000 _ ........
        db 05H, 00H, 00H, 00H, 47H, 4EH, 55H, 00H       ; 0008 _ ....GNU.
        db 02H, 00H, 00H, 0C0H, 04H, 00H, 00H, 00H      ; 0010 _ ........
        db 03H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0018 _ ........


