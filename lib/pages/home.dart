import 'package:flutter/material.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the 'screen' route without setState
          Navigator.pushNamed(context, '/screen');
        },
        child: Icon(Icons.add,),
      ),
      appBar: AppBar(
        title: Text(
          'TO DO APP',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Divider(height: 28.0),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 128.0, 0.0, 0.0),
              child: TextButton(
                onPressed: () {
                  // Navigate to the home page
                  Navigator.pushNamed(context, '/screen');
                },
                child: const Text(
                  'Welcome to To-Do List App!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: Colors.black
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
