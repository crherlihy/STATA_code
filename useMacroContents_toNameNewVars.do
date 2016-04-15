// Objective: use the contents of a global macro to differentiate new vars that are generated in a loop. In this example, we are setting
// the contents of the new vars equal to elements from previously generated matrices (regression output). 

local interact_post_hbpci "00 01 10 11"

local counter = 1

foreach pair of local  interact_post_hbpci{
				
					local temp2 = "margCoeff_" + "`pair'"
					gen `temp2' = aMargins[1, `counter']
					gen margSE_`pair' = aMargins[2, `counter']
					gen marg_pVal_`pair' = aMargins[4,`counter']
					gen margCoeff_SE_`pair' = string(`temp'[1,`counter'], "%9.2fc")+ cond(`temp'[4,`counter'] < 0.01, "**", cond(`temp'[4,`counter']<0.05,"*", cond(`temp'[4,`counter']<0.1, "+", ""))) + " (" + string(`temp'[2,`counter'], "%9.2fc")+")"
					local counter = `counter' + 1
				}
