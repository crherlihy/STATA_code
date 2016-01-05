//While loop using a counter in stata
//Note: stata is weird about this; it works best to declare the counter as a local macro and then overwrite the value to increment
        //it during each iteration.
        

cap program drop selectSubPopulation
program define selectSubPopulation
args  m z 

*PATIENTS WITH AT LEAST 7 CHRONIC CONDITIONS SUB-POPULATION 
if "`z'" == "atLeast7cc"{
	local counter 0
	local ccFlags cc_* //Select all
				
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
