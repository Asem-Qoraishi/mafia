import 'package:flutter/material.dart';
import 'package:mafia/Models/player.model.dart';
import 'package:mafia/utils/helpers/card_border_color.dart';
import 'package:mafia/utils/helpers/persian_role.dart';
import 'package:mafia/utils/helpers/size_config.dart';

class AboutBottomSheet extends StatelessWidget {
  PlayerModel player;
  AboutBottomSheet({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return makeDismissible(
      context: context,
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.8,
        builder: (context, scrollController) => Container(
          width: 100,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(50, 50, 50, 0.8),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                buildImagePlayer(),
                const SizedBox(height: 16),
                Text(
                  toPersian(player.role),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  player.description,
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                Container(
                  width: getProportionateScreenWidht(300),
                  margin: const EdgeInsets.only(top: 16, bottom: 8),
                  // padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(4),
                          backgroundColor: const Color.fromRGBO(200, 0, 0, 0.9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          )),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'تایید',
                        style: TextStyle(fontSize: 18),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget makeDismissible({required BuildContext context, required Widget child}) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.pop(context),
      child: GestureDetector(
        onTap: () {},
        child: child,
      ),
    );
  }

  Widget buildImagePlayer() {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: cardBorderColor(player.side), width: 1.5),
      ),
      child: Image.asset(
        player.imagePath,
        width: getProportionateScreenWidht(200),
        height: getProportionateScreenHeight(270),
        fit: BoxFit.fill,
      ),
    );
  }
}
