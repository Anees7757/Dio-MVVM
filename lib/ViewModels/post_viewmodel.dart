import 'package:api_test_1/Repository/api_repo.dart';
import 'package:api_test_1/utils/request_methods.dart';
import 'package:flutter/cupertino.dart';

import '../Constants/api_constants.dart';
import '../Constants/app_constants.dart';
import '../Models/post.dart';
import '../utils/loading_states.dart';

class PostViewModel extends ChangeNotifier {
  List<Post> postsList = [];
  LoadingState loadingState = LoadingState.loading;

  getData(int userId) {
    ApiRepo().apiFetch(
      path: ApiConstants.instance.posts,
      beforeSend: () {
        loadingState = LoadingState.loading;
        print('Processing Data');
        notifyListeners();
      },
      onSuccess: (data) {
        print('Data Processed');
        for (var postData in data) {
          postsList.add(Post.fromJson(postData));
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
