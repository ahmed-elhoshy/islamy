import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/HomeScreen.dart';
import 'package:islamy/Quran/Surrah_details.dart';
import 'package:islamy/Quran/quran.dart';
import 'package:islamy/Radio/radio.dart';
import 'package:islamy/Sebha/sebha.dart';
import 'package:islamy/hadeth/hadeth.dart';
import 'package:islamy/hadeth/hadethDetails.dart';
import 'package:islamy/my_theme.dart';
import 'package:islamy/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: ((context) => AppConfigProvider()), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      initialRoute: HomeScreen.routename,
      routes: {
        HomeScreen.routename: (context) => HomeScreen(),
        QuranScreen.routename: (context) => QuranScreen(),
        SurrahDetails.routename: (context) => SurrahDetails(),
        HadethScreen.routename: (context) => HadethScreen(),
        HadethDetails.routename: (context) => HadethDetails(),
        SebhaScreen.routename: (context) => SebhaScreen(),
        RadioScreen.routename: (context) => RadioScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: provider.appTheme,
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
