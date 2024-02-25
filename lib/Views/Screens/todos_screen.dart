import 'package:api_test_1/Constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:api_test_1/ViewModels/todo_viewmodel.dart';

import '../../utils/loading_states.dart';

class TodosScreen extends StatefulWidget {
  final int userId;
  final String username;

  const TodosScreen({Key? key, required this.userId, required this.username})
      : super(key: key);

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TodoViewModel>(context, listen: false).getData(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username),
      ),
      body: Consumer<TodoViewModel>(
        builder: (context, provider, child) {
          return buildWithLoadingState(
            loadingState: provider.loadingState,
            successBuilder: () {
              return ListView.builder(
                itemCount: provider.todosList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          provider.todosList[index].title!,
                          style: TextStyle(
                            decoration:
                                provider.todosList[index].completed ?? false
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                          ),
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
