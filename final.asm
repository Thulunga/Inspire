;vowel count
;enter the stringuysgduyahbch
;vowel a count:  1
;vowel e count:  0
;vowel i count:  0
;vowel o count:  0
;vowel u count:  2
;///////////////////////////////////////

section .data

msg: db "enter the string"
size: equ $-msg
msga: db "vowel a count:  "
sizea: equ $-msga
msge: db "vowel e count:  "
sizee: equ $-msge
msgi: db "vowel i count:  "
sizei: equ $-msgi
msgo: db "vowel o count:  "
sizeo: equ $-msgo
msgu: db "vowel u count:  "
sizeu: equ $-msgu
newline: db 10
sizen: equ $-newline

section .bss

string: resw 50
temp : resb 1
length: resb 1
i: resb 1
counta: resb 1
counte: resb 1
counti: resb 1
counto: resb 1
countu: resb 1

section .text

global _start

_start:

mov eax,4
mov ebx,1
mov ecx,msg
mov edx,size
int 80h

mov ebx,string
mov byte[length],0

accepting_string:

push ebx


mov eax,3
mov ebx,0
mov ecx,temp
mov edx,1
int 80h

pop ebx

mov al,byte[temp]
mov byte[ebx],al

inc byte[length]
inc ebx

cmp byte[temp],10
jne accepting_string

dec ebx
dec byte[length]
mov byte[ebx],0


mov byte[counta],0
mov byte[counte],0
mov byte[counti],0
mov byte[counto],0
mov byte[countu],0

mov byte[i],0



vowel_check:

mov eax,string
movzx ecx,byte[i]
add eax,ecx

cmp byte[eax],97
je a_count

cmp byte[eax],101
je e_count

cmp byte[eax],105
je i_count

cmp byte[eax],111
je o_count

cmp byte[eax],117
je u_count

continue:
inc byte[i]
mov al,byte[length]
cmp byte[i],al
jl vowel_check

add byte[counta],30h
add byte[counte],30h
add byte[counti],30h
add byte[counto],30h
add byte[countu],30h

call print

jmp exit

a_count:
add byte[counta],1
jmp continue

e_count:
add byte[counte],1
jmp continue

i_count:
add byte[counti],1
jmp continue

o_count:
add byte[counto],1
jmp continue

u_count:
add byte[countu],1
jmp continue

print:
mov eax,4
mov ebx,1
mov ecx,msga
mov edx,sizea
int 80h

mov eax,4
mov ebx,1
mov ecx,counta
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,newline
mov edx,sizen
int 80h

mov eax,4
mov ebx,1
mov ecx,msge
mov edx,sizee
int 80h

mov eax,4
mov ebx,1
mov ecx,counte
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,newline
mov edx,sizen
int 80h

mov eax,4
mov ebx,1
mov ecx,msgi
mov edx,sizei
int 80h

mov eax,4
mov ebx,1
mov ecx,counti
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,newline
mov edx,sizen
int 80h

mov eax,4
mov ebx,1
mov ecx,msgo
mov edx,sizeo
int 80h

mov eax,4
mov ebx,1
mov ecx,counto
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,newline
mov edx,sizen
int 80h


mov eax,4
mov ebx,1
mov ecx,msgu
mov edx,sizeu
int 80h

mov eax,4
mov ebx,1
mov ecx,countu
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,newline
mov edx,sizen
int 80h

ret


exit: 

mov eax,1
mov ebx,0
int 80h
;//////////////////////////////////////////

;Program to check whether the given architecture is little endian 
;Or Big Endian

section .data
  msg1: db "Architechture is Little Endian"
  size1: equ $-msg1
  msg2: db "Architechture is Big Endian"
  size2: equ $-msg2

section .bss
  temp: resb 1


section .text
  global _start

_start:

  mov eax, 0xffff0000
  push eax
  pop ax
  pop bx

  cmp bx, 0xffff
  je  LittleEndian
  
BigEndian:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg2
  mov edx, size2
  int 80h
  jmp End


LittleEndian:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg1
  mov edx, size1
  int 80h


End:
  mov eax, 1
  mov ebx, 0
  int 80h
;//////////////////////////////////////////
;count capital number and small number


section .data

msg: db "enter the string:  "
size: equ $-msg
msgs: db " small count:  "
sizes: equ $-msgs
msgc: db " capital count:  "
sizec: equ $-msgc
msg1: db "ERROR"
size1: equ $-msg1
newline: db 10
sizen: equ $-newline

section .bss

string: resw 50
temp : resb 1
length: resb 1
i: resb 1
counts: resb 1
countc: resb 1


section .text

global _start

_start:

mov eax,4
mov ebx,1
mov ecx,msg
mov edx,size
int 80h

mov ebx,string
mov byte[length],0

accepting_string:

push ebx


mov eax,3
mov ebx,0
mov ecx,temp
mov edx,1
int 80h

pop ebx

mov al,byte[temp]
mov byte[ebx],al

inc byte[length]
inc ebx

cmp byte[temp],10
jne accepting_string

dec ebx
dec byte[length]
mov byte[ebx],0


mov byte[counts],0
mov byte[countc],0


mov byte[i],0



vowel_check:

mov eax,string
movzx ecx,byte[i]
add eax,ecx

cmp byte[eax],97
jl capital_check

cmp byte[eax],123
jl small_count
jmp error

