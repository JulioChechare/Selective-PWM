<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works:
PWM_module generates a PWM (Pulse-Width Modulation) signal using a counter and a comparator. The output duty-cycle resolution is 12.5%.
•	Inputs: clock, enable, speed[2:0]. Output: PWM.
•	Speed[2:0] determines the Duty Cicle at Output PWM signal
•	When enable=1, counter and output go to 0.
•	When enable=0, a 5-bit counter (0…31) increments on each rising clock edge;
•	Because the counter is 5 bits wide, the period of the PWM output signal is determined by 32 clock periods applied to the counter’s input.
•	A combinational block maps speed to a target pulse width (width) in steps of 4: 0, 4, 8, 12, 16, 20, 24, 28, which correspond to ~0, 12.5, 25, 37.5, 50, 62.5, 75, 87.5% over a 32-cycle period.
•	On each output cycle, PWM = 1 while counter < width, otherwise 0.
Result: a carrier at f_clk / 32 with duty cycle set by speed.
Notes:
•	The default case sets width=0 as a safe fallback, so out-of-range speed values force the output low.

IOs:
Number:	 Input:	    Output:	  Bidirectional:
0	      speed[0]	   PWM	       N.U.
1	      speed[1]	   N.U.	       N.U.
2	      speed[2]	   N.U.	       N.U.
3	      enable	     N.U.	       N.U.
4	       N.U.	       N.U.	       N.U.
5	       N.U.	       N.U.	       N.U.
6	       N.U.	       N.U.	       N.U.
7	       N.U.	       N.U.	       N.U.

N.U. means: Not Used


## How to test:
The combination of logic states on the Input[3:0] signals determines the value of speed and therefore the output duty cycle, as indicated in the following table.

Input[2:0]	   speed_value:       PWM_Duty_Cycle:
    000	             0	               0%
    001	             1	             12.5%
    010	             2	             25%
    011	             3	             37.5%
    100	             4	              50%
    101	             5	             62.5%
    110	             6	             75%
    111	             7	             87.5%


## External hardware:
3 10K pull-down resistors, each one connected to Input[2:0] 
3 switchs, each one connected from Input[2:0] to VDD.
An oscilloscope in order to measure Output[0] (PWM signal)
