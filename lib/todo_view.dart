import 'package:flutter/material.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  final tasks = <String>[];
  final List<bool> taskCompletion = [];
  TextEditingController taskController = TextEditingController();

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('To-do list app')),
      body: Column(
        children: [
          const Text(
            'Hoàng Minh Thành - 2221050565',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: taskController,
              decoration: const InputDecoration(
                labelText: 'Nhập tên công việc',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: addTask,
            child: const Text('Thêm công việc'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks.elementAt(index)),
                  leading: Checkbox(
                    value: taskCompletion[index],
                    onChanged: (bool? value) {
                      setState(() {
                        taskCompletion[index] = value ?? false;
                      });
                    },
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      removeTask(index);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void addTask() {
    if (taskController.text.isNotEmpty) {
      setState(() {
        tasks.add(taskController.text);
        taskCompletion.add(false); // Add false for the completion status
        taskController.clear();
      });
    }
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
      taskCompletion.removeAt(index); // Remove corresponding completion status
    });
  }
}
