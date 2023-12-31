import 'package:flutter/material.dart';
import 'package:mafia/Models/player.model.dart';
import 'package:mafia/data/local/roles_sharedpreferences.dart';
import 'package:mafia/utils/constants/godfather.dart';
import 'package:mafia/utils/helpers/card_border_color.dart';
import 'package:mafia/utils/helpers/navigate_to_page.dart';
import 'package:mafia/utils/helpers/persian_role.dart';
import 'package:mafia/utils/helpers/size_config.dart';
import 'package:mafia/providers/player_provider.dart';
import 'package:mafia/screens/shared/show_roles/show_roles.dart';
import 'package:provider/provider.dart';

class SelectRolesScreen extends StatefulWidget {
  const SelectRolesScreen({super.key});

  @override
  State<SelectRolesScreen> createState() => _SelectRolesScreenState();
}

class _SelectRolesScreenState extends State<SelectRolesScreen> {
  late PlayerProvider playerProvider;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    playerProvider.getDefaultData();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 40, 45, 1),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(200, 0, 0, 1),
          child: const Icon(
            Icons.arrow_forward,
          ),
          onPressed: () {
            if (playerProvider.selectedPlayers.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    '!هیج نقشی انتخاب نشده',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.yellow),
                  ),
                  duration: Duration(seconds: 1),
                ),
              );
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShowRoles(selectedPlayers: playerProvider.selectedPlayers),
              ),
            ).then((value) {
              playerProvider.getDefaultData();
            });
          }),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        backgroundColor: const Color.fromRGBO(40, 40, 45, 1),
        title: const Text(
          "انتخاب نقش ها",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.cleaning_services_rounded,
              color: Color.fromRGBO(200, 0, 0, 1),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return _clearPlayersDialog();
                },
              );
            },
          )
        ],
      ),
      body: Consumer<PlayerProvider>(
        builder: (context, playerProvider, _) {
          this.playerProvider = playerProvider;
          var selectedPlayers = playerProvider.selectedPlayers;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                  flex: selectedPlayers.length > 9 ? 1 : 0,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Wrap(alignment: WrapAlignment.center, clipBehavior: Clip.hardEdge, spacing: 8, children: [
                      ...selectedPlayers.map(
                        (player) {
                          Color borderColor = cardBorderColor(player.side);

                          return Chip(
                            label: Text(
                              toPersian(player.role),
                              style: const TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            backgroundColor: const Color.fromRGBO(0, 0, 20, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide(
                                color: borderColor,
                              ),
                            ),
                            deleteIconColor: Colors.red,
                            onDeleted: () {
                              playerProvider.removePlayer(player);
                            },
                          );
                        },
                      ).toList(),
                    ]),
                  )),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color.fromRGBO(20, 20, 25, 0.9),
                      border: Border.all(color: Colors.transparent, width: 0),
                    ),
                    child: _buildRolesSection(roles: GodfatherConstants.players),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  //Section that contain role cards
  Widget _buildRolesSection({required List<PlayerModel> roles}) {
    roles = GodfatherConstants.players;
    var mafiaRoles = roles.where((player) => player.side == Side.mafia).toList();
    var independentRoles = roles.where((player) => player.side == Side.independent).toList();
    var citizinRoles = roles.where((player) => player.side == Side.citizin).toList();
    return Column(
      children: [
        _buildRolesSide(sectionName: 'مافیا', players: mafiaRoles),
        Divider(color: Colors.blueGrey, height: getProportionateScreenHeight(16)),
        _buildRolesSide(sectionName: 'مستقل', players: independentRoles),
        Divider(color: Colors.blueGrey, height: getProportionateScreenHeight(16)),
        _buildRolesSide(sectionName: 'شهر', players: citizinRoles),
      ],
    );
  }

  //List the cards in there sides (mafia, citizin, independent)
  Widget _buildRolesSide({required String sectionName, required List<PlayerModel> players}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            sectionName,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: getProportionateScreenWidht(16),
          runSpacing: getProportionateScreenHeight(16),
          children: players.map((player) => _buildRoleCard(player)).toList(),
        ),
      ],
    );
  }

  // Role cards
  Widget _buildRoleCard(PlayerModel player) {
    var selectedPlayers = playerProvider.selectedPlayers;
    List<String> roles = selectedPlayers.map((e) => e.role).toList();
    var isSelected = player.role != 'citizen' && roles.contains(player.role) ? true : false;
    Color borderColor = cardBorderColor(player.side);
    return ElevatedButton(
      onPressed: isSelected
          ? null
          : () {
              playerProvider.addPlayer(player);
              //it scroll down after ensuring that the widget has updated.
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              });
            },
      clipBehavior: Clip.hardEdge,
      style: ElevatedButton.styleFrom(
        elevation: 3,
        shadowColor: borderColor,
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: isSelected ? Colors.grey : borderColor,
            width: 1,
          ),
        ),
      ),
      child: SizedBox(
        width: getProportionateScreenWidht(90),
        height: getProportionateScreenHeight(120),
        child: Image(
          image: AssetImage(player.imagePath),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  AlertDialog _clearPlayersDialog() {
    return AlertDialog(
      icon: const Icon(Icons.cleaning_services_rounded, size: 48, color: Colors.orange),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: const Color.fromRGBO(50, 50, 55, 0.9),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'نخیر',
            style: TextStyle(fontSize: 18),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            playerProvider.clear();
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              backgroundColor: const Color.fromRGBO(200, 0, 0, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              )),
          child: const Text(
            'بله',
            style: TextStyle(fontSize: 18),
          ),
        )
      ],
      title: const Text(
        'پاک کردن نقش ها',
        textAlign: TextAlign.center,
        style: TextStyle(color: Color.fromRGBO(200, 0, 0, 1), fontWeight: FontWeight.bold),
      ),
      content: const Text(
        'آیا میخواهید نقش ها را پاک کنید ؟',
        textAlign: TextAlign.center,
        style: TextStyle(color: Color.fromRGBO(200, 0, 0, 1)),
      ),
    );
  }
}
