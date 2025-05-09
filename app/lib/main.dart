import 'package:app/models/playlist_provider.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/pages/started_page.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => PlaylistProvider()),
        ],
        child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const GetStartedPage(),
      theme:Provider.of<ThemeProvider>(context).themeData,
    );
  }
}