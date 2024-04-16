import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = GoRouterState.of(context).pathParameters['name']!;

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: const Center(
        child: Text('Detail Page'),
      ),
    );
  }
}
