import 'package:api_test_1/Constants/app_constants.dart';
import 'package:api_test_1/Repository/api_repo.dart';
import 'package:flutter/cupertino.dart';

import '../Constants/api_constants.dart';
import '../Models/user.dart';

class UserViewModel extends ChangeNotifier {
  List<User> usersList = [];
  LoadingState loadingState = LoadingState.loading;

  getData() {
    ApiRepo().apiFetch(
      path: ApiConstants.instance.users,
      beforeSend: () {
        loadingState = LoadingState.loading;
        print('Processing Data');
        notifyListeners();
      },
      onSuccess: (data) {
        print('Data Processed');
        for (var userData in data) {
          usersList.add(User.fromJson(userData));
        }
        debugPrint("User name ${usersList.first.name}");
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
