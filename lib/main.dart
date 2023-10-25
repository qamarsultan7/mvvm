import 'package:flutter/material.dart';
import 'package:mvvm/Utils/Routes/route.dart';
import 'package:mvvm/Utils/Routes/routes_name.dart';
import 'package:mvvm/View%20Model/auth_userModel.dart';
import 'package:mvvm/View%20Model/auth_viewmodel.dart';
import 'package:mvvm/View%20Model/home_viewmodel.dart';
import 'package:mvvm/View/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            progressIndicatorTheme:
                const ProgressIndicatorThemeData(color: Colors.white),
            primarySwatch: Colors.blue,
            primaryColor: Colors.blue,
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
            useMaterial3: false,
          ),
          initialRoute: RouteNames.splashscreen,
          onGenerateRoute: Routes.generateRoute),
    );
  }
}
