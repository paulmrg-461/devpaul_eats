import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:devpaul_eats/core/di/injection.dart';
import 'package:devpaul_eats/core/router/app_router.dart';
import 'package:devpaul_eats/core/theme/app_theme.dart';
import 'package:devpaul_eats/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await configureDependencies();

  runApp(const DevPaulEatsApp());
}

class DevPaulEatsApp extends StatelessWidget {
  const DevPaulEatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DevPaul Eats',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      routerConfig: AppRouter.router,
    );
  }
}
