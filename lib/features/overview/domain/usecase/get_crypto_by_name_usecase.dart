import 'package:crypto_app/common/failures.dart';
import 'package:crypto_app/features/overview/domain/entity/crypto_entity.dart';
import 'package:crypto_app/features/overview/domain/repository/crypto_repository.dart';
import 'package:dartz/dartz.dart';

class GetCryptoByNameUseCase {
  final CryptoRepository cryptoRepository;

  GetCryptoByNameUseCase({required this.cryptoRepository});

  Future<Either<Failure, CryptoEntity>> call(String name) async {
    return cryptoRepository.getCurrency(name);
  }
}
