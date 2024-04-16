import 'package:crypto_app/common/failures.dart';
import 'package:crypto_app/features/overview/domain/entity/crypto_entity.dart';
import 'package:crypto_app/features/overview/domain/repository/crypto_repository.dart';
import 'package:dartz/dartz.dart';

class GetCryptoListUseCase {
  final CryptoRepository cryptoRepository;

  GetCryptoListUseCase({required this.cryptoRepository});

  Future<Either<Failure, List<CryptoEntity>>> call() async {
    return cryptoRepository.getCurrencyList();
  }
}
