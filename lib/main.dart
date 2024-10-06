import 'package:first_flutter_app/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  // Ensure that Flutter framework is fully initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();

  // Lock the app orientation to portrait mode only
  try {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  } catch (e) {
    // Handle any errors that might occur during orientation setup
    if (kDebugMode) {
      print('Failed to set preferred orientations: $e');
    }
  }

  // Run the main application widget
  runApp(const ProviderScope(
    child: App(),
  ));
}
