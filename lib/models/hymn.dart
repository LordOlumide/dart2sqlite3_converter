class Hymn {
  final int hymnNumber;
  final String hymnName;
  final String hymnLyrics;
  final String category;

  Hymn({
    required this.hymnNumber,
    required this.hymnName,
    required this.hymnLyrics,
    required this.category,
  });

  factory Hymn.fromMap(Map<String, dynamic> map) {
    return Hymn(
      hymnNumber: map['Hymn Number'],
      hymnName: map['Hymn Name'],
      hymnLyrics: map['Hymn Lyrics'],
      category: map['Category'],
    );
  }

  @override
  String toString() {
    return 'Hymn Number: $hymnNumber, '
        'Hymn Name: $hymnName, '
        'Hymn Lyrics: $hymnLyrics, '
        'Category: $category.';
  }
}
