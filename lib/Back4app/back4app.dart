// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Back4app {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    final keyApplicationId = "wUKWGiHfn6MybLQtUnrjdg15UhzvLJG7SEx96aK2";
    final keyClientKey = "IhSAWibx1YKedOXydjE92JoPhgJNYwMHdMLRatOa";
    final keyParseServerUrl = "https://parseapi.back4app.com";
    final liveQueryUrl = "https://elokyetu1.b4a.io";

    await Parse().initialize(
      keyApplicationId,
      keyParseServerUrl,
      clientKey: keyClientKey,
      autoSendSessionId: true,
      liveQueryUrl: liveQueryUrl,
    );
  }
}
