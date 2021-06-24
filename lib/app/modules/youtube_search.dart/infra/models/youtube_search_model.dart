import 'dart:convert';

import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/domain/entities/youtube_search_response.dart';

class YoutubeSearchModel extends YoutubeSearchResponseEntity {
  // String kind;
  // String etag;
  // String nextPageToken;
  // String regionCode;
  // PageInfo pageInfo;
  // List<Items> items;

  YoutubeSearchModel(String kind, String etag, String nextPageToken,
      String regionCode, PageInfo pageInfo, List<Items> items)
      : super(pesquisa: kind);

  factory YoutubeSearchModel.fromMap(Map<String, dynamic> map) {
    return YoutubeSearchModel(
      map['kind'],
      map['etag'],
      map['nextPageToken'],
      map['regionCode'],
      PageInfo.fromMap(map['pageInfo']),
      List<Items>.from(map['items']?.map((x) => Items.fromMap(x))),
    );
  }
}

class PageInfo {
  int totalResults;
  int resultsPerPage;

  PageInfo({this.totalResults, this.resultsPerPage});

  Map<String, dynamic> toMap() {
    return {
      'totalResults': totalResults,
      'resultsPerPage': resultsPerPage,
    };
  }

  factory PageInfo.fromMap(Map<String, dynamic> map) {
    return PageInfo(
      totalResults: map['totalResults'],
      resultsPerPage: map['resultsPerPage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PageInfo.fromJson(String source) =>
      PageInfo.fromMap(json.decode(source));
}

class Items {
  String kind;
  String etag;
  Id id;

  Items({this.kind, this.etag, this.id});

  Map<String, dynamic> toMap() {
    return {
      'kind': kind,
      'etag': etag,
      'id': id.toMap(),
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      kind: map['kind'],
      etag: map['etag'],
      id: Id.fromMap(map['id']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) => Items.fromMap(json.decode(source));
}

class Id {
  String kind;
  String videoId;
  String playlistId;
  String channelId;

  Id({this.kind, this.videoId, this.playlistId, this.channelId});

  Map<String, dynamic> toMap() {
    return {
      'kind': kind,
      'videoId': videoId,
      'playlistId': playlistId,
      'channelId': channelId,
    };
  }

  factory Id.fromMap(Map<String, dynamic> map) {
    return Id(
      kind: map['kind'],
      videoId: map['videoId'],
      playlistId: map['playlistId'],
      channelId: map['channelId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Id.fromJson(String source) => Id.fromMap(json.decode(source));
}
