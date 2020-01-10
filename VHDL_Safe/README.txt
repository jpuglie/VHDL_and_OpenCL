This project practices creating a finite state machine that acts as a Safe. That is, a user must
enter the proper sequence of 0's and 1's in order for the system to send an "Unlock" signal. Personally, I chose
to create a Mealy State Machine for this project because I felt that the logic made more since over a Moore Machine. 

Files-
fsm_safe: file that contains logic for the state machine written in VHDL
fsm_safe_board: intializes fsm_safe file as an entity and port maps  this file to the FPGA board
