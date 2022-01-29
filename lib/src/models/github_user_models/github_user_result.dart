class GithubUserResultModel {
  final String username;
  final int id;
  final String avatarUrl;

  GithubUserResultModel({
    required this.username,
    required this.id,
    required this.avatarUrl,
  });

  factory GithubUserResultModel.fromJson(Map json) {
    return GithubUserResultModel(
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
