**Simple x86 Bootloader and Kernel**

**About:**
This project is a basic x86 bootloader that loads a simple kernel from memory and displays characters to the screen using direct memory access to VGA text mode.

⸻

**What It Does:**
	•	Loads the kernel directly from disk to memory using assembly.
	•	Switches from the BIOS real mode into protected mode.
	•	The kernel writes characters to the screen via the VGA text buffer.
	•	Basic helper functions for printing single characters.
	•	Early groundwork for future kernel expansion.

⸻

**Current Features:**
	•	Simple bootloader in assembly (Switchs to 32 bit protected mode and loads kernel).
	•	Kernel written in C.
	•	Direct memory manipulation at 0xB8000 (VGA text mode).
	•	clear_screen() function to reset the screen.
	•	print_char() function for output.

⸻

**Planned Features:**
	•	Basic keyboard input.
	•	Text cursor movement.
	•	Filesystem loading.

⸻

**How to run:**
	1.	Download nasm
	2.	Download qemu
	3.	Download a cross compiler (https://wiki.osdev.org/GCC_Cross-Compiler)
  4. Then run using the command: "sh run.sh" 
