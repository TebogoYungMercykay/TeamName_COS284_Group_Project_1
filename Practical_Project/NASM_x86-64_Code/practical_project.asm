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
; // This function will read the file and construct the DFA
; DFA* readDfa(const char* filename) {
;     FILE* myFile = fopen(filename, "r");
;     if (myFile == NULL) {
;         return NULL;
;     } else {
;         int numStates, numTransitions;
;         fscanf(myFile, "%d,%d\n", &numStates, &numTransitions);
;         // Allocate memory for the DFA structure
;         DFA* createDFA = (DFA* )malloc(sizeof(DFA));
;         if (createDFA == NULL) {
;             fclose(myFile);
;             return NULL;
;         } else {
;                 // Initialize DFA fields
;                 createDFA->numStates = numStates;
;                 createDFA->numTransitions = numTransitions;
;                 createDFA->startState = 0; // Starting state is always 0
;                 // Allocate memory for states and transitions
;                 createDFA->states = (State* )malloc(numStates* sizeof(State));
;                 createDFA->transitions = (Transition* )malloc(numTransitions* sizeof(Transition));

;                 if (createDFA->states == NULL || createDFA->transitions == NULL) {
;                         free(createDFA->states);
;                         free(createDFA->transitions);
;                         fclose(myFile);
;                         free(createDFA);
;                         return NULL;
;                 } else {
;                         // Read state IDs
;                         for (int i = 0; i < numStates; i++) {
;                                 if (i < numStates - 1) {
;                                         fscanf(myFile, "%d,", &createDFA->states[i].id);
;                                 } else {
;                                         fscanf(myFile, "%d\n", &createDFA->states[i].id);
;                                 }
;                                 // Initialize all states as non-accepting
;                                 createDFA->states[i].isAccepting = false;
;                         }
;                         // Read accepting state IDs
;                         char accept_states_line[256];
;                         if (fgets(accept_states_line, sizeof(accept_states_line), myFile) != NULL) {
;                                 char* token = strtok(accept_states_line, ",");
;                                 while (token != NULL) {
;                                         int state_id = atoi(token);
;                                         if (state_id >= 0 && state_id < numStates) {
;                                                 createDFA->states[state_id].isAccepting = true;
;                                         }
;                                         token = strtok(NULL, ",");
;                                 }
;                         }
;                         // Read transitions
;                         for (int i = 0; i < numTransitions; i++) {
;                                 int from, to;
;                                 char symbol;
;                                 fscanf(myFile, "%d,%d,%c", &from, &to, &symbol);
;                                 if (from >= 0 && from < numStates && to >= 0 && to < numStates) {
;                                         createDFA->transitions[i].from = from;
;                                         createDFA->transitions[i].to = to;
;                                         createDFA->transitions[i].symbol = symbol;
;                                 } else {
;                                         return NULL;
;                                 }
;                         }
;                 }
;         }
;         fclose(myFile);
;         return createDFA;
;     }
; }
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
; // This function will return true if the two DFA represent the same language, otherwise it will return false.
; bool sameLanguage(DFA* dfa1, DFA* dfa2) {
;         return false;
; }
; * Assembly Code: 64-bit x86 NASM -- STARTS HERE

default rel

; * Inports and Exports
global readDfa: function
global simulateDfa: function
global sameLanguage: function

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

; * The Read DFA Function
readDfa:; Function begin
        push    rbp
        mov     rbp, rsp
        sub     rsp, 352
        mov     qword [rbp-158H], rdi
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        mov     rax, qword [fs:abs 28H]
        mov     qword [rbp-8H], rax
        xor     eax, eax
        mov     rax, qword [rbp-158H]
        lea     rsi, [rel lbl_33]
        mov     rdi, rax
        call    fopen
        mov     qword [rbp-120H], rax
        cmp     qword [rbp-120H], 0
        jnz     lbl_1
        xor     eax, eax
        jmp     lbl_16

lbl_1:  lea     rcx, [rbp-140H]
        lea     rdx, [rbp-144H]
        mov     rax, qword [rbp-120H]
        lea     rsi, [rel lbl_34]
        mov     rdi, rax
        xor     eax, eax
        call    __isoc99_fscanf
        mov     edi, 32
        call    malloc
        mov     qword [rbp-118H], rax
        cmp     qword [rbp-118H], 0
        jnz     lbl_2
        mov     rax, qword [rbp-120H]
        mov     rdi, rax
        call    fclose
        xor     eax, eax
        jmp     lbl_16

