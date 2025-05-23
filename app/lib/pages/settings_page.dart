import 'package:app/themes/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

  class SettingsPage extends StatelessWidget{
    const SettingsPage({super.key});

    @override
    Widget build (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("CAI DAT"),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //darkmode
              //Text("Dark Mode"),
              Icon(Icons.dark_mode),
              //switch
              CupertinoSwitch(
                  value:
                      Provider.of<ThemeProvider>(context,listen: false).isDarkMode,
                  onChanged: (value) =>
                      Provider.of<ThemeProvider>(context,listen: false)
                        .toggleTheme(),
              ),
            ],
          ),
        ),
      );
    }
  }