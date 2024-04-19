import 'package:crypto_app/features/overview/presentation/crypto_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterList extends ConsumerStatefulWidget {
  const FilterList({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  FilterListState createState() => FilterListState();
}

class FilterListState extends ConsumerState<FilterList> {
  onSortOptionSelected(SortOptions sortOption, bool changedOption) {
    ref.read(cryptoProvider.notifier).sortCryptoList(sortOption, changedOption);
    widget.scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final activeSort = ref.watch(cryptoProvider).sortOption;
    final sortDirection = ref.watch(cryptoProvider).sortDirection;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Sort by:',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 36,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: <Widget>[
              TextButton(
                onPressed: () {
                  onSortOptionSelected(
                    SortOptions.MarketCap,
                    activeSort != SortOptions.MarketCap,
                  );
                },
                style: (activeSort == SortOptions.MarketCap)
                    ? TextButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      )
                    : null,
                child: const Text(
                  'Marketcap',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () {
                  onSortOptionSelected(
                    SortOptions.Price,
                    activeSort != SortOptions.Price,
                  );
                },
                style: (activeSort == SortOptions.Price)
                    ? TextButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      )
                    : null,
                child: const Text(
                  'Price',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () {
                  onSortOptionSelected(
                    SortOptions.Volume,
                    activeSort != SortOptions.Volume,
                  );
                },
                style: (activeSort == SortOptions.Volume)
                    ? TextButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      )
                    : null,
                child: const Text(
                  'Volume',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () {
                  onSortOptionSelected(
                    SortOptions.ChangePercent,
                    activeSort != SortOptions.ChangePercent,
                  );
                },
                style: (activeSort == SortOptions.ChangePercent)
                    ? TextButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      )
                    : null,
                child: const Text(
                  'Change percentage',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              Text(
                sortDirection == SortDirection.Ascending
                    ? 'Ascending'
                    : 'Descending',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              Icon(
                sortDirection == SortDirection.Ascending
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
