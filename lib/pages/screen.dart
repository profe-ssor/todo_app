import 'package:flutter/material.dart';


class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<String> tasks = []; // Changed 'task' to 'tasks' for consistency

  void displayTaskDialog() async {
    TextEditingController taskController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('New Task'),
          content: TextField(
            controller: taskController,
            decoration: InputDecoration(hintText: 'Enter task'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the dialog without doing anything
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add the task to the list and close the dialog
                if (taskController.text.isNotEmpty) {
                  setState(() {
                    tasks.add(taskController.text); // Add task to the list
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

   // Dialog to update a task
  void displayUpdateDialog(int index) async {
    TextEditingController taskController = TextEditingController();
    taskController.text = tasks[index]; // Pre-fill with the current task

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update Task'),
          content: TextField(
            controller: taskController,
            decoration: InputDecoration(hintText: 'Edit task'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (taskController.text.isNotEmpty) {
                  setState(() {
                    tasks[index] = taskController.text; // Update the task
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }


// Dialog to confirm deletion

  void confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text(
            'Are you sure you want to delete this task?',
             style: TextStyle(
                  color: Colors.red[900],
                ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'NO',
                style: TextStyle(
                  color: Colors.green[900],
                ),
                ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  tasks.removeAt(index); // Remove the task
                });
                Navigator.of(context).pop(); // Close the dialog after deletion
              },
              child: Text(
                'YES',
                style: TextStyle(
                  color: Colors.red[900],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manage Task',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'CRUD Operations for To-Do List',
                style: TextStyle(
                  fontSize: 38.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            
            // Display the list of tasks
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                    child: Card(
                         child: ListTile(
                      title: Text(tasks[index]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              confirmDelete(index); 
                              // Show confirmation dialog before deletion
                            },
                             color: Colors.deepOrangeAccent[700],
                          ),
                          IconButton(
                            onPressed: (){
                              displayUpdateDialog(index); // Show update dialog
                            },
                           icon: Icon(Icons.edit),
                           color: Colors.orangeAccent.shade100,
                           )
                        ],
                      ),
                    ),
                    )
                   
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: displayTaskDialog, // Call the dialog when the button is pressed
        child: Icon(Icons.add),
      ),
    );
  }
}
