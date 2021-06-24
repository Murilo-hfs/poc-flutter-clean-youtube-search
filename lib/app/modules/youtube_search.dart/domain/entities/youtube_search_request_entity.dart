import 'dart:convert';

class YoutubeSearchRequestEntity {
  final String part;

  YoutubeSearchRequestEntity({this.part});

  Map<String, dynamic> toMap() {
    return {
      'part': part,
    };
  }

  String toJson() => json.encode(toMap());
}
