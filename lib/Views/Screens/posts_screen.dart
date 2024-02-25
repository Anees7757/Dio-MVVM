import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:api_test_1/ViewModels/post_viewmodel.dart';

import '../../Constants/app_constants.dart';
import '../../utils/loading_states.dart';

class PostsScreen extends StatefulWidget {
  final int userId;
  final String username;

  const PostsScreen({Key? key, required this.userId, required this.username})
      : super(key: key);

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PostViewModel>(context, listen: false).getData(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username),
      ),
      body: Consumer<PostViewModel>(builder: (context, provider, child) {
        return buildWithLoadingState(
          loadingState: provider.loadingState,
          successBuilder: () {
            return ListView.builder(
              itemCount: provider.postsList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(provider.postsList[index].title!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(provider.postsList[index].body!),
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
