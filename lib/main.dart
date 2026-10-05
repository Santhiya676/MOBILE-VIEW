




import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'routes/routes.dart';
import 'app_theme.dart';

void main() {
  runApp(const ProviderScope(child: GTInStockApp()));
}

class GTInStockApp extends ConsumerWidget {
  const GTInStockApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'One Enterprise Cloud Platform',
      theme: AppTheme.theme,
      routerConfig: ref.watch(appRouterProvider),
    );
  }
}
