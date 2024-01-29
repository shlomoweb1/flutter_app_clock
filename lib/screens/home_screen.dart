import 'package:clock_app/views/clock_view.dart';
import 'package:clock_app/widgets/time.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

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
          children: [
            buildMenuButton('Clock', 'assets/icons/clock_icon.png'),
            buildMenuButton('Alarm', 'assets/icons/alarm_icon.png'),
            buildMenuButton('Timer', 'assets/icons/timer_icon.png'),
            buildMenuButton('Stopwatch', 'assets/icons/stopwatch_icon.png'),
          ],
        ),
        const VerticalDivider(thickness: 1, color: Colors.white),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text('Clock',
                        style: TextStyle(
                          color: Colors.white,
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
                        style: const TextStyle(
                          color: Colors.white,
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
                  const Flexible(
                    flex: 1,
                    child: Text(
                      'Timezone',
                      style: TextStyle(
                        color: Colors.white,
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
                        const Icon(Icons.language, color: Colors.white),
                        const SizedBox(width: 16),
                        Text(
                          // ignore: prefer_interpolation_to_compose_strings
                          'UTC' + offsetSign + timezoneString,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'avenir',
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ],
    );
  }

  Padding buildMenuButton(String title, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: TextButton(
        onPressed: () {},
        child: Column(
          children: [
            Image.asset(
              image,
              scale: 1.5,
            ),
            Text(title,
                style: const TextStyle(color: Colors.white54, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
