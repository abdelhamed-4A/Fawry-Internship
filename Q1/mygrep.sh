#!/bin/bash

# Initialize variables for options
show_numbers=false
invert_match=false

# Function to print usage information
print_usage() {
  echo "Usage: $0 [ -n ] [ -v ] pattern file"
  echo "  -n: Show line numbers"
  echo "  -v: Invert match"
  echo "  --help: Show this help message"
}

# Check for --help option
for arg in "$@"; do
  if [ "$arg" == "--help" ]; then
    print_usage
    exit 0
  fi
done

# Parse options using getopts
while getopts "nv" opt; do
  case $opt in
    n) show_numbers=true ;;
    v) invert_match=true ;;
    \?) echo "Invalid option: -$OPTARG" ; print_usage ; exit 1 ;;
  esac
done
shift $((OPTIND -1))

# Check if pattern and file are provided
if [ $# -lt 2 ]; then
  print_usage
  exit 1
fi

pattern=$1
file=$2

# Check if the file exists
if [ ! -f "$file" ]; then
  echo "File not found: $file"
  exit 1
fi

# Convert pattern to lowercase for case-insensitive search
pattern_lower=$(echo "$pattern" | tr '[:upper:]' '[:lower:]')

# Initialize line number counter
line_num=0

# Read the file line by line and perform the search
while read -r line; do
  line_num=$((line_num + 1))
  line_lower=$(echo "$line" | tr '[:upper:]' '[:lower:]')
  
  # Check if the line matches the pattern (case-insensitive)
  if [[ $line_lower == *$pattern_lower* ]]; then
    match=true
  else
    match=false
  fi
  
  # Decide whether to print the line based on options
  if [ $invert_match == true ]; then
    if [ $match == false ]; then
      if [ $show_numbers == true ]; then
        echo "$line_num:$line"
      else
        echo "$line"
      fi
    fi
  else
    if [ $match == true ]; then
      if [ $show_numbers == true ]; then
        echo "$line_num:$line"
      else
        echo "$line"
      fi
    fi
  fi
done < "$file"