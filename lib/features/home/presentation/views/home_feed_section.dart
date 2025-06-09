import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_link/features/home/presentation/controllers/CreatePost/post_cubit.dart';
import 'package:vibe_link/features/home/presentation/controllers/CreatePost/post_state.dart';
import 'package:vibe_link/features/home/presentation/widgets/post_card.dart';
import 'package:vibe_link/generated/l10n.dart';

class HomeFeedSection extends StatelessWidget {
  const HomeFeedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      hintText: S.of(context).search,
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Tabs
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).popular,
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  S.of(context).trending,
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  S.of(context).following,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          // Feed
          BlocBuilder<PostCubit, CreatePostState>(
            buildWhen: (previous, current) {
              return current is PostsLoading ||
                  current is PostsLoaded ||
                  current is PostsError;
            },
            builder: (context, state) {
              if (state is PostsLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is PostsLoaded) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    final post = state.posts[index];
                    return PostCard(
                      content: post.content,
                      username: post.username,
                      timeAgo: post.timeAgo,
                      imageUrl: post.imageUrl,
                      likes: 5,
                      comments: 5,
                      onLike: () {
                        // context.read<PostsCubit>().likePost(post.id)
                      },
                      onComment: () {
                        //_showCommentDialog(context, post.id)
                      },
                    );
                  },
                );
              } else if (state is PostsError) {
                return Center(child: Text(S.of(context).failedToLoadPosts));
              }
              return SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  // void _showCreatePostDialog(BuildContext context) {
  //   final controller = TextEditingController();
  //   showDialog(
  //     context: context,
  //     builder:
  //         (_) => AlertDialog(
  //           title: Text('Create Post'),
  //           content: TextField(
  //             controller: controller,
  //             decoration: InputDecoration(hintText: 'What\'s on your mind?'),
  //           ),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 context.read<PostsCubit>().createPost(controller.text);
  //                 Navigator.of(context).pop();
  //               },
  //               child: Text('Post'),
  //             ),
  //           ],
  //         ),
  //   );
  // }

  //   void _showCommentDialog(BuildContext context, String postId) {
  //     final controller = TextEditingController();
  //     showDialog(
  //       context: context,
  //       builder:
  //           (_) => AlertDialog(
  //             title: Text('Add Comment'),
  //             content: TextField(
  //               controller: controller,
  //               decoration: InputDecoration(hintText: 'Enter your comment'),
  //             ),
  //             actions: [
  //               TextButton(
  //                 onPressed: () {
  //                   context.read<PostsCubit>().addComment(
  //                     postId,
  //                     controller.text,
  //                   );
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: Text('Post'),
  //               ),
  //             ],
  //           ),
  //     );
  //   }
}
