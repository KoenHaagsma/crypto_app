import 'package:dartz/dartz.dart';

import 'package:crypto_app/common/failures.dart';
import 'package:crypto_app/features/overview/data/api/crypto_api.dart';
import 'package:crypto_app/features/overview/domain/entity/crypto_entity.dart';
import 'package:crypto_app/features/overview/domain/repository/crypto_repository.dart';

class CryptoRepositoryImpl implements CryptoRepository {
  final CryptoApi cryptoApi;

  const CryptoRepositoryImpl({required this.cryptoApi});

  @override
  Future<Either<Failure, CryptoEntity>> getCurrency(String name) async {
    try {
      final result = await cryptoApi.getCurrency(name);
      return right(result);
    } on Exception catch (_) {
      return left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, List<CryptoEntity>>> getCurrencyList() async {
    try {
      final result = await cryptoApi.getCurrencyList();
      return right(result);
    } on Exception catch (_) {
      return left(UnexpectedFailure());
    }
  }
}
