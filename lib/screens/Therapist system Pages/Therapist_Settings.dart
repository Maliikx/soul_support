import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/screens/Setting%20and%20proffile%20screens/HelpAndSupport_sreen.dart';
import 'package:soul_support/screens/Setting%20and%20proffile%20screens/PasswordManager_screen.dart';
import 'package:soul_support/screens/Setting%20and%20proffile%20screens/TermAndPolices_screen.dart';
import 'package:soul_support/screens/Setting%20and%20proffile%20screens/delete_screen.dart';
import 'package:soul_support/screens/Setting%20and%20proffile%20screens/logout_screen.dart';
import 'package:soul_support/screens/Setting%20and%20proffile%20screens/notification_screen.dart';
import 'package:soul_support/screens/Setting%20and%20proffile%20screens/who_are_we_screen.dart';
import 'package:soul_support/screens/Therapist%20system%20Pages/Therapist_Profile.dart';
import 'package:soul_support/screens/therapistProfileScreen.dart';
import 'package:soul_support/transitions/custom_transitions.dart';
import 'package:soul_support/widgets/exitBtn.dart';
import 'package:soul_support/widgets/screenWrapper.dart';


class Therapist_Settings extends StatefulWidget {
  const Therapist_Settings({super.key});

  // final String email;

  @override
  State<Therapist_Settings> createState() => _Therapist_SettingsState();
}

class _Therapist_SettingsState extends State<Therapist_Settings> {

  String? username;
  String? email;
  String? gender;

  @override
  void initState() {
    super.initState();
    loadUsername();
  }

  void loadUsername() async {
    var box = Hive.box('myBox');
    String storedUsername = box.get('username', defaultValue: 'Guest');
    String storedemail = box.get('email', defaultValue: 'Guest');
    String storedGender = box.get('gender', defaultValue: 'male');

    print("Hive box contents: ${box.toMap()}"); // Debug

    setState(() {
      username = storedUsername;
      email = storedemail;
      gender = storedGender.trim().toLowerCase();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            right: -50,
            top: -100,
            child: Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 131, 190, 212),
                borderRadius: BorderRadiusDirectional.circular(200),
              ),
            ),
          ),
          ClipRRect(
            borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(40)),
            child: Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(40)),
                  ),
                ),
                Positioned(
                  left: -135,
                  top: -135,
                  child: Container(
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(
                      color: bigCircle,
                      borderRadius: BorderRadiusDirectional.circular(350),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 280,
            padding: const EdgeInsets.only(top: 50, left: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(120),
                      border: Border.all(color: Colors.white, width: 5)
                    ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(120),
                    child: Image.asset("assets/imgs/doc2.jpeg",
                      fit: BoxFit.cover,
                      ),
                  ),
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$username ",
                      style: TextStyle(
                        color: Color(0xffEBF4F7),
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "$email",
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 230),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: const Color(0xffD4E6EC).withOpacity(0.9),
              ),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Settings and privacy",
                        style: TextStyle(
                          color: Color(0xff374957),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 25),
                      SettingItem(
                        icon: CupertinoIcons.profile_circled,
                        title: "profile",
                        onTap: () {
                          Navigator.push(
                              context,
                              slideRtL(ScreenWrapper(isTherapist: true, child: Therapist_Profile())));
                        },
                        onTrailingTap: () {},
                      ),
                      SettingItem(
                        icon: CupertinoIcons.bell_solid,
                        title: "Notification",
                        onTap: () {
                          Navigator.push(
                              context,
                              slideRtL(ScreenWrapper(
                                isTherapist: true,
                                  child: NotificationPage(patientId: 2))));
                        },
                      ),
                      SettingItem(
                        icon: CupertinoIcons.lock,
                        title: "Password Manager",
                        onTap: () {
                          Navigator.push(
                              context,
                              slideRtL(ScreenWrapper(
                                isTherapist: true,
                                  child: passwordmanager())));
                        },
                      ),
                      SizedBox(height: 25),
                      Text(
                        "Support and About",
                        style: TextStyle(
                          color: Color(0xff374957),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      SettingItem(
                        image: Image.asset("assets/logos/logo2.png",
                            height: 20),
                        title: "Who are we",
                        onTap: () {
                          Navigator.push(
                              context,
                              slideRtL(ScreenWrapper(
                                isTherapist: true, child: who_screen())));
                        },
                        onTrailingTap: () {},
                      ),
                      SettingItem(
                        icon: CupertinoIcons.question_circle,
                        title: "Help & Support ",
                        onTap: () {
                          Navigator.push(
                              context,
                              slideRtL(ScreenWrapper(
                                isTherapist: true,
                                  child: helpandsupport_screen())));
                        },
                        onTrailingTap: () {},
                      ),
                      SettingItem(
                        icon: CupertinoIcons.exclamationmark_shield,
                        title: "Terms and Policies ",
                        onTap: () {
                          Navigator.push(
                              context,
                              slideRtL(ScreenWrapper(
                                isTherapist: true,
                                  child: termandpolices())));
                        },
                        onTrailingTap: () {},
                      ),
                      SizedBox(height: 25),
                      Text(
                        "Account",
                        style: TextStyle(
                          color: Color(0xff374957),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SettingItem(
                        icon: CupertinoIcons.delete_simple,
                        title: "Delete Account ",
                        onTap: () {
                          // var id = await patient.getpatientId(widget.email);
                          Navigator.push(
                            context,
                            smallSlideBtT(
                              delete_screen(patientId: 21),
                            ),
                          );
                        },
                      ),
                      SettingItem(
                        icon: CupertinoIcons.share_up,
                        title: "Log Out ",
                        onTap: () {
                          Navigator.push(
                            context,
                            smallSlideBtT(
                              logout_screen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Exitbtn(),
        ],
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final IconData? icon;
  final Widget? image;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  final VoidCallback? onTrailingTap;
  final Color? iconColor;

  const SettingItem({
    Key? key,
    this.icon,
    this.image,
    required this.title,
    this.trailing,
    this.onTap,
    this.onTrailingTap,
    this.iconColor,
  })  : assert(icon != null || image != null,
  'Either icon or image must be provided'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (icon != null)
                  Icon(icon, color: iconColor ?? Color(0xff374957))
                else if (image != null)
                  image!,
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xff374957),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: onTrailingTap ?? onTap,
              child: trailing ??
                  Icon(CupertinoIcons.forward, color: Color(0xff01709A)),
            ),
          ],
        ),
      ),
    );
  }
}
