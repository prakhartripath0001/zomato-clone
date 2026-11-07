import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeNavigation = StateProvider<int>(
  (ref) => 0,
);

final appLocaleProvider = StateProvider<Locale>(
  (ref) => const Locale('en'),
);

class Navigation {
  static final homeNavigationKey = GlobalKey<NavigatorState>();
}
