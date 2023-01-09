import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/ui/cubit/add_cubit.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

var tfTask = TextEditingController();

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 55, right: 55),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfTask,
                decoration: const InputDecoration(hintText: "Task"),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<TodoAddCubit>().saveTask(tfTask.text);
                  },
                  child: const Text("Add Todo")),
            ],
          ),
        ),
      ),
    );
  }
}
