import 'package:crypto_app/common/failures.dart';
import 'package:crypto_app/features/contentful/domain/entity/banner_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ContentfulRepository {
  Future<Either<Failure, List<BannerEntity>>> getBannerList();
}
