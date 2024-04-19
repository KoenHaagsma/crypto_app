import 'package:crypto_app/common/failures.dart';
import 'package:crypto_app/features/contentful/presentation/contentful_notifier.dart';
import 'package:crypto_app/features/contentful/presentation/widgets/banner_list_item.dart';
import 'package:crypto_app/features/overview/domain/entity/crypto_entity.dart';
import 'package:crypto_app/features/overview/presentation/crypto_notifier.dart';
import 'package:crypto_app/features/overview/presentation/widgets/crypto_list_tile.dart';
import 'package:crypto_app/features/overview/presentation/widgets/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverviewPage extends ConsumerWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CryptoEntity>? cryptoEntityList =
        ref.watch(cryptoProvider).cryptoEntityList;
    Failure? failure = ref.watch(cryptoProvider).failure;
    bool isLoading = ref.watch(cryptoProvider).isLoading;
    ScrollController scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              height: 93,
              child: FilterList(
                scrollController: scrollController,
              ),
            ),
          ),
          Expanded(
            child: Builder(
              builder: (context) {
                if (isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (cryptoEntityList != null && cryptoEntityList.isNotEmpty) {
                  return ListView.builder(
                    shrinkWrap: true,
                    controller: scrollController,
                    itemCount: cryptoEntityList.length,
                    itemBuilder: (context, index) {
                      if (index == 3) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: BannerListItem(),
                        );
                      }
                      return CryptoListTile(
                        key: ValueKey(cryptoEntityList[index].id),
                        name: cryptoEntityList[index].name,
                        symbol: cryptoEntityList[index].symbol,
                        imageUrl: cryptoEntityList[index].image,
                        value: cryptoEntityList[index].value,
                        changePercent: cryptoEntityList[index].changePercent,
                      );
                    },
                  );
                } else if (failure != null) {
                  return Center(
                    child: Text(failure.getMessage()),
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
