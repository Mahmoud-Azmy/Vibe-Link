import 'package:flutter/material.dart';
import 'package:vibe_link/features/home/presentation/widgets/post_card.dart';

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
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                hintText: 'Search',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
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
                  'Popular',
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Trending', style: TextStyle(color: Colors.grey)),
                Text('Following', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          // Feed
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              PostCard(
                username: 'Thanh Pham',
                timeAgo: '1 hour ago',
                imageUrl: 'https://via.placeholder.com/300',
                likes: 125,
                comments: 20,
              ),
              PostCard(
                username: 'Bruno',
                timeAgo: '1 hour ago',
                imageUrl: 'https://via.placeholder.com/300',
                likes: 125,
                comments: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
