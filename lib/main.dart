import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:soul_support/cubits/note%20cubit/note_cubit.dart';
import 'package:soul_support/data/note_model.dart';
import 'package:soul_support/providers/auth_provider.dart';
import 'package:soul_support/providers/therapist_provider.dart';
import 'package:soul_support/screens/Patient%20Registeration%20and%20Login%20Pages/User_Options.dart';
import 'package:soul_support/screens/Therapist%20system%20Pages/Therapist_Calender.dart';
import 'package:soul_support/screens/Therapist%20system%20Pages/Therapist_Home.dart';
import 'package:soul_support/screens/Therapist%20system%20Pages/Therapist_Settings.dart';
import 'package:soul_support/screens/exerciseScreen.dart';
import 'package:soul_support/screens/homeScreen.dart';
import 'package:soul_support/screens/moodLoggerScreen.dart';
import 'package:soul_support/screens/programScreen.dart';
import 'package:soul_support/screens/therapistScreen.dart';
import 'package:soul_support/simpleObserver.dart';
import 'package:soul_support/widgets/screenWrapper.dart';

   const Color primary = Color(0xFF01709A);
   const Color accent = Color(0xFF97CADB);
   const Color background = Color(0xFFD6E8EE);
   const Color bigCircle = Color(0xff3D8BAA);
   const Color smallCircle = Color(0xFF579EB8);
   const Color banners = Color.fromARGB(255, 243, 248, 250);
   const String notesBoxKey = 'Notes_box';


FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Make sure Flutter is ready

  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  final InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);


  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleObserver();

  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(notesBoxKey);
  await Hive.openBox('myBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  BlocProvider(
      create: (context) => NoteCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: background),
        initialRoute: '/start',
        routes: {
          '/home': (context)=> ScreenWrapper(child: HomeScreen()),
          '/program': (context)=> ScreenWrapper(child: ProgramScreen()),
          '/therapists': (context)=> ScreenWrapper(child: TherapistScreen()),
          '/exercises': (context)=> ScreenWrapper(child: ExerciseScreen()),
          '/start': (context)=>  UserOptions(),
          '/start2': (context)=>  ScreenWrapper( isTherapist: true, child: TherapistHome(),),
          '/moodLogger': (context)=> MoodLoggerScreen(),
        },
        // home: Stack(
        //   children: [
        //     DrawerScreen(),
            
        //   ],
        // ),
      ),
    );
  }
}