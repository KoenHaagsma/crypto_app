import 'package:crypto_app/common/failures.dart';
import 'package:crypto_app/features/contentful/domain/entity/banner_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contentful_state.freezed.dart';

@freezed
class ContentfulState with _$ContentfulState {
  const factory ContentfulState({
    @Default(true) bool isLoading,
    @Default([]) List<BannerEntity> bannerList,
    Failure? failure,
  }) = _ContentfulState;

  const ContentfulState._();
}
