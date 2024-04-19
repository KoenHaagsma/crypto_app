import 'package:crypto_app/features/contentful/domain/entity/asset_entity.dart';

class AssetModel extends AssetEntity {
  const AssetModel({
    String? id,
    String? title,
    String? url,
  }) : super(
          id: id,
          title: title,
          url: url,
        );

  factory AssetModel.fromJson(Map<String, dynamic> json) {
    return AssetModel(
      id: json['metadata']['id'],
      title: json['fields']['title'],
      url: 'https:${json['fields']['file']['url']}',
    );
  }
}
