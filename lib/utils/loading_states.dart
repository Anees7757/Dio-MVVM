import 'package:api_test_1/Constants/app_constants.dart';
import 'package:flutter/material.dart';

Widget buildWithLoadingState({
  required LoadingState loadingState,
  required Widget Function() successBuilder,
}) {
  switch (loadingState) {
    case LoadingState.loading:
      return const Center(child: CircularProgressIndicator());
    case LoadingState.success:
      return successBuilder();
    case LoadingState.error:
      return const Center(
        child: Text('Failed to load. Please try again later.'),
      );
    default:
      return Container();
  }
}
