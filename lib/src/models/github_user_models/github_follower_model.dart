class GithubFollowerModel {
  final String username;
  final int id;
  final String avatarUrl;

  GithubFollowerModel({
    required this.username,
    required this.id,
    required this.avatarUrl,
  });

  factory GithubFollowerModel.fromJson(Map json) {
    return GithubFollowerModel(
      id: json['id'],
      username: json['login'],
      avatarUrl: json['avatar_url'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'login': username,
      'avatar_url': avatarUrl,
    };
  }
}
