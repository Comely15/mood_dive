class ImageItem {
  final String id;
  final String url;
  final String style;
  final String description;
  final bool isTwist;

  ImageItem({
    required this.id,
    required this.url,
    required this.style,
    required this.description,
    this.isTwist = false,
  });

  factory ImageItem.fromJson(Map<String, dynamic> json) {
    return ImageItem(
      id: json['id'],
      url: json['url'],
      style: json['style'],
      description: json['description'],
      isTwist: json['is_twist'] ?? false,
    );
  }
}
