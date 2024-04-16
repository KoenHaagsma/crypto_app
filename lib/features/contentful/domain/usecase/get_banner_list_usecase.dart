import 'package:crypto_app/common/failures.dart';
import 'package:crypto_app/features/contentful/domain/entity/banner_entity.dart';
import 'package:crypto_app/features/contentful/domain/repository/contentful_repository.dart';
import 'package:dartz/dartz.dart';

class GetBannerListUseCase {
  final ContentfulRepository contentfulRepository;

  GetBannerListUseCase({required this.contentfulRepository});

  Future<Either<Failure, List<BannerEntity>>> call() async {
    return contentfulRepository.getBannerList();
  }
}
