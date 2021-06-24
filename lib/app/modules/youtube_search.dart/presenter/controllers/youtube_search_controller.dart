import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/domain/entities/youtube_search_request_entity.dart';
import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/presenter/controllers/youtube_search_presenter.dart';
import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/presenter/ui/widgets/custom_dialog.dart';
import 'package:poc_clean_arch_mobx/app/modules/youtube_search.dart/presenter/usecase/youtube_search_usecase.dart';

class YoutubeSearchController extends YoutubeSearchPresenter {
  final YoutubeSearchUsecase linkUsecase;
  YoutubeSearchController(
    this.linkUsecase,
  ) {
    _init();
  }

  Future<void> list() async {
    execute(() => linkUsecase.list(selectState.value));
  }

  Future<void> create() async {
    try {
      setLoading(true);
      var response = await linkUsecase.fetchYoutube(
          YoutubeSearchRequestEntity(part: 'Link Pagamento Teste'));
      selectState.value.data.add(response);
      showInfoAlert(msg: 'Link de pagamento registrado com sucesso!');
    } catch (e) {
      setError(e);
    } finally {
      setLoading(false);
    }
  }

  void _init() async {
    await list();
  }
}
