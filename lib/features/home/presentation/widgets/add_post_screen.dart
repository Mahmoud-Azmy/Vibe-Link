import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_link/features/home/presentation/controllers/CreatePost/create_post_cubit.dart';
import 'package:vibe_link/features/home/presentation/controllers/CreatePost/create_post_state.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "What's on your mind?",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.trim().isNotEmpty) {
                  context.read<CreatePostCubit>().createPost(
                    content: _controller.text.trim(),
                    postImage: '',
                  );
                }
              },
              child: BlocConsumer<CreatePostCubit, CreatePostState>(
                listener: (context, state) {
                  if (state is CreatePostSuccess) {
                    GoRouter.of(context).pop();
                  }
                  if (state is CreatePostFailure) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.error)));
                  }
                },
                builder: (context, state) {
                  if (state is CreatePostLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Text('Post');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
