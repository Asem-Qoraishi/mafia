import 'package:flutter/material.dart';
import 'package:mafia/helpers/size_config.dart';

class GodfatherScreen extends StatelessWidget {
  const GodfatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 0, 20, 1),
        title: const Text(
          "Godfather",
          style: TextStyle(color: Color.fromRGBO(200, 0, 0, 1)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildCardItem(
                cardName: "انتخاب نقش ها",
                imageUrl: 'assets/common_images/select_roles.png',
                onPressed: () {},
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              _buildCardItem(
                cardName: 'معرفی نقش ها',
                imageUrl: 'assets/role_images/leon.png',
                onPressed: () {},
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              _buildCardItem(
                cardName: 'درباره بازی',
                imageUrl: 'assets/game_images/godfather.png',
                onPressed: () {},
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              _buildCardItem(
                cardName: 'تنظیمات',
                imageUrl: 'assets/common_images/select_roles.png',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardItem({
    required String cardName,
    required String imageUrl,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20.0),
        backgroundColor: const Color.fromRGBO(0, 0, 20, 1),
        elevation: 3,
        shadowColor: const Color.fromRGBO(200, 0, 0, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: Color.fromRGBO(150, 0, 0, 1),
            width: 1.5,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            width: getProportionateScreenWidht(160),
            height: getProportionateScreenHeight(160),
            fit: BoxFit.fill,
            image: AssetImage(imageUrl),
          ),
          Text(
            cardName,
            style: TextStyle(
              fontSize: getProportionateScreenWidht(22),
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
