import 'package:crypto_app/features/contentful/domain/usecase/get_banner_list_usecase.dart';
import 'package:crypto_app/features/contentful/presentation/contentful_state.dart';
import 'package:crypto_app/injection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContentfulNotifier extends StateNotifier<ContentfulState> {
  ContentfulNotifier({
    required this.getBannerListUseCase,
  }) : super(const ContentfulState()) {
    getBannerList();
  }

  final GetBannerListUseCase getBannerListUseCase;

  getBannerList() async {
    state = state.copyWith(isLoading: true);

    final result = await getBannerListUseCase.call();

    result.fold(
      (failure) {
        state = state.copyWith(failure: failure, isLoading: false);
      },
      (success) {
        state = state.copyWith(bannerList: success, isLoading: false);
      },
    );
  }
}

final contentfulProvider =
    StateNotifierProvider<ContentfulNotifier, ContentfulState>(
        (ref) => sl<ContentfulNotifier>());
