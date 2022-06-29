class Comic {
  final int id;
  final String safeTitle;
  final String title;
  final String img;
  final String alt; // Hoover picture text?
  final String year;
  final String month;
  final String day;
  final String transcript;
  final String link; //Unknown use
  final String news;  //Unknown use
  bool favo = false;

  Comic({
    required this.id,
    required this.safeTitle,
    required this.title,
    required this.img,
    required this.alt,
    required this.year,
    required this.month,
    required this.day,
    required this.transcript,
    required this.link,
    required this.news,
  });

  factory Comic.fromJson(Map<String, dynamic> json) {
    return Comic(
      id: json['num'] as int,
      safeTitle: json['safe_title'] as String,
      title: json['title'] as String,
      img: json['img'] as String,
      alt: json['alt'] as String,
      year: json['year'] as String,
      month: json['month'] as String,
      day: json['day'] as String,
      transcript: json['transcript'] as String,
      link: json['link'] as String,
      news: json['news'] as String,
    );
  }
}
