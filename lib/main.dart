import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soul_support/screens/Patient%20Registeration%20and%20Login%20Pages/Patient_Registeration_Options.dart';
import 'package:soul_support/screens/Patient%20Registeration%20and%20Login%20Pages/User_Options.dart';
import 'package:soul_support/screens/Patient%20Registeration%20and%20Login%20Pages/patient_sign_In.dart';
import 'package:soul_support/screens/Patient%20Registeration%20and%20Login%20Pages/welcome.dart';
import 'package:soul_support/screens/Setting%20and%20proffile%20screens/notification_screen.dart';
import 'package:soul_support/screens/Therapist%20Registeration%20and%20Login%20Pages/Therapist_Welcome.dart';
import 'package:soul_support/screens/documentationScreen.dart';
import 'package:soul_support/screens/drawerScreen.dart';
import 'package:soul_support/screens/exerciseScreen.dart';
import 'package:soul_support/screens/homeScreen.dart';
import 'package:soul_support/screens/moodLoggerScreen.dart';
import 'package:soul_support/screens/programScreen.dart';
import 'package:soul_support/screens/therapistScreen.dart';
import 'package:soul_support/widgets/dock.dart';
import 'package:soul_support/widgets/screenWrapper.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';

const Color primary = Color(0xFF01709A);
const Color accent = Color(0xFF97CADB);
const Color background = Color(0xFFD6E8EE);
const Color bigCircle = Color(0xff3D8BAA);
const Color smallCircle = Color(0xFF579EB8);
const Color banners = Color.fromARGB(255, 243, 248, 250);

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Make sure Flutter is ready

  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  final InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);


  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('myBox');

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: background),
      initialRoute: '/start',
      routes: {
        '/home': (context) => ScreenWrapper(child: HomeScreen()),
        '/program': (context) => ScreenWrapper(child: ProgramScreen()),
        '/therapists': (context) => ScreenWrapper(child: TherapistScreen()),
        '/exercises': (context) => ScreenWrapper(child: ExerciseScreen()),
        '/start': (context) => UserOptions(),
        '/moodLogger': (context) => MoodLoggerScreen(),
      },

      // home: Stack(
      //   children: [
      //     DrawerScreen(),

      //   ],
      // ),
    );
  }
}


