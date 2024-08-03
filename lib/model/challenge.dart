class Challenge {
  int? id;
  final String title;
  final String description;
  final String? image;
  final bool active;

  Challenge({
    this.id,
    required this.title,
    required this.description,
    this.image,
    required this.active
});

  factory Challenge.fromJson(Map<String,dynamic> json) 
  => Challenge(
      id: json['id'],
      title: json['title'], 
      description: json['description'], 
      image: json['image'], 
      active: json['active'], 
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'active': active
    };
  }
}