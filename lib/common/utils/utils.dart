import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/widgets/progress_bar_with_text.dart';
import 'package:zomato_clone/navigation/navigation.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

void showLoaderDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return const ProgressBarWithText(text: "Verifying Credentials");
    },
  );
}

String _currencySymbol = "";

String getCurrencySymbol(BuildContext context) {
  if (_currencySymbol.isEmpty) {
    _currencySymbol = NumberFormat.simpleCurrency(
            locale: Localizations.localeOf(context).toString())
        .currencySymbol;
  }
  return _currencySymbol;
}

void showLanguageSelectionBottomSheet(BuildContext context, WidgetRef ref) {
  final currentLocale = ref.read(appLocaleProvider);
  final textTheme = Theme.of(context).textTheme;
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Language / भाषा चुनें",
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              title: const Text("English", style: TextStyle(fontWeight: FontWeight.w600)),
              trailing: currentLocale.languageCode == 'en'
                  ? const Icon(Icons.check_circle_rounded, color: primaryColor)
                  : null,
              onTap: () {
                ref.read(appLocaleProvider.notifier).state = const Locale('en');
                Navigator.pop(context);
              },
            ),
            const Divider(height: 1),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              title: const Text("हिन्दी (Hindi)", style: TextStyle(fontWeight: FontWeight.w600)),
              trailing: currentLocale.languageCode == 'hi'
                  ? const Icon(Icons.check_circle_rounded, color: primaryColor)
                  : null,
              onTap: () {
                ref.read(appLocaleProvider.notifier).state = const Locale('hi');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}

extension TextStyleX on TextStyle {
  /// A method to underline a text with a customizable [distance] between the text
  /// and underline. The [color], [thickness] and [style] can be set
  /// as the decorations of a [TextStyle].
  TextStyle underlined({
    Color? color,
    double distance = 1,
    double thickness = 1,
    TextDecorationStyle style = TextDecorationStyle.solid,
  }) {
    return copyWith(
      shadows: [
        Shadow(
          color: this.color ?? Colors.black,
          offset: Offset(0, -distance),
        )
      ],
      color: Colors.transparent,
      decoration: TextDecoration.underline,
      decorationThickness: thickness,
      decorationColor: color ?? this.color,
      decorationStyle: style,
    );
  }
}
