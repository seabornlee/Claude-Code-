#!/usr/bin/env python3
"""
Simple PDF converter for markdown files with Chinese support
"""

import os
import subprocess
import sys

def convert_md_to_pdf(md_file, pdf_file):
    """Convert markdown file to PDF"""
    try:
        # Try using pandoc with basic settings
        cmd = [
            'pandoc',
            md_file,
            '-o', pdf_file,
            '--pdf-engine=xelatex'
        ]

        result = subprocess.run(cmd, capture_output=True, text=True)

        if result.returncode == 0:
            print(f"✅ Successfully converted {md_file} to {pdf_file}")
            return True
        else:
            print(f"❌ Error converting {md_file}: {result.stderr}")
            return False

    except FileNotFoundError:
        print("❌ pandoc not found. Please install pandoc.")
        return False
    except Exception as e:
        print(f"❌ Unexpected error: {e}")
        return False

def main():
    """Convert all markdown files in solution directory"""
    solution_dir = '/Users/seabornlee/Documents/code/wisdom-team/test/solution'

    if not os.path.exists(solution_dir):
        print(f"❌ Solution directory not found: {solution_dir}")
        return

    # Files to convert
    files_to_convert = [
        'details.md',
        'timeline.md',
        'resources.md',
        'risks.md'
    ]

    for md_file in files_to_convert:
        md_path = os.path.join(solution_dir, md_file)
        pdf_path = os.path.join(solution_dir, md_file.replace('.md', '.pdf'))

        if os.path.exists(md_path):
            print(f"Converting {md_file}...")
            convert_md_to_pdf(md_path, pdf_path)
        else:
            print(f"⚠️  File not found: {md_path}")

if __name__ == "__main__":
    main()