import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/models/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void add(String title) {
    if (title.isEmpty) {
      addError('Title is empty');
      return;
    }
    final todo = Todo(name: title, createdAt: DateTime.now());

    state.add(todo);
    emit(List.from(state));
  }

  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    print('TodoCubit: $change');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}
