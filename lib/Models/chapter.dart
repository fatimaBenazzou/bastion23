class ChapterModel {
  const ChapterModel({
    required this.id,
    required this.chapter,
    required this.image,
    required this.avancement,
    required this.palais,
    required this.title,
    required this.sujet,
    required this.description,
    required this.audio,
  });

  final int id;
  final String image;
  final int chapter;
  final String sujet;
  final String title;
  final String description;
  final String audio;
  final int avancement;
  final int palais;
}
