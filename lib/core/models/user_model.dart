class UserModel {
  String? phone;
  String? name;
  String? email;
  String? image;
  String? cover;
  String? uId;
  String? bio;

  UserModel({
    this.email,
    this.phone,
    this.name,
    this.uId,
    this.image,
    this.bio,
    this.cover,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    image = json['image'];
    uId = json['uId'];
    cover = json['cover'];
    bio = json['bio'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'image': image,
      'bio': bio,
      'cover': cover,
    };
  }
}
