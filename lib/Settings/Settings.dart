import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/Settings/language_bottom_sheet.dart';
import 'package:islamy/Settings/theme_bottom_sheet.dart';
import 'package:islamy/my_theme.dart';
import 'package:islamy/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routename = 'SettingsScreen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      child: Column(
        children: [
          Text('Theming', style: Theme.of(context).textTheme.titleMedium),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              color: MyTheme.primaryLight,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.isDark()
                        ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              showLangBottomSheet();
            },
            child: Container(
              color: MyTheme.primaryLight,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == 'en'
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabi,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context,

        /// to reed context make class stateful
        builder: ((context) => ThemeBottomSheet()));
  }

  void showLangBottomSheet() {
    showModalBottomSheet(
        context: context, builder: ((context) => LanguageBottomSheet()));
  }
}
