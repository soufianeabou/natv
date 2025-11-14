import re
import os

def fix_fonts_in_file(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Replace GoogleFonts.changa with system font
    content = re.sub(
        r'GoogleFonts\.changa\(',
        'TextStyle(',
        content
    )
    
    # Replace GoogleFonts.lato with system font
    content = re.sub(
        r'GoogleFonts\.lato\(',
        'TextStyle(',
        content
    )
    
    # Add fontFamily to TextStyle calls
    content = re.sub(
        r'TextStyle\(\s*([^)]*?)(font: GoogleFonts\.changa\([^)]*\))?',
        r'TextStyle(\1fontFamily: "Changa",',
        content
    )
    
    content = re.sub(
        r'TextStyle\(\s*([^)]*?)(font: GoogleFonts\.lato\([^)]*\))?',
        r'TextStyle(\1fontFamily: "Lato",',
        content
    )
    
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(content)

# Fix contact page
fix_fonts_in_file('lib/pages/contact_copy/contact_copy_widget.dart')
print("Fixed contact page fonts")

# Fix frequencies page
fix_fonts_in_file('lib/pages/frequencies_copy/frequencies_copy_widget.dart')
print("Fixed frequencies page fonts")

# Fix information page
fix_fonts_in_file('lib/pages/information_copy/information_copy_widget.dart')
print("Fixed information page fonts")

print("All font fixes completed!")
