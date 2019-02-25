class Recipe {
  final String name;
  final String photo;
  final String recipeUrl;
  final int yield;  //Raciones
  final String diet;
  final List health;
  final List ingrLines;
  final List ingr;
  final double calories;
  final double weight;
  final double time;
  final String energkcal;
  final double quantenerg;
  final String unitenerg;
  final String fat;
  final double quantfat;
  final String unitfat;
  final String sugar;
  final double quantsugar;
  final String unitsugar;
  final String proteinkcal;
  final double quantprotein;
  final String unitprotein;
  final String cholekcal;
  final double quantchole;
  final String unitchole;


  Recipe({
    this.name,
    this.photo,
    this.recipeUrl,
    this.yield,  //Raciones
    this.diet,
    this.health,
    this.ingrLines,
    this.ingr,
    this.calories,
    this.weight,
    this.time,
    this.energkcal,
    this.quantenerg,
    this.unitenerg,
    this.fat,
    this.quantfat,
    this.unitfat,
    this.sugar,
    this.quantsugar,
    this.unitsugar,
    this.proteinkcal,
    this.quantprotein,
    this.unitprotein,
    this.cholekcal,
    this.quantchole,
    this.unitchole
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
        name: json['label'],
        photo: json['image'],
        recipeUrl: json['url'],
        yield: json['yield'],  //Raciones
        diet: json['dietLabel'][0],
        health: json['healthLabels'],
        ingrLines: json['ingredientLines'],
        ingr: json['ingredients'],
        calories: json['calories'],
        weight: json['totalWeight'],
        time: json['totalTime'],
        energkcal: json['totalNutrients']["ENERC_KCAL"]["label"],
        quantenerg: json['totalNutrients']["ENERC_KCAL"]["quantity"],
        unitenerg: json['totalNutrients']["ENERC_KCAL"]["unit"],
        fat: json['totalNutrients']["FAT"]["label"],
        quantfat: json['totalNutrients']["FAT"]["quantity"],
        unitfat: json['totalNutrients']["FAT"]["unit"],
        sugar: json['totalNutrients']["SUGAR"]["label"],
        quantsugar: json['totalNutrients']["SUGAR"]["quantity"],
        unitsugar: json['totalNutrients']["SUGAR"]["unit"],
        proteinkcal: json['totalNutrients']["PROCNT"]["label"],
        quantprotein: json['totalNutrients']["PROCNT"]["quantity"],
        unitprotein: json['totalNutrients']["PROCNT"]["unit"],
        cholekcal: json['totalNutrients']["CHOLE"]["label"],
        quantchole: json['totalNutrients']["CHOLE"]["quantity"],
        unitchole: json['totalNutrients']["CHOLE"]["unit"]
    );
  }
}