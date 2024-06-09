import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/screens/settings/locale_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => LocaleProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LocaleProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      locale: Locale(provider.currentLocale),
      theme: AppTheme.lightTheme,
      routes: {
        HomeScreen.routName: (_) => const HomeScreen(),
      },
      initialRoute: HomeScreen.routName,
    );
  }
}