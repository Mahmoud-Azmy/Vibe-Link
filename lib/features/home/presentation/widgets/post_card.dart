import 'package:flutter/material.dart';
import 'package:vibe_link/core/utils/app_assets.dart';

class PostCard extends StatelessWidget {
  final String username;
  final String timeAgo;
  final String imageUrl;
  final int likes;
  final int comments;

  const PostCard({
    super.key,
    required this.username,
    required this.timeAgo,
    required this.imageUrl,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                AppAssets.welcome,
              ), // Placeholder avatar
            ),
            title: Text(username),
            subtitle: Text(timeAgo),
          ),
          Image.asset(AppAssets.welcome),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.favorite, color: Colors.purple),
                SizedBox(width: 4),
                Text('$likes'),
                SizedBox(width: 16),
                Icon(Icons.comment, color: Colors.purple),
                SizedBox(width: 4),
                Text('$comments'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
