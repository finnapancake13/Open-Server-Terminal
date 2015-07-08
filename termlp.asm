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
    pop eax ; Load first argument
    cmp eax, cvers
    je version
    cmp eax, chelp
    je help
    cmp eax, cexit
    je exit
    
    move ebx, unkno
    jmp print
    
    version:
        mov ebx, vers
        jmp print
        ret
    help:
        move ebx, help
        jmp print
        ret
    exit:
        move ebx, emsg
        jmp print
        jmp endloop
        
    print:
        ; print data from ebx using kernel
        ret
    
    jmp ostloop
endloop:
    
    
;8086 define data bullshit here
    unkno:  db 'Unknown command. Execute "commands" to see a list of usable commands'
    cexit:  db 'stop'
    cvers:  db 'version'
    chelp:  db 'help'
    emsg:   db 'Exiting OST'
    vers:   db 'OST Version 1.00 is running'
    help:   db 'OST, or Open Server Terminal is a text-based open source operating system written in assembly code for developers and servers by an online github users. Visit the github of OST to report bugs or contact the developer. Type "command" to get a list of usable commands.'
    
