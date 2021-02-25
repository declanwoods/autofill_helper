import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:autofill_helper/autofill_helper.dart';

void main() {
  const MethodChannel channel = MethodChannel('autofill_helper');

  TestWidgetsFlutterBinding.ensureInitialized();

  group("fail", () {
    setUp(() {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        throw Exception("Blah");
      });
    });

    tearDown(() {
      channel.setMockMethodCallHandler(null);
    });

    test('saveCredentials', () async {
      expect(await AutofillHelper.saveCredentials("declan.sh", "declan", "password"), throwsA(Exception));
    });
  });

  group("success", () {
    setUp(() {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        return true;
      });
    });

    tearDown(() {
      channel.setMockMethodCallHandler(null);
    });

    test('saveCredentials', () async {
      expect(await AutofillHelper.saveCredentials("declan.sh", "declan", "password"), true);
    });
  });
}
