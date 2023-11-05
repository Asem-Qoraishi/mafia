import 'package:flutter/material.dart';
import 'package:mafia/screens/home/home_screen.dart';
import 'package:mafia/utils/helpers/navigate_to_page.dart';

class MafiaScreen extends StatelessWidget {
  const MafiaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 40, 45, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(40, 40, 45, 1),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            navigateToPage(context, const HomeScreen());
          },
        ),
        title: const Text(
          "شب های مافیا",
          style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'شب های مافیا ',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, color: Colors.white),
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
