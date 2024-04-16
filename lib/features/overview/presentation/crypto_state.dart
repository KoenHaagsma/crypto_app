import 'package:crypto_app/common/failures.dart';
import 'package:crypto_app/features/overview/domain/entity/crypto_entity.dart';
import 'package:crypto_app/features/overview/presentation/crypto_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_state.freezed.dart';

@freezed
class CryptoState with _$CryptoState {
  const factory CryptoState({
    @Default(true) bool isLoading,
    CryptoEntity? cryptoEntity,
    @Default([]) List<CryptoEntity>? cryptoEntityList,
    @Default(SortOptions.MarketCap) SortOptions sortOption,
    @Default(SortDirection.Descending) SortDirection sortDirection,
    Failure? failure,
  }) = _CryptoState;

  const CryptoState._();
}
