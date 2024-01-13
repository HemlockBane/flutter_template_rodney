import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rodney_flutter_template/core/app_logger.dart';

class ProviderLogger extends ProviderObserver {
  ProviderLogger({
    required AppLogger appLogger,
  }) : _logger = appLogger;

  final AppLogger _logger;

  @override
  void didAddProvider(
    ProviderBase<dynamic> provider,
    Object? value,
    ProviderContainer container,
  ) {
    final tag = provider.name ?? provider.runtimeType;
    _logger.logInfo(
      tag: '$tag',
      message: 'provider state: initialised',
    );
  }

  @override
  void providerDidFail(
    ProviderBase<dynamic> provider,
    Object? error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    final tag = provider.name ?? provider.runtimeType;
    _logger.logError(
      tag: '$tag',
      message: 'provider state: failed',
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    final tag = provider.name ?? provider.runtimeType;
    log('====================================================================');
    _logger.logInfo(tag: '$tag', message: 'previousValue: $previousValue');
    log('====================================================================');
    _logger.logInfo(tag: '$tag', message: 'currentValue: $newValue');
  }

  @override
  void didDisposeProvider(
    ProviderBase<dynamic> provider,
    ProviderContainer container,
  ) {
    final tag = provider.name ?? provider.runtimeType;
    _logger.logInfo(tag: '$tag', message: 'provider state: disposed');
  }
}
