class GithubRepoModel {
  final String name;
  final String description;
  final int id;
  final List<dynamic> topics;
  final String? language;
  final DateTime createdAt;
  final DateTime updatedAt;

  GithubRepoModel(
      {required this.name,
      this.description = '',
      required this.id,
      required this.topics,
      this.language,
      required this.createdAt,
      required this.updatedAt});

  factory GithubRepoModel.fromJson(Map json) {
    return GithubRepoModel(
      name: json['name'],
      description: json['description'],
      id: json['id'],
      topics: json['topics'],
      language: json['language'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map toJson() => {
        'name': name,
        'description': description,
        'id': id,
        'topics': topics,
        'language': language,
        'created_at': createdAt,
        'updated_at': updatedAt
      };
}
