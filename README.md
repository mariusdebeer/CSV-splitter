# CSV Splitter

A simple shell script to split large CSV files into smaller files for easier handling and database import.

## Usage

./csv.sh [input-file] [lines-per-file]

### Example


      ./csv.sh DT-101010_resultset.csv 1000000

This will split DT-101010_resultset.csv into multiple smaller CSV files, each containing 1,000,000 lines. The header from the original CSV file will be included in each output file.

### Features

Splits large CSV files into smaller chunks.

Retains the header in each split file.

Helps with large dataset imports into databases.

### Requirements

Bash (Linux/macOS)

awk (usually pre-installed)

# License

This project is licensed under the MIT License.
