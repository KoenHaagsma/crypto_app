import 'package:crypto_app/features/overview/domain/entity/crypto_entity.dart';
import 'package:crypto_app/features/overview/domain/usecase/get_crypto_by_name_usecase.dart';
import 'package:crypto_app/features/overview/domain/usecase/get_crypto_history_by_name_and_interval_usecase.dart';
import 'package:crypto_app/features/overview/domain/usecase/get_crypto_list_usecase.dart';
import 'package:crypto_app/features/overview/presentation/crypto_state.dart';
import 'package:crypto_app/injection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SortOptions { MarketCap, Price, Volume, ChangePercent }

enum SortDirection {
  Ascending,
  Descending,
}

class CryptoNotifier extends StateNotifier<CryptoState> {
  CryptoNotifier({
    required this.getCryptoUseCase,
    required this.getCryptoListUseCase,
    required this.getCryptoHistoryUseCase,
  }) : super(const CryptoState(
          cryptoEntity: CryptoEntity(),
        )) {
    // Initial call to get the data
    getCryptoList();
  }

  final GetCryptoByNameUseCase getCryptoUseCase;
  final GetCryptoListUseCase getCryptoListUseCase;
  final GetCryptoHistoryByNameAndIntervalUseCase getCryptoHistoryUseCase;

  getCryptoByName(String name) async {
    state = state.copyWith(isLoading: false);

    final result = await getCryptoUseCase.call(name);

    result.fold(
      (failure) {
        state = state.copyWith(failure: failure, isLoading: false);
      },
      (success) {
        state = state.copyWith(cryptoEntity: success, isLoading: false);
      },
    );
  }

  getCryptoByHistoryAndInterval(String name, String interval) async {
    state = state.copyWith(chartIsLoading: true);

    final result = await getCryptoHistoryUseCase.call(name, interval);

    result.fold(
      (failure) {
        state = state.copyWith(failure: failure, chartIsLoading: false);
      },
      (success) {
        state = state.copyWith(
            cryptoHistoryEntityList: success, chartIsLoading: false);
      },
    );
  }

  getCryptoList() async {
    state = state.copyWith(isLoading: true);

    final result = await getCryptoListUseCase.call();

    result.fold(
      (failure) {
        state = state.copyWith(failure: failure, isLoading: false);
      },
      (success) {
        state = state.copyWith(cryptoEntityList: success, isLoading: false);
      },
    );
  }

  sortCryptoList(SortOptions sortOption, bool changedOption) {
    List<CryptoEntity> cryptoEntityListCopy =
        List.from(state.cryptoEntityList!);

    if (changedOption) {
      state = state.copyWith(sortDirection: SortDirection.Descending);
    } else if (!changedOption &&
        state.sortDirection == SortDirection.Descending) {
      state = state.copyWith(sortDirection: SortDirection.Ascending);
    } else if (!changedOption &&
        state.sortDirection == SortDirection.Ascending) {
      state = state.copyWith(sortDirection: SortDirection.Descending);
    }

    switch (sortOption) {
      case SortOptions.MarketCap:
        cryptoEntityListCopy.sort((a, b) =>
            state.sortDirection != SortDirection.Descending
                ? a.marketCap!.compareTo(b.marketCap!)
                : b.marketCap!.compareTo(a.marketCap!));
        break;
      case SortOptions.Price:
        cryptoEntityListCopy.sort((a, b) =>
            state.sortDirection != SortDirection.Descending
                ? a.value!.compareTo(b.value!)
                : b.value!.compareTo(a.value!));
        break;
      case SortOptions.Volume:
        cryptoEntityListCopy.sort((a, b) =>
            state.sortDirection != SortDirection.Descending
                ? a.volume!.compareTo(b.volume!)
                : b.volume!.compareTo(a.volume!));
        break;
      case SortOptions.ChangePercent:
        cryptoEntityListCopy.sort((a, b) =>
            state.sortDirection != SortDirection.Descending
                ? a.changePercent!.compareTo(b.changePercent!)
                : b.changePercent!.compareTo(a.changePercent!));
        break;
    }

    state = state.copyWith(
      cryptoEntityList: cryptoEntityListCopy,
      sortOption: sortOption,
    );
  }
}

final cryptoProvider = StateNotifierProvider<CryptoNotifier, CryptoState>(
    (ref) => sl<CryptoNotifier>());
