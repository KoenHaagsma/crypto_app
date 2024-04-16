import 'package:crypto_app/common/failures.dart';
import 'package:crypto_app/features/contentful/data/api/contentful_api.dart';
import 'package:crypto_app/features/contentful/domain/entity/banner_entity.dart';
import 'package:crypto_app/features/contentful/domain/repository/contentful_repository.dart';
import 'package:dartz/dartz.dart';

class ContentfulRepositoryImpl implements ContentfulRepository {
  final ContentfulApi contentfulApi;

  const ContentfulRepositoryImpl({required this.contentfulApi});

  @override
  Future<Either<Failure, List<BannerEntity>>> getBannerList() async {
    try {
      final result = await contentfulApi.getBannerList();
      return right(result);
    } on Exception catch (_) {
      return left(UnexpectedFailure());
    }
  }
}
