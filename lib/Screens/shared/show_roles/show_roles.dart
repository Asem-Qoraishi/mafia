import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mafia/Models/player.model.dart';
import 'package:mafia/providers/show_role_provider.dart';
import 'package:mafia/screens/shared/gf_cards/last_cards_screen.dart';
import 'package:mafia/utils/helpers/navigate_to_page.dart';
import 'package:mafia/utils/helpers/size_config.dart';
import 'package:provider/provider.dart';

class ShowRoles extends StatefulWidget {
  final List<PlayerModel> selectedPlayers;

  const ShowRoles({Key? key, required this.selectedPlayers}) : super(key: key);

  @override
  _ShowRolesState createState() => _ShowRolesState();
}

class _ShowRolesState extends State<ShowRoles> with SingleTickerProviderStateMixin {
  bool isDistributed = false;
  final Image frontImage = const Image(
    image: AssetImage('assets/common_images/front.png'),
    width: double.infinity,
    height: double.infinity,
    fit: BoxFit.fill,
  );
  Image backImage = Image.asset('assets/common_images/front.png');

  late AnimationController _controller;
  late Animation _animation;
  bool isFront = true;

  late ShowRoleProvider showRoleProvider;
  @override
  void initState() {
    super.initState();
    print(widget.selectedPlayers.length);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animation = Tween(begin: 0.0, end: pi).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    showRoleProvider = Provider.of<ShowRoleProvider>(context, listen: false);
    showRoleProvider.randomPlayer = widget.selectedPlayers[0];
    return Consumer<ShowRoleProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: const Color.fromRGBO(40, 40, 45, 1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromRGBO(40, 40, 45, 1),
          title: const Text(
            'توزیع نقش ها',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        floatingActionButton: isDistributed
            ? null
            : FloatingActionButton(
                backgroundColor: const Color.fromRGBO(200, 0, 0, 1),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          icon: const Icon(Icons.warning_amber_rounded, size: 48, color: Colors.orange),
                          actionsAlignment: MainAxisAlignment.spaceEvenly,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          backgroundColor: const Color.fromRGBO(50, 50, 55, 0.9),
                          title: const Text(
                            'میخواهید از این مرحله رد شوید ؟ ',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color.fromRGBO(200, 0, 0, 1), fontWeight: FontWeight.bold),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 24),
                                  backgroundColor: const Color.fromRGBO(200, 0, 0, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  )),
                              child: const Text(
                                'نخیر',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const GodfatherLastCardsScreen()),
                                );
                              },
                              child: const Text(
                                'بله',
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          ],
                        );
                      });
                },
                child: const Icon(Icons.arrow_right_alt_rounded),
              ),
        body: Consumer<ShowRoleProvider>(builder: (context, provider, _) {
          showRoleProvider = provider;
          if (isDistributed) {
            return _nextPageBtn();
          }
          return Center(
            child: AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        if (_animation.value >= pi / 2 - 0.1) {
                          isFront = false;
                        } else {
                          isFront = true;
                        }
                        return Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..rotateY(_animation.value),
                          child: _buildRoleCard(showRoleProvider.randomPlayer),
                        );
                      }),
                  _showRoleBtn(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _nextPageBtn() {
    return Center(
      child: SizedBox(
        height: 250,
        width: 250,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 4,
            backgroundColor: const Color.fromRGBO(200, 0, 0, 0.9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(200),
            ),
          ),
          onPressed: () {
            navigateToPage(context, const GodfatherLastCardsScreen());
          },
          child: const Text(
            'کارت های آخر',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard(PlayerModel playerModel) {
    return SizedBox(
      width: getProportionateScreenWidht(375),
      height: getProportionateScreenHeight(500),
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 4,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(
              color: Color.fromRGBO(200, 0, 0, 1),
              width: 1,
            )),
        child: _buildImages(),
      ),
    );
  }

  Widget _showRoleBtn() {
    return Container(
      width: getProportionateScreenWidht(375),
      height: getProportionateScreenHeight(60),
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(200, 0, 0, 0.9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(
              color: Colors.white70,
              width: 1,
            ),
          ),
        ),
        child: Text(
          !showRoleProvider.isFliped ? 'نمایش نقش' : 'تایید',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          if (isFront && _controller.isDismissed) {
            showRoleProvider.showRole(true, widget.selectedPlayers);
            var randomPlayer = showRoleProvider.randomPlayer;
            backImage = Image(
              image: AssetImage(
                randomPlayer.imagePath,
              ),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            );
            _controller.forward();
          } else {
            if (widget.selectedPlayers.isEmpty) {
              isDistributed = true;
            }
            if (_controller.isCompleted) {
              showRoleProvider.showRole(false, widget.selectedPlayers);
              _controller.reverse();
            }
          }
        },
      ),
    );
  }

  Widget _buildImages() {
    return Stack(
      alignment: Alignment.center,
      children: [
        frontImage,
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..rotateY(-pi),
          child: Visibility(visible: !isFront, child: backImage),
        )
      ],
    );
  }
}
