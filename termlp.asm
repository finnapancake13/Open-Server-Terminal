; Open Server Terminal ver 1.00
; use this source in your programs or alterration distros. using a direct copy and distributing is not allowed.

; the following messages will be shown and performed at boot:

; OST ver <version>
;
; Enter username:
; Enter password:
; <if user cfg setup> Successfully logged in to <username>
; <if user cfg not setup> Successfully created account <username>
; once logged in start loop:

; 8086 assembly .bss bullshit here

ostloop:
    ; ask kernel for input, info get's pushed to stack
    pop eax
    cmp eax, cvers
    je version
    
    version:
        ; tell kernel to print vers
        ret
    
    jmp ostloop
    
    
;8086 define data bullshit here
    cvers:  db 'version'
    vers:   db 'OST Version 1.00 is running'
    
