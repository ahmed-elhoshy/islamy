import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/my_theme.dart';
import 'package:islamy/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      color: provider.isDark() ? MyTheme.primaryDark : MyTheme.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                provider.newLang('en');
              },
              child: provider.appLanguage == 'en'
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.english)
                  : getUnselectedItemWidget(
                      AppLocalizations.of(context)!.english)),
          InkWell(
            onTap: () {
              provider.newLang('ar');
            },
            child: provider.appLanguage == 'ar'
                ? getSelectedItemWidget(AppLocalizations.of(context)!.arabi)
                : getUnselectedItemWidget(AppLocalizations.of(context)!.arabi),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: MyTheme.primaryLight),
          ),
          Icon(
            Icons.check_circle_outline_rounded,
            color: MyTheme.primaryLight,
          ),
        ],
      ),
    );
  }

  Widget getUnselectedItemWidget(String text) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: MyTheme.primaryLight,
                ),
          ),
        ],
      ),
    );
  }
}
