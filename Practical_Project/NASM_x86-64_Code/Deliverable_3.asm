; * We wrote the Code in C and used objconv to convert it to 64-bit x86 NASM
; Disassembly of file: main.o
; Mon Oct 30 23:20:52 2023
; Type: ELF64
; Syntax: NASM
; Instruction set: 80386, x64
; * C Code
; * https://github.com/TebogoYungMercykay/TeamName_COS284_Group_Project_1.git
; * root_folder/Practical_Project/Implementation_in_C/files_here
; typedef struct
; {
;     int id;
;     bool isAccepting;
; } State;
; // Transition Structure
; typedef struct
; {
;     int from;
;     int to;
;     char symbol;
; } Transition;
; // DFA Structure
; typedef struct
; {
;     State *states;
;     Transition *transitions;
;     int numStates;
;     int numTransitions;
;     int startState;
; } DFA;
; // This function will return true if the two DFA represent the same language, otherwise it will return false.
; bool sameLanguage(DFA *dfa1, DFA *dfa2) {
;     if (dfa1->numStates != dfa2->numStates || dfa1->numTransitions != dfa2->numTransitions) {
;         return false;
;     }
;     for (int i = 0; i < dfa1->numStates; i++) {
;         bool found = false;
;         for (int j = 0; j < dfa2->numStates; j++) {
;             if (dfa1->states[i].id == dfa2->states[j].id) {
;                 found = true;
;                 break;
;             }
;         }
;         if (!found) {
;             return false;
;         }
;     }
;     for (int i = 0; i < dfa1->numTransitions; i++) {
;         bool found = false;
;         for (int j = 0; j < dfa2->numTransitions; j++) {
;             if (dfa1->transitions[i].from == dfa2->transitions[j].from &&
;                 dfa1->transitions[i].to == dfa2->transitions[j].to &&
;                 dfa1->transitions[i].symbol == dfa2->transitions[j].symbol) {
;                 found = true;
;                 break;
;             }
;         }
;         if (!found) {
;             return false;
;         }
;     }
;     return true;
; }
; * Assembly Code: 64-bit x86 NASM -- STARTS HERE

default rel

; * Inports and Exports
default rel

global sameLanguage: function

SECTION .text   align=1 exec

; * The Same Language Function
sameLanguage:; Function begin
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-28H], rdi
        mov     qword [rbp-30H], rsi
        mov     rax, qword [rbp-28H]
        mov     edx, dword [rax+10H]
        mov     rax, qword [rbp-30H]
        mov     eax, dword [rax+10H]
        cmp     edx, eax
        jnz     lablel_01
        mov     rax, qword [rbp-28H]
        mov     edx, dword [rax+14H]
        mov     rax, qword [rbp-30H]
        mov     eax, dword [rax+14H]
        cmp     edx, eax
        jz      lablel_02
lablel_01:  xor     eax, eax
        jmp     lablel_17

lablel_02:  mov     dword [rbp-10H], 0
        jmp     lablel_09

lablel_03:  mov     byte [rbp-12H], 0
        mov     dword [rbp-0CH], 0
        jmp     lablel_06

lablel_04:  mov     rax, qword [rbp-28H]
        mov     rax, qword [rax]
        mov     edx, dword [rbp-10H]
        movsxd  rdx, edx
        shl     rdx, 3
        add     rax, rdx
        mov     edx, dword [rax]
        mov     rax, qword [rbp-30H]
        mov     rax, qword [rax]
        mov     ecx, dword [rbp-0CH]
        movsxd  rcx, ecx
        shl     rcx, 3
add     rax, rcx
mov     eax, dword [rax]
cmp     edx, eax
jnz     lablel_05
mov     byte [rbp-12H], 1
jmp     lablel_07

lablel_05:  add     dword [rbp-0CH], 1
lablel_06:  mov     rax, qword [rbp-30H]
        mov     eax, dword [rax+10H]
        cmp     dword [rbp-0CH], eax
        jl      lablel_04
lablel_07:  movzx   eax, byte [rbp-12H]
        xor     eax, 01H
        test    al, al
        jz      lablel_08
        xor     eax, eax
        jmp     lablel_17

lablel_08:  add     dword [rbp-10H], 1
lablel_09:  mov     rax, qword [rbp-28H]
        mov     eax, dword [rax+10H]
        cmp     dword [rbp-10H], eax
        jl      lablel_03
        mov     dword [rbp-8H], 0
        jmp     lablel_16

lablel_10:  mov     byte [rbp-11H], 0
        mov     dword [rbp-4H], 0
        jmp     lablel_13

lablel_11:  mov     rax, qword [rbp-28H]
        mov     rcx, qword [rax+8H]
        mov     eax, dword [rbp-8H]
        movsxd  rdx, eax
        mov     rax, rdx
        add     rax, rax
        add     rax, rdx
        shl     rax, 2
        add     rax, rcx
        mov     ecx, dword [rax]
        mov     rax, qword [rbp-30H]
        mov     rsi, qword [rax+8H]
        mov     eax, dword [rbp-4H]
        movsxd  rdx, eax
        mov     rax, rdx
        add     rax, rax
        add     rax, rdx
        shl     rax, 2
        add     rax, rsi
        mov     eax, dword [rax]
        cmp     ecx, eax
        jne     lablel_12

        mov     rax, qword [rbp-28H]
        mov     rcx, qword [rax+8H]
        mov     eax, dword [rbp-8H]
        movsxd  rdx, eax
        mov     rax, rdx
        add     rax, rax
        add     rax, rdx
        shl     rax, 2
        add     rax, rcx
        mov     ecx, dword [rax+4H]
        mov     rax, qword [rbp-30H]
        mov     rsi, qword [rax+8H]
        mov     eax, dword [rbp-4H]
        movsxd  rdx, eax
        mov     rax, rdx
        add     rax, rax
        add     rax, rdx
        shl     rax, 2
        add     rax, rsi
        mov     eax, dword [rax+4H]
        cmp     ecx, eax
        jnz     lablel_12

        mov     rax, qword [rbp-28H]
        mov     rcx, qword [rax+8H]
        mov     eax, dword [rbp-8H]
        movsxd  rdx, eax
        mov     rax, rdx
        add     rax, rax
        add     rax, rdx
        shl     rax, 2
        add     rax, rcx
        movzx   ecx, byte [rax+8H]
        mov     rax, qword [rbp-30H]
        mov     rsi, qword [rax+8H]
        mov     eax, dword [rbp-4H]
        movsxd  rdx, eax
        mov     rax, rdx
        add     rax, rax
        add     rax, rdx
        shl     rax, 2
        add     rax, rsi
        movzx   eax, byte [rax+8H]
        cmp     cl, al
        jnz     lablel_12
        mov     byte [rbp-11H], 1
        jmp     lablel_14

lablel_12:  add     dword [rbp-4H], 1
lablel_13:  mov     rax, qword [rbp-30H]
        mov     eax, dword [rax+14H]
        cmp     dword [rbp-4H], eax
        jl      lablel_11
lablel_14:  movzx   eax, byte [rbp-11H]
        xor     eax, 01H
        test    al, al
        jz      lablel_15
        mov     eax, 0
        jmp     lablel_17

lablel_15:  add     dword [rbp-8H], 1
lablel_16:  mov     rax, qword [rbp-28H]
        mov     eax, dword [rax+14H]
        cmp     dword [rbp-8H], eax
        jl      lablel_10
        mov     eax, 1
lablel_17:  pop     rbp
        ret
; sameLanguage End of function
