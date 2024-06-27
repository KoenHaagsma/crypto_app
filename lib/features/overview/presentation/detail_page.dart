import 'package:crypto_app/common/failures.dart';
import 'package:crypto_app/features/overview/domain/entity/crypto_entity.dart';
import 'package:crypto_app/features/overview/domain/entity/crypto_history_entity.dart';
import 'package:crypto_app/features/overview/presentation/crypto_notifier.dart';
import 'package:crypto_app/features/overview/presentation/widgets/crypto_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = GoRouterState.of(context).pathParameters['name']!;
    CryptoEntity? cryptoEntity = ref.watch(cryptoProvider).cryptoEntity;
    Failure? failure = ref.watch(cryptoProvider).failure;
    bool isLoading = ref.watch(cryptoProvider).isLoading;
    List<CryptoHistoryEntity>? cryptoHistoryEntityList =
        ref.watch(cryptoProvider).cryptoHistoryEntityList;
    bool chartIsLoading = ref.watch(cryptoProvider).chartIsLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Builder(
              builder: (context) {
                if (isLoading) {
                  return const CircularProgressIndicator();
                }
                if (failure != null) {
                  return Text(failure.getMessage());
                }
                if (cryptoEntity != null) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    cryptoEntity.name!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4))),
                                    child: Text(
                                      '#${cryptoEntity.rank!.toString()}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CryptoValue(value: cryptoEntity.value!),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        cryptoEntity.changePercent! > 0
                                            ? Icons.arrow_drop_up
                                            : cryptoEntity.changePercent! < 0
                                                ? Icons.arrow_drop_down
                                                : Icons.remove,
                                        color: cryptoEntity.changePercent! > 0
                                            ? Colors.green
                                            : cryptoEntity.changePercent! < 0
                                                ? Colors.red
                                                : Colors.black,
                                        size: 16,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            '${cryptoEntity.changePercent!.toStringAsFixed(2)}%',
                                            style: TextStyle(
                                              color: cryptoEntity
                                                          .changePercent! >
                                                      0
                                                  ? Colors.green
                                                  : cryptoEntity
                                                              .changePercent! <
                                                          0
                                                      ? Colors.red
                                                      : Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const Text(
                                'Global average',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  );
                }
                return Container();
              },
            ),
            const SizedBox(height: 16),
            Builder(builder: (context) {
              if (chartIsLoading) {
                return const CircularProgressIndicator();
              }
              if (cryptoHistoryEntityList != null &&
                  cryptoHistoryEntityList.isNotEmpty) {
                return Container(
                  height: 200,
                  child: Placeholder(),
                );
              }
              return Container();
            })
          ],
        ),
      ),
    );
  }
}
