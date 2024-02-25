import 'package:api_test_1/Constants/app_constants.dart';
import 'package:api_test_1/Repository/api_repo.dart';
import 'package:flutter/cupertino.dart';

import '../Constants/api_constants.dart';
import '../Models/Todo.dart';

class TodoViewModel extends ChangeNotifier {
  List<Todo> todosList = [];
  LoadingState loadingState = LoadingState.loading;

  getData(int userId) {
    ApiRepo().apiFetch(
      path: '${ApiConstants.instance.todos}?userId=$userId',
      beforeSend: () {
        loadingState = LoadingState.loading;
        print('Processing Data');
        notifyListeners();
      },
      onSuccess: (data) {
        print('Data Processed');
        for (var todoData in data) {
          todosList.add(Todo.fromJson(todoData));
        }
        loadingState = LoadingState.success;
        notifyListeners();
      },
      onError: (error) {
        loadingState = LoadingState.error;
        print(error.toString());
        notifyListeners();
      },
    );
    notifyListeners();
  }
}
