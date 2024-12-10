# Lab 9 Writeup

For our final lab, we chose to add sound elements to the combo lock from Lab 5. The goal is for a sound to be played once the combination is entered. When the correct combination is entered, a short sound will be heard. When the incorrect combination is entered, a slightly longer sound will be heard.

This included the following elements:
- modifying the finite state machine master and outputs from lab 5 to include states for playing sound
- integrating the necessary files for creating and playing sounds from lab 8
- modifying the functionality of the finite state machine from lab 8 to play a singular note when prompted instead of recording and playing a song from UART input
- modifying the main combo lock top verilog file to include the sound modules
