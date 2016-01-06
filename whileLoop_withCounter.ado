//While loop using a counter in stata
/*Note: stata is weird about this; it works best to declare the counter as a local macro and then overwrite the value to increment
        it during each iteration. */
        

cap program drop selectSubPopulation
program define selectSubPopulation
args  m z 

*PATIENTS WITH AT LEAST 7 CHRONIC CONDITIONS SUB-POPULATION 
if "`z'" == "atLeast7cc"{
	local counter 0
	
	*Need to initailize it with an empty string; otherwise, won't be able to append later 
	global ccFlags ""
	
	foreach var of varlist cc_*{
		global ccFlags "$ccFlags `var'"
	}
	
	*Check to make sure all vars are added to global macro
	disp "$ccFlags"
	
	*This part doesn't work yet			
	//If counter >=7, we can stop looping and include bene in the sub-pop 
	while `counter' < 7 { 
		foreach x of local ccFlags{
			disp `x'
			if `x' == 1
			local counter `counter' + 1
		}
	}
	keep if `counter' >= 7 
}	
