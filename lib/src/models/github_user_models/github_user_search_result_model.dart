class GithubUserSearchResultModel {
  final String username;
  final int id;
  final String avatarUrl;

  GithubUserSearchResultModel({
    required this.username,
    required this.id,
    required this.avatarUrl,
  });

  factory GithubUserSearchResultModel.fromJson(Map json) {
    return GithubUserSearchResultModel(
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
