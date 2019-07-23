[bits 32]
extern	 main
extern   exit
section .text
global _start
_start:
   ;下面这两个要和execv中load之后指定的寄存器一致
   push	 ebx	  ;压入argv
   push  ecx	  ;压入argc
   call  main

   ;gcc stores return value in eax as ABI states
   push eax 
   call exit
   ;exit won't return anything