import 'package:flutter_svg/svg.dart';
import 'package:elokyetu/helpers/quick_help.dart';
import 'package:elokyetu/ui/text_with_tap.dart';
import 'package:elokyetu/utils/colors.dart';
import 'package:flutter/material.dart';

class ToolBarLeftWidget extends StatelessWidget {
  final Widget? leftWidget;
  final Widget child;
  final List<String>? actionsIcons;
  final String? coinsIcon;
  final double coinIconSize;
  final double actionsIconsSize;
  final Color? actionsColor;
  final Color? coinsColor;
  final double? elevation;
  final int? coins;
  final Function? coinsTap;
  final Function? avatarTap;
  final BottomNavigationBar? bottomNavigationBar;
  final List<Function?>? onTapActions;

  const ToolBarLeftWidget({
    Key? key,
    this.leftWidget,
    required this.child,
    this.elevation,
    this.actionsIcons = const [],
    this.bottomNavigationBar,
    this.actionsColor = kDisabledGrayColor,
    this.onTapActions = const [],
    this.actionsIconsSize = 20,
    this.coinIconSize = 20,
    this.coins = 0,
    this.coinsTap,
    this.avatarTap,
    this.coinsIcon,
    this.coinsColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bgColor = QuickHelp.isDarkModeNoContext()
        ? kContentColorLightTheme
        : kContentColorDarkTheme;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: leftWidget,
          onTap: avatarTap as void Function(),
        ),
        backgroundColor: bgColor,
        title: GestureDetector(
          onTap: coinsTap as void Function(),
          child: Row(
            children: [
              SvgPicture.asset(coinsIcon!,
                  width: coinIconSize, height: coinIconSize),
              TextWithTap(
                coins.toString(),
                fontWeight: FontWeight.bold,
                fontSize: 14,
                marginLeft: 6,
                color: coinsColor,
              ),
            ],
          ),
        ),
        centerTitle: false,
        elevation: elevation,
        actions: List.generate(actionsIcons!.length, (index) {
          return TextButton(
              onPressed: onTapActions![index] as void Function()?,
              child: SvgPicture.asset(
                actionsIcons![index],
                width: actionsIconsSize,
                height: actionsIconsSize,
                color: actionsColor,
              ));
        }),
      ),
      bottomNavigationBar: bottomNavigationBar,
      body: child,
    );
  }
}
