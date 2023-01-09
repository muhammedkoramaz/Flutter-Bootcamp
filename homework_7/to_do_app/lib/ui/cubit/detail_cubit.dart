import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/repo/todo_dao_repository.dart';

class TodoDetailCubit extends Cubit {
  TodoDetailCubit() : super(0);
  var todoRepo = TodoDaoRepository();
  Future<void> updateTask(int id, String task) async {
    await todoRepo.updateTask(id, task);
  }
}
