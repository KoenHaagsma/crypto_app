import 'package:crypto_app/features/overview/domain/entity/crypto_entity.dart';

class CryptoModel extends CryptoEntity {
  CryptoModel({
    String? id,
    String? rank,
    String? name,
    String? symbol,
    String? value,
    String? image,
    String? marketCap,
    String? volume,
    String? changePercent,
  }) : super(
          id: id,
          rank: int.parse(rank!),
          name: name,
          symbol: symbol,
          value: double.parse(value!),
          image:
              'https://cryptologos.cc/logos/${name!.replaceAll(" ", "-").toLowerCase()}-${symbol!.toLowerCase()}-logo.png',
          marketCap: double.parse(marketCap!),
          volume: double.parse(volume!),
          changePercent: double.parse(changePercent!),
        );

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
      id: json['id'],
      rank: json['rank'],
      name: json['name'],
      symbol: json['symbol'],
      value: json['priceUsd'],
      marketCap: json['marketCapUsd'],
      volume: json['volumeUsd24Hr'],
      changePercent: json['changePercent24Hr'],
    );
  }
}
