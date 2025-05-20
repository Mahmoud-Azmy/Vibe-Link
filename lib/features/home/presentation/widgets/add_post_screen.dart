import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_link/core/components/custom_button.dart';
import 'package:vibe_link/core/theme/app_text_style.dart';
import 'package:vibe_link/core/utils/app_strings.dart';
import 'package:vibe_link/features/home/presentation/controllers/CreatePost/post_cubit.dart';
import 'package:vibe_link/features/home/presentation/controllers/CreatePost/post_state.dart';

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
            TextFormField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: AppStrings.whatIsOnYourMind,
                border: InputBorder.none,
              ),
            ),
            SizedBox(height: 20),
            Spacer(),
            CustomButton(
              text: 'POST',
              onPressed: () {
                if (_controller.text.trim().isNotEmpty) {
                  context.read<PostCubit>().createPost(
                    content: _controller.text.trim(),
                    postImage: '',
                  );
                }
              },
              child: BlocConsumer<PostCubit, CreatePostState>(
                buildWhen: (previous, current) {
                  return current is CreatePostLoading ||
                      current is CreatePostSuccess ||
                      current is CreatePostFailure;
                },
                listener: (context, state) {
                  if (state is CreatePostSuccess) {
                    GoRouter.of(context).pop(true);
                  }
                  if (state is CreatePostFailure) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.error)));
                  }
                },
                builder: (context, state) {
                  if (state is CreatePostLoading) {
                    return Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  }
                  return Text('POST', style: AppTextStyles.font16Bold);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
