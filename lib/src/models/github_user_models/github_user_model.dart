class GithubUserModel {
  final String username;
  final int id;
  final String avatarUrl;
  final String? bio;
  final int? followers;
  final int? following;
  final int? publicRepos;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  GithubUserModel({
    required this.username,
    required this.id,
    required this.avatarUrl,
    this.bio,
    this.followers,
    this.following,
    this.publicRepos,
    this.createdAt,
    this.updatedAt,
  });

  factory GithubUserModel.fromJson(Map json) {
    return GithubUserModel(
      id: json['id'],
      username: json['login'],
      avatarUrl: json['avatar_url'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      bio: json['bio'],
      publicRepos: json['public_repos'],
      followers: json['followers'],
      following: json['following'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'login': username,
      'avatar_url': avatarUrl,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'bio': bio,
      'public_repos': publicRepos,
      'followers': followers,
      'following': following,
    };
  }
}
