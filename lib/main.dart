import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:provider1/provider/favlistprovider.dart';
import 'package:provider1/provider/languageprovider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider1/screens/Todo/todolist.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => favlistprovider(),
      ),
      ChangeNotifierProvider(
        create: (context) => LanguageProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [Locale('en'), Locale('hi')],
        locale: context.watch<LanguageProvider>().current,
        //Provider.of<LanguageProvider>(context).current,
        home: MyTodoList());
  }
}

class MyLocalization extends StatelessWidget {
  const MyLocalization({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.greeting,
            style: TextStyle(fontSize: 25),
          ),
          Text(
            AppLocalizations.of(context)!.welcomeText,
            style: TextStyle(fontSize: 20),
          ),
          InkWell(
            onTap: () {
              context.read<LanguageProvider>().changeLanguage();
              // Provider.of<LanguageProvider>(context, listen: false)
              //     .changeLanguage();
            },
            child: Container(
              height: 50,
              width: 100,
              color: Colors.blue,
              child: Center(
                child: Text("Change"),
              ),
            ),
          )
        ],
      )),
    );
  }
}
