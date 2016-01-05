disp "*************************************************************"
disp "MARGINS COMMANDS"
disp "*************************************************************"
					
*A: if served ==0, at served= 0 represents effect of treating control as control
*B: if served ==0, at served= 1 represents effect of treating treatment as control
*C: if served ==1, at served= 0 represents effect of treating control as treatment
*D; if served ==1, at served= 1 represents effect of treating treatment as treatment

disp "Option A:"
	margins if served==0, at(served=(0 1))
	margins if served==1, at(served=(0 1))
			
*Gives you A and D as outlined above, in that order (i.e. 0 as 0 and 1 as 1)			
disp "Option B:"
	margins if served==0
	margins if served==1
			
*Same as above, but in one table
disp "Option C:"
	margins, over(served)
			
*Gives you B and D as outlined in Option A, in that order (i.e. 0 as 1 and 1 as 0)
disp "Option D:"
	margins i.served
			
disp "Option E:"
	margins r.served

