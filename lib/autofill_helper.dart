import 'dart:async';

import 'package:flutter/services.dart';

class AutofillHelper {
  static const MethodChannel _channel =
      const MethodChannel('autofill_helper');

  static Future<bool> saveCredentials(String fqdn, String username, String password) async {
    final String error = 
      await _channel.invokeMethod('saveCredentials', {"fqdn": fqdn, "username": username, "password": password});
    if (error != null) {
      throw Exception(error);
    }

    return true;
  }
}
