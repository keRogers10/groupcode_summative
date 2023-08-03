#!/bin/bash

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

view_all_students() {
    echo "List of students:"
    cat students-list_0333.txt
}

delete_student() {
    echo "Enter the student ID to delete:"
    read student_id

    grep -v "$student_id" students-list_0333.txt > temp.txt
    mv temp.txt students-list_0333.txt

    echo "Student with ID $student_id deleted successfully!"
}

update_student() {
    echo "Enter the student ID to update:"
    read student_id

    echo "Enter updated student email:"
    read email

    echo "Enter updated student age:"
    read age

    awk -v sid="$student_id" -v em="$email" -v ag="$age" 'BEGIN{FS=OFS=","} $3==sid{$1=em; $2=ag}1' students-list_0333.txt > temp.txt
    mv temp.txt students-list_0333.txt

    echo "Student with ID $student_id updated successfully!"
}

exit_app() {
    echo "Exiting the application."
    exit 0
}

# Main menu
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

