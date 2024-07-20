// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_2/common/themes/app_theme.dart';
import 'package:provider/provider.dart';
import 'common/services/ticker_provider_services.dart';
import 'provider/switch_provider.dart';
import 'screens/switch_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SwitcherProvider(TickerProviderStub()),
      builder: (context, child) {
        final provider = Provider.of<SwitcherProvider>(context);
        return ScreenUtilInit(
          designSize: const Size(450, 720),
          builder: (context, child) {
            return MaterialApp(
              themeMode: provider.themeMode,
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              home: child,
            );
          },
          child: child,
        );
      },
      child: const Scaffold(
        body: Center(
          child: Switcher(),
        ),
      ),
    );
  }
}
