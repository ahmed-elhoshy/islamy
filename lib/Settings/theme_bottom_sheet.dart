import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/my_theme.dart';
import 'package:islamy/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
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
                provider.changeTheme(ThemeMode.light);
              },
              child: provider.isDark()
                  ? getUnselectedItemWidget(AppLocalizations.of(context)!.light)
                  : getSelectedItemWidget(AppLocalizations.of(context)!.light)),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            child: provider.isDark()
                ? getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                : getUnselectedItemWidget(AppLocalizations.of(context)!.dark),
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
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: provider.isDark()
                    ? MyTheme.goldenColor
                    : MyTheme.primaryLight),
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
                  color: provider.isDark()
                      ? MyTheme.primaryLight
                      : MyTheme.blackColor,
                ),
          ),
        ],
      ),
    );
  }
}