lbl_2:  mov     edx, dword [rbp-144H]
        mov     rax, qword [rbp-118H]
        mov     dword [rax+10H], edx
        mov     edx, dword [rbp-140H]
        mov     rax, qword [rbp-118H]
        mov     dword [rax+14H], edx
        mov     rax, qword [rbp-118H]
        mov     dword [rax+18H], 0
        mov     eax, dword [rbp-144H]
        cdqe
        shl     rax, 3
        mov     rdi, rax
        call    malloc
        mov     rdx, rax
        mov     rax, qword [rbp-118H]
        mov     qword [rax], rdx
        mov     eax, dword [rbp-140H]
        movsxd  rdx, eax
        mov     rax, rdx
        add     rax, rax
        add     rax, rdx
        shl     rax, 2
        mov     rdi, rax
        call    malloc
        mov     rdx, rax
        mov     rax, qword [rbp-118H]
        mov     qword [rax+8H], rdx
        mov     rax, qword [rbp-118H]
        mov     rax, qword [rax]
        test    rax, rax
        jz      lbl_3
        mov     rax, qword [rbp-118H]
        mov     rax, qword [rax+8H]
        test    rax, rax
        jnz     lbl_4
lbl_3:  mov     rax, qword [rbp-118H]
        mov     rax, qword [rax]
        mov     rdi, rax
        call    free
        mov     rax, qword [rbp-118H]
        mov     rax, qword [rax+8H]
        mov     rdi, rax
        call    free
        mov     rax, qword [rbp-120H]
        mov     rdi, rax
        call    fclose
        mov     rax, qword [rbp-118H]
        mov     rdi, rax
        call    free
        xor     eax, eax
        jmp     lbl_16

lbl_4:  mov     dword [rbp-134H], 0
        jmp     lbl_8

lbl_5:  mov     eax, dword [rbp-144H]
        sub     eax, 1
        cmp     dword [rbp-134H], eax
        jge     lbl_6
        mov     rax, qword [rbp-118H]
        mov     rax, qword [rax]
        mov     edx, dword [rbp-134H]
        movsxd  rdx, edx
        shl     rdx, 3
        add     rax, rdx
        mov     rdx, rax
        mov     rax, qword [rbp-120H]
        lea     rsi, [rel lbl_35]
        mov     rdi, rax
        xor     eax, eax
        call    __isoc99_fscanf
        jmp     lbl_7

lbl_6:  mov     rax, qword [rbp-118H]
        mov     rax, qword [rax]
        mov     edx, dword [rbp-134H]
        movsxd  rdx, edx
        shl     rdx, 3
        add     rax, rdx
        mov     rdx, rax
        mov     rax, qword [rbp-120H]
        lea     rsi, [rel lbl_36]
        mov     rdi, rax
        xor     eax, eax
        call    __isoc99_fscanf
lbl_7:  mov     rax, qword [rbp-118H]
        mov     rax, qword [rax]
        mov     edx, dword [rbp-134H]
        movsxd  rdx, edx
        shl     rdx, 3
        add     rax, rdx
        mov     byte [rax+4H], 0
        add     dword [rbp-134H], 1
lbl_8:  mov     eax, dword [rbp-144H]
        cmp     dword [rbp-134H], eax
        jl      lbl_5
        mov     rdx, qword [rbp-120H]
        lea     rax, [rbp-110H]
        mov     esi, 256
        mov     rdi, rax
        call    fgets
        test    rax, rax
        je      lbl_12
        lea     rax, [rbp-110H]
        lea     rsi, [rel lbl_37]
        mov     rdi, rax
        call    strtok
        mov     qword [rbp-128H], rax
        jmp     lbl_11

lbl_9:  mov     rax, qword [rbp-128H]
        mov     rdi, rax
        call    atoi
        mov     dword [rbp-12CH], eax
        cmp     dword [rbp-12CH], 0
        js      lbl_10
        mov     eax, dword [rbp-144H]
        cmp     dword [rbp-12CH], eax
        jge     lbl_10
        mov     rax, qword [rbp-118H]
        mov     rax, qword [rax]
        mov     edx, dword [rbp-12CH]
        movsxd  rdx, edx
        shl     rdx, 3
        add     rax, rdx
        mov     byte [rax+4H], 1
