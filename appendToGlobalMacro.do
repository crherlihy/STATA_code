
//Generate temporary variables
gen temp_1 = 1
gen temp_2 = 2
gen temp_ 3 = 3

//Initialize global macro 
global mylist test

//Find all vars that start with var_ and append them to the global macro 
foreach var of varlist var_* {
  global mylist "$mylist `var'"
  }

//Test to make sure it worked
foreach x of global mylist{
  disp "`x'"
  }

