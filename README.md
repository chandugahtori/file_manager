This Bash script organizes files in a directory based on their file type (.txt, .jpg, .log) created/modified after a user-given date.
It is macOS compatible and uses standard Linux/Unix commands.

What This Script Does
Takes a date input from the user (YYYY-MM-DD)
Converts it into a reference timestamp
Finds only files newer than that date
Automatically moves them into folders:
txt/ → .txt files
jpg/ → .jpg files
log/ → .log files
Old files remain untouched

Folder Structure (After Execution)
project-folder/
│
├── script.sh
├── README.md
├── txt/
│   └── *.txt
├── jpg/
│   └── *.jpg
├── log/
│   └── *.log

Technologies & Commands Used
Bash Scripting
read
date (macOS compatible flags)
touch
find
case
mkdir
mv
