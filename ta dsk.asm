.model small
.code
org 100h
start:
	jmp mulai
nama	 db 13,10,'NAMA  : $'
nim	     db 13,10,'NIM   : $'
tampung_nama    db 30,?,30 dup(?)
tampung_nim     db 13,?,43 dup(?)  

a db 01
b db 02
c db 03
d db 04
e db 05
j dw 15

daftar   db 13,10,'+---------------------------+'
         db 13,10,'| 1 |       HADIR            |'
         db 13,10,'+---------------------------+'
         db 13,10,'| 2 |       TIDAK            |'
         db 13,10,'+---------------------------+'
pilih_menu	 db 13,10,'masukan pilihan anda: $'
error		 db 13,10,' Kode yang anda masukan salah $'   
succes       db 13,10,' Selamat anda berhasil $'

    mulai: 
	mov ah,09h
	lea dx,nama
	int 21h
	mov ah,0ah
	lea dx,tampung_nama
	int 21h
	push dx

	mov ah,09h
	lea dx,nim
	int 21h
	mov ah,0ah
	lea dx,tampung_nim
	int 21h
	push dx 
	
	mov ah,09h
    mov dx,offset daftar
    int 21h
    mov ah,09h
    mov ah,01h
	jmp proses
error_msg:
	mov ah,09h
	mov dx,offset error
	int 21h
	int 20h
proses:
    mov ah,09h
    mov ah,1
    mov dx,offset pilih_menu
    int 21h
     	
	mov ah,1
	mov bl,al
	mov ah,1
	int 21h
	cmp bh,'0'
	cmp bl,'1'
	je hasil1
	
	cmp bh,'0'
	cmp bl,'2'
	je hasil2
	
	jne error_msg
	

;------------------------
hasil1:
	mov ah,09h
	lea dx,teks1
	int 21h
	int 20h
hasil2:
	mov ah,09
	lea dx,teks2
	int 21h
	int 20h
;------------------------

teks1 db 13,10,'Anda hadir pada mata kuliah hari ini '
      db 13,10,'Absensi anda berhasil $'
      
teks2 db 13,10,'Anda tidak hadir pada matkul dsk hari ini $'

end start