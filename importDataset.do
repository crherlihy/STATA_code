#STATA 101: Import a dataset from csv; save it as a dta file

gen name = "insert_file_path_here"
import delimited using "name"

gen saveas = "insert_dta_file_name"
save saveas
