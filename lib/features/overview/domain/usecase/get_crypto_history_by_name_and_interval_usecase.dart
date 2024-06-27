import 'package:crypto_app/common/failures.dart';
import 'package:crypto_app/features/overview/domain/entity/crypto_history_entity.dart';
import 'package:crypto_app/features/overview/domain/repository/crypto_repository.dart';
import 'package:dartz/dartz.dart';

class GetCryptoHistoryByNameAndIntervalUseCase {
  final CryptoRepository cryptoRepository;

  GetCryptoHistoryByNameAndIntervalUseCase({required this.cryptoRepository});

  Future<Either<Failure, List<CryptoHistoryEntity>>> call(
      String name, String interval) async {
    return await cryptoRepository.getCurrencyChart(name, interval);
  }
}
