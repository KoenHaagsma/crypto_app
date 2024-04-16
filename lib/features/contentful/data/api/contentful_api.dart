import 'package:crypto_app/features/contentful/data/model/banner_model.dart';

abstract class ContentfulApi {
  Future<List<BannerModal>> getBannerList();
}

class ContentfulApiImpl implements ContentfulApi {
  @override
  Future<List<BannerModal>> getBannerList() {}
}
