import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_link/core/components/custom_button.dart';
import 'package:vibe_link/core/theme/app_text_style.dart';
import 'package:vibe_link/features/home/presentation/controllers/CreatePost/post_cubit.dart';
import 'package:vibe_link/features/home/presentation/controllers/CreatePost/post_state.dart';
import 'package:vibe_link/generated/l10n.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).addPost)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: context.read<PostCubit>().postController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: S.of(context).whatIsOnYourMind,
                border: InputBorder.none,
              ),
            ),
            SizedBox(height: 20),
            Spacer(),
            CustomButton(
              text: S.of(context).post,
              onPressed: () {
                if (context
                    .read<PostCubit>()
                    .postController
                    .text
                    .trim()
                    .isNotEmpty) {
                  context.read<PostCubit>().createPost(
                    content:
                        context.read<PostCubit>().postController.text.trim(),
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
                  return Text(
                    S.of(context).post,
                    style: AppTextStyles.font16Bold,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