lbl_10: lea     rsi, [rel lbl_37]
        mov     edi, 0
        call    strtok
        mov     qword [rbp-128H], rax
lbl_11: cmp     qword [rbp-128H], 0
        jnz     lbl_9
lbl_12: mov     dword [rbp-130H], 0
        jmp     lbl_15

lbl_13: lea     rsi, [rbp-145H]
        lea     rcx, [rbp-138H]
        lea     rdx, [rbp-13CH]
        mov     rax, qword [rbp-120H]
        mov     r8, rsi
        lea     rsi, [rel lbl_38]
        mov     rdi, rax
        xor     eax, eax
        call    __isoc99_fscanf
        mov     eax, dword [rbp-13CH]
        test    eax, eax
        js      lbl_14
        mov     edx, dword [rbp-13CH]
        mov     eax, dword [rbp-144H]
        cmp     edx, eax
        jge     lbl_14
        mov     eax, dword [rbp-138H]
        test    eax, eax
        js      lbl_14
        mov     edx, dword [rbp-138H]
        mov     eax, dword [rbp-144H]
        cmp     edx, eax
        jge     lbl_14
        mov     rax, qword [rbp-118H]
        mov     rcx, qword [rax+8H]
        mov     eax, dword [rbp-130H]
        movsxd  rdx, eax
        mov     rax, rdx
        add     rax, rax
        add     rax, rdx
        shl     rax, 2
        lea     rdx, [rcx+rax]
        mov     eax, dword [rbp-13CH]
        mov     dword [rdx], eax
        mov     rax, qword [rbp-118H]
        mov     rcx, qword [rax+8H]
        mov     eax, dword [rbp-130H]
        movsxd  rdx, eax
        mov     rax, rdx
        add     rax, rax
        add     rax, rdx
        shl     rax, 2
        lea     rdx, [rcx+rax]
        mov     eax, dword [rbp-138H]
        mov     dword [rdx+4H], eax
        mov     rax, qword [rbp-118H]
        mov     rcx, qword [rax+8H]
        mov     eax, dword [rbp-130H]
        movsxd  rdx, eax
        mov     rax, rdx
        add     rax, rax
        add     rax, rdx
        shl     rax, 2
        lea     rdx, [rcx+rax]
        movzx   eax, byte [rbp-145H]
        mov     byte [rdx+8H], al
        add     dword [rbp-130H], 1
        jmp     lbl_15

lbl_14: xor     eax, eax
        jmp     lbl_16

lbl_15: mov     eax, dword [rbp-140H]
        cmp     dword [rbp-130H], eax
        jl      lbl_13
        mov     rax, qword [rbp-120H]
        mov     rdi, rax
        call    fclose
        mov     rax, qword [rbp-118H]
lbl_16: mov     rsi, qword [rbp-8H]
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        xor     rsi, qword [fs:abs 28H]
        jz      lbl_17
        call    __stack_chk_fail
lbl_17: leave
        ret
; readDfa End of function

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

; * The Same Language Function
sameLanguage:; Function begin
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        xor     eax, eax
        pop     rbp
        ret
; sameLanguage End of function

; * Sections
SECTION .data   align=1 noexec

SECTION .bss    align=1 noexec

SECTION .rodata align=1 noexec

lbl_33:
        db 72H, 00H

lbl_34:
        db 25H, 64H, 2CH, 25H, 64H, 0AH, 00H

lbl_35:
        db 25H, 64H, 2CH, 00H

lbl_36:
        db 25H, 64H, 0AH, 00H

lbl_37:
        db 2CH, 00H

lbl_38:
        db 25H, 64H, 2CH, 25H, 64H, 2CH, 25H, 63H
        db 00H

SECTION .note.gnu.property align=8 noexec

        db 04H, 00H, 00H, 00H, 10H, 00H, 00H, 00H
        db 05H, 00H, 00H, 00H, 47H, 4EH, 55H, 00H
        db 02H, 00H, 00H, 0C0H, 04H, 00H, 00H, 00H
        db 03H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
