// Smoke test for DevPaul Eats.
//
// The full app boots Firebase + DI in main(), so the widget tree is not
// pumped here. This guards the public app widget contract instead.

import 'package:flutter_test/flutter_test.dart';

import 'package:devpaul_eats/main.dart';

void main() {
  test('DevPaulEatsApp can be instantiated', () {
    const app = DevPaulEatsApp();
    expect(app, isA<DevPaulEatsApp>());
  });
}
