class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> stps;
  final int duration;
  final bool isPortugal;
  final bool isAngola;
  final bool isFranca;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.stps,
    required this.duration,
    required this.isAngola,
    required this.isPortugal,
    required this.isFranca,
  });
}
