import 'package:flutter/material.dart';
import 'package:flutter_application_1/patient_dashboard.dart';
import 'package:flutter_application_1/test2.dart';
import 'package:flutter_application_1/therapistScreen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'providers/auth_provider.dart';
import 'providers/therapist_provider.dart';
import 'Therapist_SignIn.dart';
import 'Therapist_SignUp.dart';
import 'Therapist_WelcomeAddPhoto.dart';
import 'Therapist_Home.dart';
import 'Therapist_Profile.dart';
import 'Therapist_Calender.dart';
import 'Therapist_Notification.dart';
import 'Therapist_Settings.dart';
import 'helpAndSupport.dart';
import 'Who_Are_We.dart';
import 'term_and_policies.dart';
   const Color primary = Color(0xFF01709A);
   const Color accent = Color(0xFF97CADB);
   const Color background = Color(0xFFD6E8EE);
   const Color bigCircle = Color(0xff3D8BAA);
   const Color smallCircle = Color(0xFF579EB8);
   const Color banners = Color.fromARGB(255, 243, 248, 250);

void main() async {

  // await dotenv.load(fileName: ".env");


  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('myBox');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => TherapistProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {


  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Therapist App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF01709A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF01709A),
          primary: const Color(0xFF01709A),
          secondary: const Color(0xFFDAE7EB),
        ),
        fontFamily: 'Montserrat',
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthWrapper(),
        '/signin': (context) => const TherapistSignIn(),
        '/signup': (context) => const TherapistSignUp(),
        // '/welcome': (context) => const WelcomeAddPhotoScreen(),
        '/welcomeAddPhotoScreen': (context) => const WelcomeAddPhotoScreen(),
        // '/home': (context) => const Therapist_Home(),
        // '/profile': (context) => const TherapistProfile(),
        '/calendar': (context) => const SchedulePage(),
        '/notifications': (context) => const NotificationsApp(),
        '/settings': (context) => const Therapist_Settings(),
        '/help': (context) => const  helpandsupport_screen (),
        '/about': (context) => const who_screen(),
        '/terms': (context) => const termandpolices(),
        '/Therapist_Home': (context) => const Therapist_Home(),
        '/patientScreen':(context)=> const TherapistScreen(),
        '/profile': (context) => const TherapistProfile(),
        '/patientDash':(context)=> const PatientDashboard(),
        "/test2":(context)=> const Test2(),

      },
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  void initState() {
    super.initState();
    // Check auth status when the app starts
    Future.microtask(() {
      if (mounted) {
        context.read<AuthProvider>().checkAuthStatus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, _) {
        if (auth.isLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (auth.error != null) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    auth.error!,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      auth.clearError();
                      auth.checkAuthStatus();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        if (auth.isAuthenticated) {
          return const Therapist_Home();
        }

        return const TherapistSignIn();
      },
    );
  }
}
