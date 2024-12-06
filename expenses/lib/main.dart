import 'package:expenses/widgets/expanses.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown])
  //     .then((value) => runApp(const MyApp()));
  runApp(const MyApp());
}

var myColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 59, 96, 179),
);
var myDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 59, 96, 179),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expenses',
      themeMode: ThemeMode.dark,
      theme: ThemeData().copyWith(
          colorScheme: myColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: myColorScheme.onPrimaryContainer,
            foregroundColor: myColorScheme.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
              color: myColorScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8)),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: myColorScheme.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: myColorScheme.onSecondaryContainer,
                  fontSize: 17))),
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: myColorScheme,
          bottomSheetTheme: const BottomSheetThemeData()
              .copyWith(backgroundColor: myDarkColorScheme.onPrimaryContainer),
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: myDarkColorScheme.onPrimaryContainer,
            foregroundColor: myDarkColorScheme.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
              color: myDarkColorScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8)),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: myDarkColorScheme.onPrimaryContainer,
              foregroundColor: myDarkColorScheme.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: myDarkColorScheme.onSecondaryContainer,
                  fontSize: 17))),

      //   primaryColor: Colors.orange,
      //   brightness: Brightness.light,
      //   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(secondary: Colors.orange),

      // ),

      // darkTheme: ThemeData(
      //   primaryColor: Colors.orange,
      //   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(secondary: Colors.orange),

      //   brightness: Brightness.dark,
      // ),
      home: const Expenses(),
    );
  }
}
