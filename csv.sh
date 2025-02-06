#!/bin/bash
#
#
#   File : csv.sh
#   
#   Split large CSV files into smaller files for import into databases.
#   Usage: ./csv.sh <csv-inputfile> [lines-per-file]
#   Example: ./csv.sh DT-101010_resultset.csv 1000000
#   Result: Will split the csv file into files with 1M lines each.  The header of the CSV will be included each file.


# Function to split CSV files with the header
split_csv() {
    HEADER=$(head -1 "$1")  # Extract the header (first line) from the CSV file
    if [ -n "$2" ]; then
        CHUNK=$2  # Use the provided chunk size if given
    else 
        CHUNK=1000  
    fi
    BASENAME=$(basename "$1" .csv)  # Extract the base name of the file without the .csv extension

    # Split the file into chunks, skipping the header (first line)
    tail -n +2 "$1" | split -l "$CHUNK" - "${BASENAME}_split_"

    # Loop through each split file
    for i in ${BASENAME}_split_*; do
        mv "$i" "$i.csv"  # Rename each split file to end with .csv
        # Insert the header into the first line of each split file using printf instead of sed
        { printf "%s\n" "$HEADER"; cat "$i.csv"; } > temp && mv temp "$i.csv"
    done
}

# Check if the script is provided with at least one argument (the input CSV file)
if [ -z "$1" ]; then
    echo "Usage: $0 <csv-inputfile> [lines-per-file]"
    exit 1
fi

# Get the input file and optional chunk size from the command-line arguments
CSV_FILE=$1
LINES_PER_SPLIT=$2  # Optional: if omitted, default will be 1000

# Call the function to split the CSV file
split_csv "$CSV_FILE" "$LINES_PER_SPLIT"

