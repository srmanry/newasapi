class NewsApiDataModel {
  final String title;
  final String description;
  final String urlToImage;
  final String content;

  NewsApiDataModel({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.content,
  });

  factory NewsApiDataModel.fromJson(Map<String, dynamic> json) {
    return NewsApiDataModel(
      title: json["title"] ?? "No Title",
      description: json["description"] ?? "No Description",
      urlToImage: json["urlToImage"] ?? "",
      content: json["content"] ?? "No Content Available",
    );
  }
}
