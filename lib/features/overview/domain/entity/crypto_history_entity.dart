import 'package:flutter/material.dart';

@immutable
class CryptoHistoryEntity {
  final String? value;
  final int? timestamp;

  const CryptoHistoryEntity({
    this.value,
    this.timestamp,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CryptoHistoryEntity &&
        other.value == value &&
        other.timestamp == timestamp;
  }

  @override
  List<Object?> get props => [value, timestamp];
}
