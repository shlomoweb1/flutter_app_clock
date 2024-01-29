import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clock_app/theme/theme.dart';
import 'package:clock_app/utils/enums.dart';
import 'package:clock_app/utils/menu_items.dart';
import 'package:clock_app/views/clock_view.dart';
import 'package:clock_app/widgets/display_hebrew_date.dart';
import 'package:clock_app/widgets/display_hebrew_parsha.dart';
import 'package:clock_app/widgets/display_timezone.dart';
import 'package:clock_app/widgets/menu_info.dart';
import 'package:clock_app/widgets/display_time.dart';

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
        child: SingleChildScrollView(
          child: _RenderHomeScreen(),
        ),
      ),
    );
  }
}

class _RenderHomeScreen extends StatelessWidget {
  const _RenderHomeScreen();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: menuItems.map((item) => buildMenuButton(item)).toList(),
        ),
        VerticalDivider(thickness: 1, color: AppTheme.colors.dividerColor),
        const MainBody(),
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
                  topRight: Radius.circular(32),
                ),
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
                  Text(
                    currentMenuInfo.title,
                    style: TextStyle(
                      color: AppTheme.colors.dividerColor,
                      fontSize: 14,
                    ),
                  ),
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
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<MenuInfo>(
        builder: (BuildContext context, MenuInfo value, Widget? child) {
          return value.menuType == MenuType.clock
              ? clockPage(context)
              : Center(
                  child: Text(
                    value.menuType.toString(),
                    style: TextStyle(
                      color: AppTheme.colors.primaryTextColor,
                      fontSize: 20,
                    ),
                  ),
                );
        },
      ),
    );
  }

  Container clockPage(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Clock',
            style: TextStyle(
              color: AppTheme.colors.primaryTextColor,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontFamily: 'avenir',
            ),
          ),
          const SizedBox(height: 16),
          DisplayTime(
            format: 'HH:mm',
            style: const TextStyle(color: Colors.white, fontSize: 64),
          ),
          const SizedBox(height: 16),
          DisplayTime(
            format: 'EEE, d MMM',
            style: TextStyle(
              color: AppTheme.colors.primaryTextColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'avenir',
            ),
          ),
          const SizedBox(height: 16),
          DisplayHebrewParsha(
            style: TextStyle(
              color: AppTheme.colors.primaryTextColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'avenir',
            ),
          ),
          const SizedBox(height: 16),
          DisplayHebrewDate(
            style: TextStyle(
              color: AppTheme.colors.primaryTextColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'avenir',
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.center,
            child: ClockView(
              size: MediaQuery.of(context).size.height / 4,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Timezone',
            style: TextStyle(
              color: AppTheme.colors.primaryTextColor,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontFamily: 'avenir',
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.language, color: AppTheme.colors.primaryTextColor),
              const SizedBox(width: 8),
              DisplayTimezone(
                style: TextStyle(
                  color: AppTheme.colors.primaryTextColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'avenir',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
