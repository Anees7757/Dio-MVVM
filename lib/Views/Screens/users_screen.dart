import 'package:api_test_1/Constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:api_test_1/ViewModels/user_viewmodel.dart';
import '../../utils/loading.dart';
import 'posts_screen.dart';
import 'todos_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserViewModel>(context, listen: false).getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Consumer<UserViewModel>(builder: (context, provider, child) {
        return buildWithLoadingState(
          loadingState: provider.loadingState,
          successBuilder: () {
            return ListView.builder(
              itemCount: provider.usersList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(provider.usersList[index].name!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(provider.usersList[index].email!),
                          Text(provider.usersList[index].phone!),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PostsScreen(
                                    userId: provider.usersList[index].id!,
                                    username: provider.usersList[index].name!,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.post_add),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TodosScreen(
                                    userId: provider.usersList[index].id!,
                                    username: provider.usersList[index].name!,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.list_alt),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
            );
          },
        );
      }),
    );
  }
}
