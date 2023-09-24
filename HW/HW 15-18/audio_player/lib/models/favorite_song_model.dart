class SongModel {
  final String id;
  final String title;
  final String artistNames;
  final String image;
  final String type;
  final String preview;

  SongModel(
      {required this.id,
      required this.title,
      required this.artistNames,
      required this.image,
      required this.type,
      required this.preview});
}
