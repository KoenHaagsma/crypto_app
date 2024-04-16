import 'package:crypto_app/features/contentful/data/model/asset_model.dart';
import 'package:crypto_app/features/contentful/domain/entity/banner_entity.dart';

class BannerModal extends BannerEntity {
  const BannerModal({
    String? id,
    String? title,
    String? assetUrl,
  }) : super(
          id: id,
          title: title,
          assetUrl: assetUrl,
        );

  factory BannerModal.fromJson(Map<String, dynamic> json, AssetModel asset) {
    return BannerModal(
      id: json['metadata']['id'],
      title: json['fields']['title'],
      assetUrl: asset.url,
    );
  }
}
