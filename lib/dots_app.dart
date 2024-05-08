import 'package:dots/pages/root_page.dart';
import 'package:dots/state/time_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DotsApp extends StatelessWidget {
  const DotsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => TimeNotifier(),
        child: const RootPage(),
      ),
    );
  }
}
