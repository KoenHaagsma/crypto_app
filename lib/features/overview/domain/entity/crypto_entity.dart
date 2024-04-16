import 'package:flutter/material.dart';

@immutable
class CryptoEntity {
  final String? id;
  final String? name;
  final String? symbol;
  final double? value;
  final String? image;
  final double? marketCap;
  final double? volume;
  final double? changePercent;

  const CryptoEntity({
    this.id,
    this.name,
    this.symbol,
    this.value,
    this.image,
    this.marketCap,
    this.volume,
    this.changePercent,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CryptoEntity &&
        other.id == id &&
        other.name == name &&
        other.symbol == symbol &&
        other.value == value &&
        other.image == image;
  }

  @override
  List<Object?> get props => [id, name, symbol, value, image];
}
