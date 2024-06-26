import 'package:crypto_app/features/overview/domain/entity/crypto_history_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:crypto_app/common/failures.dart';
import 'package:crypto_app/features/overview/domain/entity/crypto_entity.dart';

abstract class CryptoRepository {
  Future<Either<Failure, CryptoEntity>> getCurrency(String name);
  Future<Either<Failure, List<CryptoHistoryEntity>>> getCurrencyChart(
      String name, String interval);
  Future<Either<Failure, List<CryptoEntity>>> getCurrencyList();
}
