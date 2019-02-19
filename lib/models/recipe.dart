class Recipe {
  // TODO add more parameters
  final String name;

  Recipe({this.name});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(name: json['label']);
  }
}
