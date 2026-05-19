; |====================================================================|
; | Project     : Assembly Terminal Cashier                            |
; | Language    : Assembly x86                                         |
; | Description : A simple command-line cashier program built by me.   |
; |====================================================================|


section .data
  header db "==== Menu List ====", 0x0A, 0x0A, 0
  len_header equ $ - header

  list_food   db "Makanan", 0x0A
  food1 db "1. Nasi Goreng Spesial    - Rp 28.000", 0x0A, 0 
  food2 db "2. Ayam Bakar Madu        - Rp 35.000", 0x0A, 0 
  food3 db "3. Mie Goreng Seafood     - Rp 32.000", 0x0A, 0 
  food4 db "4. Sate Ayam Madura       - Rp 30.000", 0x0A, 0x0A, 0 
  len_list_food equ $ - list_food

  list_drink  db "Minuman", 0x0A
  drink1 db "5. Es Teh Manis           - Rp 6.000", 0x0A, 0 
  drink2 db "6. Avocado Juice          - Rp 18.000", 0x0A, 0 
  drink3 db "7. Es Kopi Susu           - Rp 22.000", 0x0A, 0x0A, 0 
  len_list_drink equ $ - list_drink

  msg_order db "Masukkan pilihan anda: ", 0
  len_msg_order equ $ - msg_order

  arr_price dw 28000, 35000, 32000, 30000, 6000, 18000, 22000
  arr_name dd food1, food2, food3, food4, drink1, drink2, drink3

  inputSalah db "Input salah", 0
  len_input_salah equ $ - inputSalah

section .bss
  pilihan resb 5
  order_name resb 45


section .text
  global _start

_start:

  mov edi, order_name

  mov eax, 4
  mov ebx, 1
  mov ecx, header
  mov edx, len_header
  int 0x80

  mov eax, 4
  mov ebx, 1
  mov ecx, list_food
  mov edx, len_list_food
  int 0x80

  mov eax, 4
  mov ebx, 1
  mov ecx, list_drink
  mov edx, len_list_drink
  int 0x80

  mov eax, 4
  mov ebx, 1
  mov ecx, msg_order
  mov edx, len_msg_order
  int 0x80

  mov eax, 3
  mov ebx, 0
  mov ecx, pilihan
  mov edx, 5
  int 0x80

  mov al, [pilihan]
  sub al, 48
  mov [pilihan], al

  mov al, [pilihan]
  mov ecx, 1

loop_compare_order:
  cmp ecx, 7
  jg input_salah

  cmp al, cl
  je cetak_order

  inc ecx
  jmp loop_compare_order

cetak_order:
  dec ecx
  mov edx, [arr_name + ecx * 4]
  jmp copy_string

input_salah:
  mov eax, 4
  mov ebx, 1
  mov ecx, inputSalah
  mov edx, len_input_salah
  int 0x80
  jmp end

cetak_pesan:
  mov eax, 4
  mov ebx, 1
  mov ecx, order_name
  mov edx, 45
  int 0x80
  jmp end

copy_string:
  mov al, [edx]
  cmp al, 0
  je cetak_pesan 

  mov [edi], al
  inc edx
  inc edi
  jmp copy_string

end:
  mov eax, 1                                ; System Exit
  mov ebx, 0
  int 0x80



