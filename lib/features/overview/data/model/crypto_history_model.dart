import 'package:crypto_app/features/overview/domain/entity/crypto_history_entity.dart';

class CryptoHistoryModel extends CryptoHistoryEntity {
  const CryptoHistoryModel({
    String? value,
    int? timestamp,
  }) : super(
          value: value,
          timestamp: timestamp,
        );

  factory CryptoHistoryModel.fromJson(Map<String, dynamic> json) {
    return CryptoHistoryModel(
      value: json['value'],
      timestamp: json['timestamp'],
    );
  }
}
