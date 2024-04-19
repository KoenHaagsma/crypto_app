import 'package:crypto_app/common/failures.dart';
import 'package:crypto_app/features/contentful/domain/entity/banner_entity.dart';
import 'package:crypto_app/features/contentful/presentation/contentful_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BannerListItem extends ConsumerWidget {
  const BannerListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<BannerEntity>? bannerList = ref.watch(contentfulProvider).bannerList;
    Failure? failure = ref.watch(contentfulProvider).failure;
    bool isLoading = ref.watch(contentfulProvider).isLoading;

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (failure != null) {
      return Center(
        child: Text(failure.getMessage()),
      );
    }

    if (bannerList.isNotEmpty) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white12,
        ),
        child: Image.network(
          bannerList[0].assetUrl!,
          fit: BoxFit.cover,
        ),
      );
    }

    return Container();
  }
}
