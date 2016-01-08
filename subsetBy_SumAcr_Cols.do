//Sum across a subset of rows, and subset the original dataset based on rows where this sum is > set # (here, 7) 

cap program drop selectSubPopulation
program define selectSubPopulation
args  m z 

*PATIENTS WITH AT LEAST 7 CHRONIC CONDITIONS SUB-POPULATION 
if "`z'" == "atLeast7cc"{

	*Get the row total for each bene (summing across all chronic condition columns within each row)
	*using the parameter cc_* gets all columns that start with cc_ ; here, this = all cols that represent chronic condition flags 
	egen atLeastSevenCC = rowtotal(cc_*) 

	*recode as binary 
	replace atLeastSevenCC = 1 if atLeastSevenCC > 6

	*keep benes if at least 7 chronic conditions or more 
	keep if atLeastSevenCC ==1
}	
