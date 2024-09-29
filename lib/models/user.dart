class User {
  String? avatar;
  String? username;
  String? name;

  User({
    this.avatar,
    this.username,
    this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        avatar: json['avatar_url'],
        username: json['username'],
        name: json['first_name'] + ' ' + json['last_name'],
      );
}
