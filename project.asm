.model small
.stack 100h
.data
    prompt db "Pick a nuber between 1 and 9:$"
    correct_message db "Correct number$"
    high_message db "too high$"
    low_message db "too low$"
    new_line db 0Dh, 0Ah, '$'  
    correct_number db 5 ;we can change the number here           
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
    cmp al, correct_number
    je correct_guess

    cmp al, correct_number
    jg high
    jl low

high:
   
    mov ah, 09h
    lea dx, high_message
    int 21h
    jmp guess_loop

low:
    
    mov ah, 09h
    lea dx, low_message
    int 21h
    jmp guess_loop

correct_guess:
    
    mov ah, 09h
    lea dx, correct_message
    int 21h

   
    mov ax, 4C00h        
    int 21h
main endp
end main