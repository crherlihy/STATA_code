// Prepare data for export to Python for use in neural network model
// Randomly assign observations to be put into the training/validation/testing datasets:

* Training 60% of original data set
* Validation 20% of original data set
* Testing 20% of original data set

// Set random number seed
set seed 12345

// Generate a new var = random numbers drawn from uniform distribution; sort based on this var
generate randnum = uniform()
sort randnum

gen grp = .

local numobs = _N
local A = int(`numobs'*0.6)
local B = int(`numobs'*0.2)
local C = `A' + `B' 
local A1 = `A' + 1
local C1 = `C' + 1

replace grp = 1 in 1/`A'
replace grp = 2 in `A1'/`C'
replace grp = 3 in `C1'/ `numobs'

tab grp
