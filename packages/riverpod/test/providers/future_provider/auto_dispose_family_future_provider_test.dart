import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('scoping an override overrides all the associated subproviders', () {
    test('when passing the provider itself', () async {
      final provider =
          FutureProvider.autoDispose.family<int, int>((ref, _) async => 0);
      final root = createContainer();
      final container = createContainer(parent: root, overrides: [provider]);

      expect(await container.read(provider(0).future), 0);
      expect(container.read(provider(0)), const AsyncData(0));
      expect(container.getAllProviderElementsInOrder(), [
        isA<ProviderElementBase>()
            .having((e) => e.origin, 'origin', provider(0)),
        isA<ProviderElementBase>()
            .having((e) => e.origin, 'origin', provider(0).future),
      ]);
      expect(root.getAllProviderElementsInOrder(), isEmpty);
    });
  });

  test('FutureProvider.autoDispose.family', () async {
    final provider = FutureProvider.autoDispose.family<int, int>((ref, a) {
      return Future.value(a * 2);
    });
    final container = createContainer();
    final listener = Listener<AsyncValue<int>>();

    container.listen(provider(21), listener, fireImmediately: true);

    verifyOnly(listener, listener(const AsyncValue.loading()));

    await container.pump();

    verifyOnly(listener, listener(const AsyncValue.data(42)));
  });
}