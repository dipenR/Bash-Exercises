# Bash-Exercises
Various Exercises written in Bash 

### spellcheck.bash
  This script accepts 2 .txt files - one containing the text we want to spellcheck and the second containing a dictionary of all (required, or otherwise) words separated by a new line character. The output is all words that have a spelling error in them.

### colsum.sh
  This script accepts a .txt file that contains various rows of numbers separated by (,),(;), or (:) and returns the sum of each **column**.
  
### weighted-sum.sh
  This script accepts a .csv file of the form seen in testing.txt (testing.txt shows only 1 row, however any number of rows can be used). The output is the weighted sum of each ID in the .csv file.
 
### grading.sh
  This script accepts **various** .csv file of the form seen in testing.txt (this script can only accept 1 row per file at a time). The output is an assigned grade to each student according to the grading scheme - {100-93}-A {92-80}-B {79-66}-C {65 and below}-D

### code-shipping.sh
  This script accepts 2 directories - a source directory containing a mix of .c, .o, and directory files and a destination directory. The goal is to move all .o and directory files (if directory files contain .c, ignore them as well) form source to destination directory while maintaining structure. 
