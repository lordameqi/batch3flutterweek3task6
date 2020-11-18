import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'pertama/animal.dart';
import 'kedua/transport.dart';
import 'ketiga/tumbuhan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: 'assets/images/Vanamo_Logo.png',
            nextScreen: MyHomePage(),
            splashTransition: SplashTransition.slideTransition,
            pageTransitionType: PageTransitionType.topToBottom,
            backgroundColor: Colors.blue));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text(
                    "ANIMAL",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Tab(
                  child: Text(
                    "TRANSPORTATION",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Tab(
                  child: Text(
                    "PLANTATION",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
            title: Text('Walpaper Apps'),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              Animal(),
              Transport(),
              Tumbuhan(),
            ],
          ),
        ),
      ),
    );
  }
}
