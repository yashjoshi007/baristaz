class DrinkModel {
  final String idDrink;
  final String strDrink;
  final String strDrinkThumb;
  final String strCategory;
  final String strInstructions;
  final String strIngredient1;
  final String strIngredient2;
  final String strIngredient3;
  final String strIngredient4;
  final String strIngredient5;
  final String strMeasure1;
  final String strMeasure2;
  final String strMeasure3;
  final String strMeasure4;
  final String strMeasure5;

  DrinkModel({
    required this.idDrink,
    required this.strDrink,
    required this.strDrinkThumb,
    required this.strCategory,
    required this.strInstructions,
    required this.strIngredient1,
    required this.strIngredient2,
    required this.strIngredient3,
    required this.strIngredient4,
    required this.strIngredient5,
    required this.strMeasure1,
    required this.strMeasure2,
    required this.strMeasure3,
    required this.strMeasure4,
    required this.strMeasure5,
  });

  factory DrinkModel.fromJson(Map<String, dynamic> json) {
    return DrinkModel(
      idDrink: json['idDrink'],
      strDrink: json['strDrink'],
      strDrinkThumb: json['strDrinkThumb'],
      strCategory: json['strCategory'],
      strInstructions: json['strInstructions'],
      strIngredient1: json['strIngredient1'],
      strIngredient2: json['strIngredient2'],
      strIngredient3: json['strIngredient3']??"",
      strIngredient4: json['strIngredient4']??"",
      strIngredient5: json['strIngredient5']??"",
      strMeasure1: json['strMeasure1'] ?? "",
      strMeasure2: json['strMeasure2'] ?? "",
      strMeasure3: json['strMeasure3'] ?? "",
      strMeasure4: json['strMeasure4'] ?? "",
      strMeasure5: json['strMeasure5'] ?? " ",
    );
  }
}
