

// Function to add a new task
void addTask(String task, List<String> tasks, Function updateTasks) 
{
  updateTasks(() {
    tasks.add(task);
  });
}
