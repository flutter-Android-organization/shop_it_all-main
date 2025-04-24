import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_it_all/src/constants/color_constants.dart';
import 'package:shop_it_all/src/routes/route.dart';
import 'package:shop_it_all/src/shared_datastore/shared_preference.dart';

void main() async {
  //final prefs = await SharedPreferences.getInstance();
  runApp(
      ProviderScope(
      // overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: MyApp())
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final route = ref.watch(routeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: btnColor),
        useMaterial3: true,
      ),
      routerConfig: route,
    );
  }
}
