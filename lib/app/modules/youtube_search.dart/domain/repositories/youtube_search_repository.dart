import 'dart:async';

import 'package:poc_clean_arch_mobx/app/modules/models/pagination_model.dart';
import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/domain/entities/youtube_search_request_entity.dart';
import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/domain/entities/youtube_search_response.dart';

abstract class YoutubeSearchRepository {
  FutureOr<YoutubeSearchResponseEntity> fetchYoutube(
      YoutubeSearchRequestEntity entity);
  FutureOr<PaginationModel<YoutubeSearchResponseEntity>> list(
      PaginationModel<YoutubeSearchResponseEntity> pagination);
}
