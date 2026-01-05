#!/bin/bash

# Overwrite README.md with a title
echo "# Recipes" > README.md
echo "" >> README.md

# Loop through each recipe directory
for dir in Breakfast Dessert Dinner Sauces Sides; do
  # Add the directory name as a heading
  echo "## $dir" >> README.md
  echo "" >> README.md
  # Loop through each markdown file in the directory, sorted alphabetically
  for file in $(ls "$dir"/*.md | sort); do
    # Get the filename without the extension and directory
    filename=$(basename -- "$file")
    extension="${filename##*.}"
    filename_no_ext="${filename%.*}"
    # Replace underscores with spaces for the title
    recipe_title=$(echo "$filename_no_ext" | tr '_' ' ')
    # Add recipe title as a sub-heading
    echo "### $recipe_title" >> README.md
    echo "" >> README.md
    # Append the content of the file to README.md
    cat "$file" >> README.md
    # Add a newline for separation between recipes
    echo "" >> README.md
    echo "---" >> README.md
    echo "" >> README.md
  done
done
