

// Function to remove a task by index
void removeTask(int index, List<String> tasks, Function updateTasks)
 {
  updateTasks(() {
    tasks.removeAt(index);
  });
}
