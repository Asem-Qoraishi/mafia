import 'package:flutter/material.dart';
import 'package:mafia/helpers/size_config.dart';

class GamesCard extends StatelessWidget {
  final VoidCallback onPressed;
  final String imageUrl;
  const GamesCard({super.key, required this.onPressed, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidht(400),
      height: getProportionateScreenHeight(400),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        onPressed: onPressed,
        clipBehavior: Clip.hardEdge,
        style: ElevatedButton.styleFrom(
          elevation: 3,
          shadowColor: const Color.fromRGBO(150, 0, 0, 1),
          backgroundColor: const Color.fromRGBO(0, 0, 20, 1),
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color.fromRGBO(150, 0, 0, 1),
              width: 2,
            ),
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
