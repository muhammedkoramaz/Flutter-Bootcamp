import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/repo/todo_dao_repository.dart';

class TodoAddCubit extends Cubit<void> {
  TodoAddCubit() : super(0);
  var todoRepo = TodoDaoRepository();

  Future<void> saveTask(String task) async {
    await todoRepo.saveTask(task);
    print("Task : $task");
  }
}
