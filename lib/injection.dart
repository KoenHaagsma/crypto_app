import 'package:crypto_app/features/overview/data/api/crypto_api.dart';
import 'package:crypto_app/features/overview/data/repository/crypto_repository_impl.dart';
import 'package:crypto_app/features/overview/domain/repository/crypto_repository.dart';
import 'package:crypto_app/features/overview/domain/usecase/get_crypto_by_name_usecase.dart';
import 'package:crypto_app/features/overview/domain/usecase/get_crypto_list_usecase.dart';
import 'package:crypto_app/features/overview/presentation/crypto_notifier.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Presentation
  sl.registerFactory(() => CryptoNotifier(
        getCryptoUseCase: sl(),
        getCryptoListUseCase: sl(),
      ));

  // Domain
  sl.registerFactory(() => GetCryptoByNameUseCase(cryptoRepository: sl()));
  sl.registerFactory(() => GetCryptoListUseCase(cryptoRepository: sl()));

  // Data
  sl.registerFactory<CryptoRepository>(
      () => CryptoRepositoryImpl(cryptoApi: sl()));

  sl.registerFactory<CryptoApi>(
    () => CryptoApiImpl(
      dio: Dio(
        BaseOptions(
          baseUrl: 'https://api.coincap.io/v2',
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      ),
    ),
  );
}
