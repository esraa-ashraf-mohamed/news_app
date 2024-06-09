import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'locale_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  static const englishValue = 'en';
  static const arabicValue = 'ar';
  String selectedLocale = englishValue;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LocaleProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.language,
          style: AppTheme.lightTheme.textTheme.titleMedium,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              color: AppTheme.primaryColor),
          child: DropdownButton<String>(
            iconSize: 35,
            iconEnabledColor: AppTheme.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            padding: const EdgeInsets.all(10),
            dropdownColor: AppTheme.primaryColor,
            style: AppTheme.lightTheme.textTheme.titleSmall,
            value: selectedLocale,
            items: [
              DropdownMenuItem(
                value: englishValue,
                child: Text(
                  'English',
                  style: AppTheme.lightTheme.textTheme.titleMedium,
                ),
              ),
              DropdownMenuItem(
                value: arabicValue,
                child: Text(
                  'العربية',
                  style: AppTheme.lightTheme.textTheme.titleMedium,
                ),
              ),
            ],
            onChanged: (newValue) {
              setState(() {
                selectedLocale = newValue!;
                provider.appLanguage(selectedLocale);
              });
            },
            isExpanded: true,
          ),
        ),
      ],
    );
  }
}
