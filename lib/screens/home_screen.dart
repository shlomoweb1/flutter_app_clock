import 'package:clock_app/theme/theme.dart';
import 'package:clock_app/utils/enums.dart';
import 'package:clock_app/utils/menu_items.dart';
import 'package:clock_app/views/clock_view.dart';
import 'package:clock_app/widgets/menu_info.dart';
import 'package:clock_app/widgets/time.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Material(
        type: MaterialType.transparency,
        child: _RenderHomeScreen(),
      ),
    );
  }
}

class _RenderHomeScreen extends StatelessWidget {
  const _RenderHomeScreen();

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';

    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: menuItems.map((item) => buildMenuButton(item)).toList(),
        ),
        VerticalDivider(thickness: 1, color: AppTheme.colors.dividerColor),
        MainBody(formattedDate: formattedDate, offsetSign: offsetSign, timezoneString: timezoneString),
      ],
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget? child) {
        return ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 120),
          child: TextButton(
            onPressed: () {
              var menuInfo = Provider.of<MenuInfo>(context, listen: false);
              menuInfo.updateMenu(currentMenuInfo);
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.only(left: 20, right: 20),
              backgroundColor: currentMenuInfo.menuType == value.menuType
                  ? AppTheme.colors.menuBackgroundColor
                  : Colors.transparent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32)), // Set border radius to zero
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Column(
                children: [
                  Image.asset(
                    currentMenuInfo.imageSource,
                    scale: 1.5,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(currentMenuInfo.title,
                      style: TextStyle(
                          color: AppTheme.colors.dividerColor, fontSize: 14)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({
    super.key,
    required this.formattedDate,
    required this.offsetSign,
    required this.timezoneString,
  });

  final String formattedDate;
  final String offsetSign;
  final String timezoneString;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<MenuInfo>(
        builder: (BuildContext context, MenuInfo value, Widget? child) {
          if (value.menuType == MenuType.clock) {
            return ClockPage(context);
          }else{
            return Text(value.menuType.toString());
          }
        },
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container ClockPage(BuildContext context) {
    return Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Text('Clock',
                      style: TextStyle(
                        color: AppTheme.colors.primaryTextColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'avenir',
                      )),
                ),
                const Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DisplayTime(),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(formattedDate,
                      style: TextStyle(
                        color: AppTheme.colors.primaryTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'avenir',
                      )),
                ),
                Flexible(
                    flex: 5,
                    child: Align(
                      alignment: Alignment.center,
                      child: ClockView(
                        size: MediaQuery.of(context).size.height / 4,
                      ),
                    )),
                Flexible(
                  flex: 1,
                  child: Text(
                    'Timezone',
                    style: TextStyle(
                      color: AppTheme.colors.primaryTextColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'avenir',
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.language,
                          color: AppTheme.colors.primaryTextColor),
                      const SizedBox(width: 16),
                      Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        'UTC' + offsetSign + timezoneString,
                        style: TextStyle(
                          color: AppTheme.colors.primaryTextColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'avenir',
                        ),
                      ),
                    ],
                  ),
                )
              ]),
        );
  }
}
