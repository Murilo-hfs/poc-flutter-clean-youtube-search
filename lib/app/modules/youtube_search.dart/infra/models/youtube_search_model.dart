import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/domain/entities/youtube_search_response.dart';

class YoutubeSearchModel extends YoutubeSearchResponseEntity {
  // final String kind;
  YoutubeSearchModel({String kind}) : super(pesquisa: kind);
  static YoutubeSearchModel fromMap(Map<String, dynamic> map) {
    return YoutubeSearchModel(
      kind: map['kind'],
    );
  }
}
