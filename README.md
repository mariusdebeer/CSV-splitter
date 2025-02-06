# CSV-splitter
CSV splitter for working with large datasets
   
   Split large CSV files into smaller files for import into databases.
   
   Usage: ./csv.sh <csv-inputfile> [lines-per-file]
   
Example: ./csv.sh DT-101010_resultset.csv 1000000
Result: Will split the csv file into files with 1M lines each.  The header of the CSV will be included each file.
