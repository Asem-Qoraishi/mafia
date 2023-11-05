import 'package:flutter/material.dart';
import 'package:mafia/utils/helpers/size_config.dart';

class GamesCard extends StatelessWidget {
  final VoidCallback onPressed;
  final String imageUrl;
  const GamesCard({super.key, required this.onPressed, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidht(430),
      height: getProportionateScreenHeight(430),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(top: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        clipBehavior: Clip.hardEdge,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: const Color.fromRGBO(150, 0, 0, 1),
          backgroundColor: Colors.black,
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Image(
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
          image: AssetImage(imageUrl),
        ),
      ),
    );
  }
}
