import 'dart:convert';

class YoutubeSearchRequestEntity {
  final String part;

  YoutubeSearchRequestEntity(this.part);

  Map<String, dynamic> toMap() {
    return {
      'part': part,
    };
  }

  factory YoutubeSearchRequestEntity.fromMap(Map<String, dynamic> map) {
    return YoutubeSearchRequestEntity(
      map['part'],
    );
  }

  String toJson() => json.encode(toMap());

  factory YoutubeSearchRequestEntity.fromJson(String source) => YoutubeSearchRequestEntity.fromMap(json.decode(source));
}
