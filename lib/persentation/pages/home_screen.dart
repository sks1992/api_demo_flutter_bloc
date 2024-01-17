import 'package:bloc_flutter_api_demo/data/model/post_model.dart';
import 'package:bloc_flutter_api_demo/logic/cubbit/post_cubit.dart';
import 'package:bloc_flutter_api_demo/logic/cubbit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Handling"),
      ),
      body: SafeArea(
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PostLoadedState) {
              return buildPostListView(state.posts);
            }
            return const Center(
              child: Text("An error Occur"),
            );
          },
        ),
      ),
    );
  }

  Widget buildPostListView(List<PostModel> posts){
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          PostModel data = posts[index];
          return ListTile(
            title: Text("${index+1} ${data.title}"),
            subtitle: Text(data.body),
          );
        });
  }
}
