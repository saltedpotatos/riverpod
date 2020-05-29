import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:riverpod/src/internals.dart';

class ChangeNotifierProviderSubscription<T> extends ProviderBaseSubscription {
  ChangeNotifierProviderSubscription._(this.value);

  final T value;
}

class ChangeNotifierProvider<T extends ChangeNotifier>
    extends AlwaysAliveProvider<ChangeNotifierProviderSubscription<T>, T> {
  ChangeNotifierProvider(this._create, {String name}) : super(name);

  final Create<T, ProviderReference> _create;

  @override
  _ChangeNotifierProviderState<T> createState() =>
      _ChangeNotifierProviderState();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends ProviderBaseState<ChangeNotifierProviderSubscription<T>, T,
        ChangeNotifierProvider<T>> {
  @override
  T state;

  @override
  void initState() {
    state = provider._create(ProviderReference(this))
      ..addListener(markNeedsNotifyListeners);
  }

  @override
  ChangeNotifierProviderSubscription<T> createProviderSubscription() {
    return ChangeNotifierProviderSubscription._(state);
  }

  @override
  void dispose() {
    state
      ..removeListener(markNeedsNotifyListeners)
      ..dispose();
    super.dispose();
  }
}
