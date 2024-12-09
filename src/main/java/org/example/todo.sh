#!/bin/bash

initialize_files() {
  if [ ! -f "todo.txt" ]; then
    touch todo.txt
  fi
  if [ ! -f "done.txt" ]; then
    touch done.txt
  fi
}

add_task() {
  echo "Enter the new task:"
  read task
  echo "$task" >> todo.txt
  echo "Task added."
  echo "------------------------"
}

remove_task() {
  echo "Enter the task to remove:"
  read task
  grep -v "$task" todo.txt > temp.txt && mv temp.txt todo.txt
  grep -v "$task" done.txt > temp.txt && mv temp.txt done.txt
  echo "Task removed."
  echo "------------------------"
}

list_tasks() {
  echo "TODO tasks:"
  cat todo.txt
  echo "------------------------"
  echo "DONE tasks:"
  cat done.txt
  echo "------------------------"
}

search_todo() {
  echo "Enter the keyword to search in TODO tasks:"
  read keyword
  grep "$keyword" todo.txt
  echo "------------------------"
}

search_done() {
  echo "Enter the keyword to search in DONE tasks:"
  read keyword
  grep "$keyword" done.txt
  echo "------------------------"
}

mark_done() {
  echo "Enter the task to mark as done:"
  read task
  if grep -q "$task" todo.txt; then
    echo "$task" >> done.txt
    grep -v "$task" todo.txt > temp.txt && mv temp.txt todo.txt
    echo "Task marked as done."
    echo "------------------------"
  else
    echo "Task not found in TODO list."
  fi
}

while true; do
  echo "1. Add Task"
  echo "2. Remove Task"
  echo "3. List Tasks"
  echo "4. Search TODO Tasks"
  echo "5. Search DONE Tasks"
  echo "6. Mark Task as Done"
  echo "7. Exit"
  echo "Enter your choice:"
  read choice
  case $choice in
    1) add_task ;;
    2) remove_task ;;
    3) list_tasks ;;
    4) search_todo ;;
    5) search_done ;;
    6) mark_done ;;
    7) exit ;;
    *) echo "Invalid choice. Please enter a number between 1 and 7." ;;
  esac
done

# chmod +x todo.sh\n
# ./todo.sh