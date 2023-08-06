#!/bin/bash

# Extract emails from the students-list_0333.txt and save to student-emails.txt
cut -d',' -f1 students-list_0333.txt > student-emails.txt

echo "Emails of students saved in student-emails.txt"

