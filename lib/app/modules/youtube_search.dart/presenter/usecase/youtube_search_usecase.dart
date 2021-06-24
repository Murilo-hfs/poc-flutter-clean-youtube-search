import 'dart:async';

import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/domain/entities/youtube_search_request_entity.dart';
import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/domain/entities/youtube_search_response.dart';

abstract class YoutubeSearchUsecase {
  FutureOr<YoutubeSearchResponseEntity> fetchYoutube(
      YoutubeSearchRequestEntity entity);
}
