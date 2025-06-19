import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/screens/Setting%20and%20proffile%20screens/mood_record_screen.dart';
import 'package:soul_support/screens/journalScreen.dart';
import 'package:soul_support/widgets/exitBtn.dart';

import '../../transitions/custom_transitions.dart';
import '../../widgets/screenWrapper.dart';

class profile_screen extends StatefulWidget {
  const profile_screen({super.key});

  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {

  String? username;
  String? gender;


  @override
  void initState() {
    super.initState();
    loadUsername();
  }

  void loadUsername() async {
    var box = Hive.box('myBox');
     String storedGender = box.get('gender', defaultValue: 'male');
    String storedUsername = box.get('username', defaultValue: 'Guest');
    setState(() {
      username = storedUsername;
      gender = storedGender.trim().toLowerCase();

    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned(
              top: -15,
              left: 30,
              child: Transform.rotate(
                angle: 0.4,
                child: Container(
                  width: 720,
                  height: 750,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [const Color.fromARGB(195, 151, 202, 219), const Color.fromARGB(0, 151, 202, 219)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.1, 1],
                      ),
                      shape: BoxShape.circle
                  ),
                ),
              )
          ),
          Positioned(
              top: 480,
              left: 300,
              child: Transform.rotate(
                angle: 0,
                child: Container(
                  width: 340,
                  height: 340,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [const Color.fromARGB(255, 244, 223, 218), const Color.fromARGB(0, 244, 223, 218)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 1],
                      ),
                      shape: BoxShape.circle
                  ),
                ),
              )
          ),
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)), // Rounds the corners

            child: Stack(
              children: [

                Container(//banner
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))
                  ),
                ),

                Positioned(//big circle
                  left: -135,
                  top: -135,
                  child: Container(
                    height: 400,
                    width: 400,

                    decoration: BoxDecoration(
                        color: bigCircle,
                        borderRadius: BorderRadiusDirectional.circular(350)


                    ),),
                ),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 100,
                          child:  Container(
                  height: 150,
                  child:Image.asset(
                    (gender ?? "male").toLowerCase() == "female"
                        ?  "assets/imgs/logo_girl.png"
                        :"assets/imgs/profilePicture.png",
                  ),
                ),),
                      // Text for greetings
                      Column(
                        children: [
                          Text(
                            "Hello, $username ",
                            style: TextStyle(
                              color: Color(0xffEBF4F7),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "How you doing today?",
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 16,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 60,
                                    width: 60,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFFF1AC),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: SvgPicture.asset("assets/svg/face0.svg")),
                                Container(
                                    height: 60,
                                    width: 60,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFD1FAB8),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: SvgPicture.asset("assets/svg/face1.svg")),
                                Container(
                                    height: 60,
                                    width: 60,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFB4E9FA),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: SvgPicture.asset("assets/svg/face2.svg")),
                                Container(
                                    height: 60,
                                    width: 60,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFAD0C7),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: SvgPicture.asset("assets/svg/face3.svg")),
                                Container(
                                    height: 60,
                                    width: 60,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFE7BEF6),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: SvgPicture.asset("assets/svg/face4.svg")),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),




              ],
            ),
          ),

          // Close button

          // Logo image
          // New journal record text
          Container(
            padding: EdgeInsets.only(top: 330, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Records",
                  style: TextStyle(
                    color: Color(0xff374957),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // First item: Mood record
                      ProfileCard(
                        name: "Mood Records",
                        imgPath: "assets/imgs/emoticons.png",
                        onTap: () {
                          Navigator.push(
                            context,
                            slideRtL(ScreenWrapper(child: MoodRecordScreen())),
                          );
                        },
                      ),

                      // Second item: Diary record
                      ProfileCard(
                        name: "Journal records",
                        imgPath: "assets/imgs/paper.png",
                        onTap: () {
                          Navigator.push(
                            context,
                            slideRtL(ScreenWrapper(child: JournalScreen())),
                          );
                        },
                      ),

                      // Second item: Diary record
                     
                      // Third item: Meditation
                       ProfileCard(
                        name: "Meditation",
                        imgPath: "assets/imgs/yoga.png",
                       
                      ),
                     
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Scrollable section for journal records
          Exitbtn(),
        ],
      ),
    );

  }
}

class ProfileCard extends StatefulWidget {
  final void Function()? onTap;
  final String imgPath;
  final String name;

  const ProfileCard({
    super.key, 
    this.onTap, required this.imgPath, required this.name,
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
     
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: const Color(0xffFFFFFF),
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
        width: 130,
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 55,
              child: Image(image: AssetImage(
                widget.imgPath
                // "assets/imgs/emoticons.png"
                
                )),
            ),
            Text(
              widget.name,
              // "Mood Records",
              style: TextStyle(
                color: Color(0xff374957),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
