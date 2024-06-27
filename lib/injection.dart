import 'package:crypto_app/features/contentful/data/api/contentful_api.dart';
import 'package:crypto_app/features/contentful/data/repository/contentful_repository_impl.dart';
import 'package:crypto_app/features/contentful/domain/repository/contentful_repository.dart';
import 'package:crypto_app/features/contentful/domain/usecase/get_banner_list_usecase.dart';
import 'package:crypto_app/features/contentful/presentation/contentful_notifier.dart';
import 'package:crypto_app/features/overview/data/api/crypto_api.dart';
import 'package:crypto_app/features/overview/data/repository/crypto_repository_impl.dart';
import 'package:crypto_app/features/overview/domain/repository/crypto_repository.dart';
import 'package:crypto_app/features/overview/domain/usecase/get_crypto_by_name_usecase.dart';
import 'package:crypto_app/features/overview/domain/usecase/get_crypto_history_by_name_and_interval_usecase.dart';
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
        getCryptoHistoryUseCase: sl(),
      ));
  sl.registerFactory(() => ContentfulNotifier(getBannerListUseCase: sl()));

  // Domain
  sl.registerFactory(() => GetCryptoByNameUseCase(cryptoRepository: sl()));
  sl.registerFactory(() => GetCryptoListUseCase(cryptoRepository: sl()));
  sl.registerFactory(
      () => GetCryptoHistoryByNameAndIntervalUseCase(cryptoRepository: sl()));
  sl.registerFactory(() => GetBannerListUseCase(contentfulRepository: sl()));

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

  sl.registerFactory<ContentfulRepository>(
      () => ContentfulRepositoryImpl(contentfulApi: sl()));

  sl.registerFactory<ContentfulApi>(
    () => ContentfulApiImpl(
      dio: Dio(
        BaseOptions(
          baseUrl: 'https://cdn.contentful.com',
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type': 'application/json',
            'X-Contentful-RateLimit-Reset': 1
          },
        ),
      ),
    ),
  );
}
