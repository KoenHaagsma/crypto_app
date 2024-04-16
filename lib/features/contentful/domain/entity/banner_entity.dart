import 'package:flutter/material.dart';

@immutable
class BannerEntity {
  final String? id;
  final String? title;

  const BannerEntity({
    this.id,
    this.title,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BannerEntity && other.id == id && other.title == title;
  }

  @override
  List<Object?> get props => [id, title];
}
