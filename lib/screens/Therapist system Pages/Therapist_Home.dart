import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:soul_support/data/todaysPatientsData.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/models/availableTherapistsCard.dart';
import 'package:soul_support/providers/therapist_provider.dart';
import 'package:soul_support/widgets/patientStatisticsChart.dart';
import 'package:soul_support/widgets/todaysPatientsCard.dart';
import 'package:soul_support/widgets/topBanner.dart';


class TherapistHome extends StatefulWidget {
  const TherapistHome({super.key});

  @override
  State<TherapistHome> createState() => _TherapistHomeState();
}

class _TherapistHomeState extends State<TherapistHome> {

  String? username;
  @override
  void initState() {
    super.initState();
    // Load all data when the screen is initialized
    Future.microtask(() {
      if (mounted) {
        context.read<TherapistProvider>().refreshAll();
      }
    });
    super.initState();
    loadUsername();
  }

  void loadUsername() async {
    var box = Hive.box('myBox');
    String storedUsername = box.get('username', defaultValue: 'Guest');
    setState(() {
      username = storedUsername;
    });
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
   
    

    return Scaffold(
      body: Container(
        height: screenHeight,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
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
              ),
              ),

            
            SingleChildScrollView(
              padding: EdgeInsets.only(top: 150),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric( vertical: 30),
                        child: Column( //main stack
                          children: [
                            todaysWorkBanner(screenWidth: screenWidth, screenHeight: screenHeight, noOfWork: todaysPatients.length.toString(),),
                            SizedBox(height: 30,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: PatientStatisticsChart(),
                            ),
                            SizedBox(height: 30,),
                            Container(
                              width: screenWidth-30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Today's Patients",
                                  style: TextStyle(
                                    color: primary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  Text("Show All",
                                  
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: primary,
                                    color: primary,
                                  ),),
                                ],
                              ),
                            ),
                            SizedBox(height: 15,),
                            SingleChildScrollView(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: 
                                 List.generate(todaysPatients.length, (i) => 
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 7.5), // Adjust spacing
                                child: TodaysPatientsCard(
                                  name: todaysPatients[i]["name"]!,
                                  time: todaysPatients[i]["time"]!,
                                  description: todaysPatients[i]["description"]!,
                                  color: const Color.fromARGB(170, 255, 255, 255), 
                                  height: 100, 
                                  width: 200,
                                )
                               ),
                              ),
                                // [
                                //   TodaysPatientsCard(name: "Sarah Stone", description: "I’ve been feeling really anxious lately, especially in social situations. I avoid going out or talking to people because I’m afraid I’ll embarrass myself. It’s starting to affect my work and friendships.", time: "08:00 am : 9:00 am", color: const Color.fromARGB(170, 255, 255, 255), height: 100, width: 200,),
                                //   SizedBox(width: 20,),
                                //   TodaysPatientsCard(name: "John Smith", description: "I’m constantly tired and unmotivated, even when I get enough sleep. Nothing feels exciting anymore, and I find it hard to focus on anything. I don’t know why I’m feeling this way.", time: "10:00 am : 11:00 am", color: const Color.fromARGB(170, 255, 255, 255), height: 100, width: 200,),
                                //   SizedBox(width: 20,),
                                //   TodaysPatientsCard(name: "Mark Markinson", description: "I’ve been having frequent arguments with my partner, and I don’t know how to communicate without it turning into a fight. I feel overwhelmed and unsure about the future of our relationship.", time: "3:00 pm: 4:00 pm", color: const Color.fromARGB(170, 255, 255, 255), height: 100, width: 200,),
                                // ],
                              ),
                            ),

                          ],
                        ),
                      )
                      // _buildPatientImages(),
                      // _buildTodayAppointments(),
                      // _buildActivitySection(),
                    ],
                  ),
                ),
              
              TopBanner(),
                Positioned(
                  top: 70,
                child: Column(
                  children: [
                    Text("Welcome, Dr.$username",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      Text("Have a nice day at work and stay healthy",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                      ),
                      ),
                  ],
                )),
            
          ],
        ),
      ),
      
    );
  }

}

class todaysWorkBanner extends StatefulWidget {
  final String noOfWork;
  const todaysWorkBanner({
    super.key,
    required this.screenWidth,
    required this.screenHeight, required this.noOfWork,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  State<todaysWorkBanner> createState() => _todaysWorkBannerState();
}

class _todaysWorkBannerState extends State<todaysWorkBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.screenWidth-30,
      height: widget.screenHeight*0.15,
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
    
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset("assets/imgs/doctor_setting2.png",
              width: 140,
              fit: BoxFit.cover,
              color: primary,
              colorBlendMode: BlendMode.color,
              alignment: Alignment(0, -1.5),
              ),
            )
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Today's", style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),),
                Text("Online", style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),),
                Text("Work", style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),),
              ],
            ),
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: smallCircle
              ),
              child: Center(
                child: Text(widget.noOfWork, style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),),
              ),
            )
        ],
      ),
    );
  }
}