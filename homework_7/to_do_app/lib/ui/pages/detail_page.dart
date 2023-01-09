// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:to_do_app/data/entity/todos.dart';
import 'package:to_do_app/ui/cubit/detail_cubit.dart';

class DetailPage extends StatefulWidget {
  Todos todo;
  DetailPage({
    required this.todo,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var tfTask = TextEditingController();
  @override
  void initState() {
    var todo = widget.todo;
    tfTask.text = todo.task;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: tfTask,
              decoration: const InputDecoration(hintText: "To Do"),
            ),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<TodoDetailCubit>()
                      .updateTask(widget.todo.id, widget.todo.task);
                },
                child: const Text("Update")),
          ],
        ),
      ),
    );
  }
}
