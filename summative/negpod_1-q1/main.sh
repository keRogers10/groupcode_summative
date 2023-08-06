#!/bin/bash

# The Function to create a student record and save it in the file
create_student_record() {
    echo "Enter student email:"
    read email

    echo "Enter student age:"
    read age

    echo "Enter student ID:"
    read student_id

    echo "$email,$age,$student_id" >> students-list_0333.txt
    echo "Student record created successfully!"
}

# Function to view all students in the file
view_all_students() {
    echo "List of students:"
    cat students-list_0333.txt
}

# Function to delete a student record by student ID
delete_student() {
    echo "Enter the student ID to delete:"
    read student_id

    # Create a temporary file without the student to be deleted
    grep -v "$student_id" students-list_0333.txt > temp.txt
    mv temp.txt students-list_0333.txt

    echo "Student with ID $student_id deleted successfully!"
}

# Function to update a student record by student ID
update_student() {
    echo "Enter the student ID to update:"
    read student_id

    # Create a temporary file to store the updated student record
    echo "Enter updated student email:"
    read email

    echo "Enter updated student age:"
    read age

    # Find the student by ID and update the record
    awk -v sid="$student_id" -v em="$email" -v ag="$age" 'BEGIN{FS=OFS=","} $3==sid{$1=em; $2=ag}1' students-list_0333.txt > temp.txt
    mv temp.txt students-list_0333.txt

    echo "Student with ID $student_id updated successfully!"
}

# Function to exit the application
exit_app() {
    echo "Exiting the application."
    exit 0
}

# All options to make
while true; do
    echo "Choose an option:"
    echo "1. Create student record"
    echo "2. View all students"
    echo "3. Delete a student"
    echo "4. Update a student record"
    echo "5. Exit"
    read choice

    case $choice in
        1) create_student_record;;
        2) view_all_students;;
        3) delete_student;;
        4) update_student;;
        5) exit_app;;
        *) echo "Invalid option, please try again.";;
    esac
done

