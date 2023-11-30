class Creator{
  String name;
  String role;

  Creator({
    required this.name,
    required this.role
  });

  static Creator objJson(Map<String, dynamic> json){
    return Creator(
      name: json['name'] as String,
      role: json['role'] as String,
    );
  }
}