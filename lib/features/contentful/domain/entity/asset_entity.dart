import 'package:flutter/material.dart';

@immutable
class AssetEntity {
  final String? id;
  final String? title;
  final String? url;

  const AssetEntity({
    this.id,
    this.title,
    this.url,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AssetEntity &&
        other.id == id &&
        other.title == title &&
        other.url == url;
  }

  @override
  List<Object?> get props => [id, title, url];
}
