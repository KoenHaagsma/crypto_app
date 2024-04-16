import 'package:crypto_app/features/contentful/domain/entity/banner_entity.dart';

class BannerModal extends BannerEntity {
  const BannerModal({
    String? id,
    String? title,
  }) : super(
          id: id,
          title: title,
        );

  factory BannerModal.fromJson(Map<String, dynamic> json) {
    return BannerModal(
      id: json['id'],
      title: json['title'],
    );
  }
}
