import 'dart:async';

import 'package:poc_clean_arch_mobx/app/modules/models/pagination_model.dart';
import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/domain/entities/youtube_search_response.dart';

abstract class YoutubeSearchDataSource {
  FutureOr<Map<String, dynamic>> fetchYoutube(String body);
  FutureOr<Map<String, dynamic>> list(
      PaginationModel<YoutubeSearchResponseEntity> pagination);
}