capital_check:
cmp byte[eax],65
jl error

cmp byte[eax],92
jl capital_count

jmp error



continue:
inc byte[i]
mov al,byte[length]
cmp byte[i],al
jl vowel_check

add byte[counts],30h
add byte[countc],30h


call print

jmp exit

small_count:
add byte[counts],1
jmp continue

capital_count:
add byte[countc],1
jmp continue

error:
mov eax,4
mov ebx,1
mov ecx,msg1
mov edx,size1
int 80h
jmp exit

print:
mov eax,4
mov ebx,1
mov ecx,msgs
mov edx,sizes
int 80h

mov eax,4
mov ebx,1
mov ecx,counts
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,newline
mov edx,sizen
int 80h

mov eax,4
mov ebx,1
mov ecx,msgc
mov edx,sizec
int 80h

mov eax,4
mov ebx,1
mov ecx,countc
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,newline
mov edx,sizen
int 80h


ret


exit: 

mov eax,1
mov ebx,0
int 80h
;//////////////////////////////////////////
;; paralleldrom
section .data
    m1    db    "enter the string:"
    m1l   equ   $ - m1
    m2    db    "the string is a palindrome" , 10
    m2l   equ   $ - m2
    m3    db    "the string is not a palindrome" , 10
    m3l   equ   $ - m3
    m4    db    "hello......" , 10
    m4l   equ   $ - m4

section .bss
    a    resb    50
    len  resb    1
    fnt  resb    1
    temp resb    1

section .text
    global _start

_start:
    mov    eax,    4
    mov    ebx,    1
    mov    ecx,    m1
    mov    edx,    m1l
    int    80h

    mov    esi,    a
    mov    word [len],    0
    mov    word [fnt],    0

    estr:
        mov    eax,    3
        mov    ebx,    0
        mov    ecx,    temp
        mov    edx,    1 
        int    80h
        cmp    byte [temp],    10
        je     exit1
        movzx  eax,    byte [temp]
        mov    [esi],    eax
        inc    esi
        inc    byte [len]
        jmp    estr
    exit1:


    mov    esi,    a
    dec    byte [len]

    strcmp:
       mov    eax,   a
       mov    ebx,   a
       movzx    ecx,   byte [fnt]
       add    eax,   ecx
       movzx  edx,   byte [len]
       add    ebx,   edx
       cmp    edx,   ecx
       jl     pal
       mov    cl,    byte [eax]
       mov    ch,    byte [ebx]
       cmp    cl,    ch
       jne    ntpal
       inc    byte [fnt]
       dec    byte [len]
       jmp    strcmp
       
    pal:
        mov    eax,    4
        mov    ebx,    1
        mov    ecx,    m2
        mov    edx,    m2l
        int    80h
        jmp    exit2

    ntpal:
        mov    eax,    4
        mov    ebx,    1
        mov    ecx,    m3
        mov    edx,    m3l
        int    80h

    exit2:
        mov    eax,    1
        mov    ebx,    0
        int    80h

;/////////////////////////////////////////
;; reverse the string

section .data
    m1    db    "enter the string:"
    m1l   equ   $ - m1
    m2    db    "the reversed string is "
    m2l   equ   $ - m2
    m3    db    "hello",10
    m3l   equ   $ - m3

section .bss
    a     resb    50
    temp  resb    1
    len   resb    1
    fnt   resb    1
    l1    resb    1

section .text
    global _start

_start:
    mov    eax,    4
    mov    ebx,    1
    mov    ecx,    m1
    mov    edx,    m1l
    int    80h

    mov    esi,    a
    mov    byte [len],    0

    estr:
        mov    eax,    3
        mov    ebx,    0
        mov    ecx,    temp
        mov    edx,    1
        int    80h

        mov    al,     byte [temp]
        cmp    al,     10
        je     exit1
        mov    byte [esi],    al
        inc    esi
        inc    byte [len]
        jmp    estr
    exit1:

    mov    al,     byte [len]
    mov    byte [l1],    al
    mov    eax,    a
    mov    ebx,    a
    mov    byte [fnt],    0
    dec    byte [len]

    revrs:
        mov    cl,    byte [fnt]
        mov    ch,    byte [len]
        cmp    ch,    cl
        jl     exit2
        mov    eax,    a
        mov    ebx,    a
        movzx  ecx,    byte [fnt]
        add    eax,    ecx
        movzx  ecx,    byte [len]
        add    ebx,    ecx
        mov  cl,     byte [ebx]
        mov  dl,     byte [eax]
        mov  byte [ebx],  dl
        mov  byte [eax],  cl
        inc    byte [fnt]
        dec    byte [len]
        jmp    revrs
    exit2:

    mov    esi,    a
    movzx  eax,     byte [l1]
    push   eax

    mov    eax,    4
    mov    ebx,    1
    mov    ecx,    m2
    mov    edx,    m2l
    int    80h

    ostr:
        movzx  eax,    byte [l1]
        cmp    eax,     0
        je     exit3
        dec    byte [l1]
        mov    al,    byte [esi]
        mov    byte [temp],    al

        mov    eax,    4
        mov    ebx,    1
        mov    ecx,    temp
        mov    edx,    1
        int    80h

        inc    esi
        jmp    ostr
    exit3:

    mov    eax,    1
    mov    ebx,    0
    int    80h
;//////////////////////////////























