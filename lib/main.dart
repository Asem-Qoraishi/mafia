import 'package:flutter/material.dart';
import 'package:mafia/Screens/home/home_screen.dart';
import 'package:mafia/providers/default_roles_provider.dart';
import 'package:mafia/providers/lastcard_provider.dart';
import 'package:mafia/providers/player_provider.dart';
import 'package:mafia/providers/show_role_provider.dart';
import 'package:mafia/utils/helpers/size_config.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => PlayerProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ShowRoleProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => LastCardProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => DefaultRolesProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
