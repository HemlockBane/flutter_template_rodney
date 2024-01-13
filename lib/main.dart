import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rodney_flutter_template/app.dart';
import 'package:rodney_flutter_template/core/app_logger.dart';
import 'package:rodney_flutter_template/core/provider_logger.dart';

void main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();

  final providerObservers = <ProviderObserver>[
    ProviderLogger(
      appLogger: AppLogger(),
    ),
  ];
  runApp(
    ProviderScope(
      observers: providerObservers,
      child: const App(),
    ),
  );
}
