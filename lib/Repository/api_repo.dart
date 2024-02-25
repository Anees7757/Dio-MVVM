import 'package:api_test_1/Constants/api_constants.dart';
import 'package:api_test_1/Remote/Api%20Client/api_client.dart';

import '../Models/user.dart';

class ApiRepo {
  apiFetch({
    required String? path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiClient(
      baseUrl: ApiConstants.instance.baseurl,
      path: path!,
      body: body,
      queryParameters: queryParameters,
    ).apiRequest(
      beforeSend: beforeSend ?? beforeSend,
      onSuccess: (data) {
        if (onSuccess != null) {
          onSuccess((data).isEmpty ? List.empty() : data);
          /*data.map((e) => User.fromJson(e)).toList()*/
        }
      },
      onError: onError ?? onError,
    );
  }
}
