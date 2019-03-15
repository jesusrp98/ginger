class UserSettings {
  String name, email, url;
  bool vegan,
      vegetarian,
      dairy,
      gluten,
      wheat,
      egg,
      peanut,
      treenut,
      soy,
      fish,
      shellfish;

  UserSettings({
    this.name,
    this.email,
    this.url,
    this.vegan,
    this.vegetarian,
    this.dairy,
    this.gluten,
    this.wheat,
    this.egg,
    this.peanut,
    this.treenut,
    this.soy,
    this.fish,
    this.shellfish,
  });

  factory UserSettings.fromJson({
    String name,
    String url,
    String email,
    dynamic json,
  }) {
    return UserSettings(
      name: name,
      url: url,
      email: email,
      vegan: json['vegan'],
      vegetarian: json['vegetarian'],
      dairy: json['dairy'],
      gluten: json['gluten'],
      wheat: json['wheat'],
      egg: json['egg'],
      peanut: json['peanut'],
      treenut: json['treenut'],
      soy: json['soy'],
      fish: json['fish'],
      shellfish: json['shellfish'],
    );
  }

  Map<String, bool> get toJson => {
        'vegan': this.vegan,
        'vegetarian': this.vegetarian,
        'dairy': this.dairy,
        'gluten': this.gluten,
        'wheat': this.wheat,
        'egg': this.egg,
        'peanut': this.peanut,
        'treenut': this.treenut,
        'soy': this.soy,
        'fish': this.fish,
        'shellfish': this.shellfish,
      };
}
