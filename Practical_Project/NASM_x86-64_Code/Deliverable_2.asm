; * We wrote the Code in C and used objconv to convert it to 64-bit x86 NASM
; Disassembly of file: main.o
; Sun Oct  1 10:32:25 2023
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
; // This function will simulate the input string over the DFA
; bool simulateDfa(DFA* dfa, const char* inputString) {
;         if (dfa == NULL || inputString == NULL) {
;                 return false;
;         } else {
;                 State *currentState = NULL;
;                 for(int i = 0; i < dfa->numStates; i++) {
;                         if(dfa->states[i].id == dfa->startState) {
;                                 currentState = &(dfa->states[i]);
;                                 break;
;                         }
;                 }
;                 if (currentState == NULL) {
;                         return false;
;                 } else {
;                         for(const char *c = inputString; *c != '\0'; c++) {
;                                 char symbol = *c;
;                                 bool transitionFound = false;
;                                 // Check transitions
;                                 for(int i = 0; i < dfa->numTransitions; i++) {
;                                         if(dfa->transitions[i].from == currentState->id && dfa->transitions[i].symbol == symbol) {
;                                                 currentState = &(dfa->states[dfa->transitions[i].to]);
;                                                 transitionFound = true;
;                                                 break;
;                                         }
;                                 }
;                                 // No valid transition found for the symbol
;                                 if(!transitionFound) {
;                                         return false;
;                                 }
;                         }
;                 }
;                 // Check if the final state is an accepting state
;                 return currentState->isAccepting;
;         }
; }
; * Assembly Code: 64-bit x86 NASM -- STARTS HERE

default rel

; * Inports and Exports
global simulateDfa: function

extern __stack_chk_fail
extern atoi
extern strtok
extern fgets
extern free
extern fclose
extern malloc
extern __isoc99_fscanf
extern fopen
extern _GLOBAL_OFFSET_TABLE_

SECTION .text   align=1 exec

; * The Simulate DFA Function
simulateDfa:; Function begin
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-28H], rdi
        mov     qword [rbp-30H], rsi
        cmp     qword [rbp-28H], 0
        jz      lbl_18
        cmp     qword [rbp-30H], 0
        jnz     lbl_19
lbl_18: xor     eax, eax
        jmp     lbl_32

lbl_19: mov     qword [rbp-10H], 0
        mov     dword [rbp-18H], 0
        jmp     lbl_22

lbl_20: mov     rax, qword [rbp-28H]
        mov     rax, qword [rax]
        mov     edx, dword [rbp-18H]
        movsxd  rdx, edx
        shl     rdx, 3
        add     rax, rdx
        mov     edx, dword [rax]
        mov     rax, qword [rbp-28H]
        mov     eax, dword [rax+18H]
        cmp     edx, eax
        jnz     lbl_21
        mov     rax, qword [rbp-28H]
        mov     rax, qword [rax]
        mov     edx, dword [rbp-18H]
        movsxd  rdx, edx
        shl     rdx, 3
        add     rax, rdx
        mov     qword [rbp-10H], rax
        jmp     lbl_23

lbl_21: add     dword [rbp-18H], 1
lbl_22: mov     rax, qword [rbp-28H]
        mov     eax, dword [rax+10H]
        cmp     dword [rbp-18H], eax
        jl      lbl_20
lbl_23: cmp     qword [rbp-10H], 0
        jnz     lbl_24
        xor     eax, eax
        jmp     lbl_32

lbl_24: mov     rax, qword [rbp-30H]
        mov     qword [rbp-8H], rax
        jmp     lbl_31

lbl_25: mov     rax, qword [rbp-8H]
        movzx   eax, byte [rax]
        mov     byte [rbp-19H], al
        mov     byte [rbp-1AH], 0
        mov     dword [rbp-14H], 0
        jmp     lbl_28

lbl_26: mov     rax, qword [rbp-28H]
        mov     rcx, qword [rax+8H]
        mov     eax, dword [rbp-14H]
        movsxd  rdx, eax
        mov     rax, rdx
        add     rax, rax
        add     rax, rdx
        shl     rax, 2
        add     rax, rcx
        mov     edx, dword [rax]
        mov     rax, qword [rbp-10H]
        mov     eax, dword [rax]
        cmp     edx, eax
        jnz     lbl_27
        mov     rax, qword [rbp-28H]
        mov     rcx, qword [rax+8H]
        mov     eax, dword [rbp-14H]
        movsxd  rdx, eax
        mov     rax, rdx
        add     rax, rax
        add     rax, rdx
        shl     rax, 2
        add     rax, rcx
        movzx   eax, byte [rax+8H]
        cmp     byte [rbp-19H], al
        jnz     lbl_27
        mov     rax, qword [rbp-28H]
        mov     rcx, qword [rax]
        mov     rax, qword [rbp-28H]
        mov     rsi, qword [rax+8H]
        mov     eax, dword [rbp-14H]
        movsxd  rdx, eax
        mov     rax, rdx
        add     rax, rax
        add     rax, rdx
        shl     rax, 2
        add     rax, rsi
        mov     eax, dword [rax+4H]
        cdqe
        shl     rax, 3
        add     rax, rcx
        mov     qword [rbp-10H], rax
        mov     byte [rbp-1AH], 1
        jmp     lbl_29

lbl_27: add     dword [rbp-14H], 1
lbl_28: mov     rax, qword [rbp-28H]
        mov     eax, dword [rax+14H]
        cmp     dword [rbp-14H], eax
        jl      lbl_26
lbl_29: movzx   eax, byte [rbp-1AH]
        xor     eax, 01H
        test    al, al
        jz      lbl_30
        xor     eax, eax
        jmp     lbl_32

lbl_30: add     qword [rbp-8H], 1
lbl_31: mov     rax, qword [rbp-8H]
        movzx   eax, byte [rax]
        test    al, al
        jne     lbl_25
        mov     rax, qword [rbp-10H]
        movzx   eax, byte [rax+4H]
lbl_32: pop     rbp
        ret
; simulateDfa End of function
