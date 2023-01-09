import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/repo/todo_dao_repository.dart';

import '../../data/entity/todos.dart';

class HomepageCubit extends Cubit<List<Todos>> {
  HomepageCubit() : super(<Todos>[]);
  var todoRepo = TodoDaoRepository();
  Future<void> getTodos() async {
    var list = await todoRepo.getTodos();
    emit(list);
  }

  Future<void> searchTask(String searchText) async {
    var list = await todoRepo.searchTask(searchText);
    emit(list);
  }

  Future<void> deleteTask(int id) async {
    await todoRepo.deleteTask(id);
    await todoRepo.getTodos();
  }
}
