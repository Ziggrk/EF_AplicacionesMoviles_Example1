class Story{
  String name;
  String type;

  Story({
    required this.name,
    required this.type
  });
  static Story objJson(Map<String, dynamic> json){
    return Story(
      name: json['name'] as String,
      type: json['type'] as String
    );
  }
}