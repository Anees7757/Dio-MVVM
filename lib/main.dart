import 'package:api_test_1/ViewModels/todo_viewmodel.dart';
import 'package:api_test_1/ViewModels/user_viewmodel.dart';
import 'package:api_test_1/Views/Screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ViewModels/post_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => PostViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => TodoViewModel(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
