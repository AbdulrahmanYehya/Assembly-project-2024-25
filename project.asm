.model small
.stack 100h
.data
    prompt db "Pick a nuber between 1 and 9:$"
    correct_msg db "Correct number$"
    too_high_msg db "too high$"
    too_low_msg db "too low$"
    new_line db 0Dh, 0Ah, '$'  
    secret_number db 5          
    guess db 0                  

.code
main proc
    mov ax, @data
    mov ds, ax

guess_loop:
    mov ah, 09h          
    lea dx, prompt      
    int 21h             

    mov ah, 01h         
    int 21h              
    sub al, '0'         
    mov guess, al        

   
    mov ah, 09h          
    lea dx, new_line     
    int 21h              


    mov al, guess
    cmp al, secret_number
    je correct_guess

    cmp al, secret_number
    jg too_high
    jl too_low

too_high:
   
    mov ah, 09h
    lea dx, too_high_msg
    int 21h
    jmp guess_loop

too_low:
    
    mov ah, 09h
    lea dx, too_low_msg
    int 21h
    jmp guess_loop

correct_guess:
    
    mov ah, 09h
    lea dx, correct_msg
    int 21h

   
    mov ax, 4C00h        
    int 21h
main endp
end main