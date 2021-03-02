import 'dart:async';

import 'package:flutter/services.dart';

import 'package:autofill_helper/SavedCredential.dart';

class AutofillHelper {
  static const MethodChannel _channel = const MethodChannel('autofill_helper');

  static Future<List<SavedCredential>> getSavedCredentials(String fqdn, String username, String password) async {
    final List<SavedCredential> saved = await _channel.invokeMethod('getSavedCredentials', {});
    return saved;
  }

  static Future<void> saveCredentials(String fqdn, String username, String password) async {
    await _channel.invokeMethod('saveCredentials', {"fqdn": fqdn, "username": username, "password": password});
  }
}
