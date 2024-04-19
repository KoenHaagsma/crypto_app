import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CryptoListTile extends ConsumerStatefulWidget {
  const CryptoListTile({
    super.key,
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.value,
    required this.changePercent,
  });

  final String? name;
  final String? symbol;
  final String? imageUrl;
  final double? value;
  final double? changePercent;

  @override
  ConsumerState<CryptoListTile> createState() => _CryptoListTileState();
}

class _CryptoListTileState extends ConsumerState<CryptoListTile> {
  onTileClicked() {
    // ref.read(cryptoProvider.notifier).setSelectedCrypto(widget.name!);
    context.go('/crypto/${widget.name}', extra: (
      widget.name,
      widget.symbol,
      widget.imageUrl,
      widget.value,
      widget.changePercent,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final name = widget.name ?? '';
    final symbol = widget.symbol ?? '';
    return ListTile(
      title: Text(name),
      subtitle: Text(symbol),
      onTap: onTileClicked,
      leading: widget.imageUrl != null
          ? Image.network(
              widget.imageUrl!,
              width: 24,
              height: 24,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null
                      ? child
                      : const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(),
                        ),
              errorBuilder: (context, error, stackTrace) => Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              cacheHeight: 96,
              cacheWidth: 96,
            )
          : const SizedBox(),
      trailing: widget.value != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${widget.value! >= 9.9 ? widget.value!.toStringAsFixed(2) : widget.value!.toStringAsFixed(6)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      widget.changePercent! > 0
                          ? Icons.arrow_drop_up
                          : widget.changePercent! < 0
                              ? Icons.arrow_drop_down
                              : Icons.remove,
                      color: widget.changePercent! > 0
                          ? Colors.green
                          : widget.changePercent! < 0
                              ? Colors.red
                              : Colors.black,
                      size: 16,
                    ),
                    Text(
                      '${widget.changePercent!.toStringAsFixed(2)}%',
                      style: TextStyle(
                        color: widget.changePercent! > 0
                            ? Colors.green
                            : widget.changePercent! < 0
                                ? Colors.red
                                : Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            )
          : const SizedBox(),
    );
  }
}
