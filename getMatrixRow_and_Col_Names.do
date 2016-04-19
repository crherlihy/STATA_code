// Here, A is an existing matrix that stores regression output

// Extract row full names
local rnames : rowfullnames A

// Test
foreach x of local rnames{
  disp "`x'"
 }
 
 // Extract column full names
local colnames : colfullnames A

// Test
foreach y of local colnames{
  disp "`y'"
 }
 
