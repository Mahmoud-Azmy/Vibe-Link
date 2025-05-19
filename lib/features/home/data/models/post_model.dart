class PostModel {
  final String id;

  final String content;
  final String username;
  final String userImage;
  final String timeAgo;
  final String imageUrl;

  PostModel({
    required this.userImage,
    required this.content,
    required this.id,
    required this.username,
    required this.timeAgo,
    required this.imageUrl,
  });

  factory PostModel.fromMap(Map<String, dynamic> map, String id) {
    return PostModel(
      userImage: map['userImage'] ?? '',
      id: id,
      content: map['content'] ?? '',
      username: map['username'] ?? '',
      timeAgo: map['timeAgo'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userImage': userImage,
      'content': content,
      'username': username,
      'timeAgo': timeAgo,
      'imageUrl': imageUrl,
    };
  }
}
