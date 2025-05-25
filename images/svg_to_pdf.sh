#!/bin/bash

# Check if Inkscape is installed
if ! command -v convert &> /dev/null; then
    echo "Error: Convert is not installed. Please install it to proceed"
    exit 1
fi

INPUT_DIR='./svg'

# Verify that the input directory exists
if [ ! -d "$INPUT_DIR" ]; then
    echo "Error: Directory '$INPUT_DIR' does not exist."
    exit 1
fi

# Find all .svg files in the specified directory and convert them to .pdf
for svg_file in "$INPUT_DIR"/*.svg; do
    # Check if any SVG files exist
    if [ ! -f "$svg_file" ]; then
        echo "No SVG files found in '$INPUT_DIR'."
        exit 0
    fi

    base_name=$(basename "$svg_file" .svg)
    
    pdf_file="./$base_name.pdf"
    
    echo "Converting '$svg_file' to '$pdf_file'..."
    convert --density 300 "$svg_file" "$pdf_file" 
    
    # Check if conversion was successful
    if [ $? -eq 0 ]; then
        echo "Successfully converted '$svg_file' to '$pdf_file'."
    else
        echo "Error: Failed to convert '$svg_file'."
    fi
done

echo "Conversion complete!"
