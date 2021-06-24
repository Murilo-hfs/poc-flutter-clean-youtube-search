import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:poc_clean_arch_mobx/app/modules/errors/failure.dart';
import 'package:poc_clean_arch_mobx/app/modules/models/pagination_model.dart';
import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/domain/entities/youtube_search_response.dart';

class YoutubeSearchPresenter extends NotifierStore<Failure,
    PaginationModel<YoutubeSearchResponseEntity>> {
  YoutubeSearchPresenter()
      : super(PaginationModel<YoutubeSearchResponseEntity>(data: []));

  final busca = RxNotifier<TextEditingController>();
}
