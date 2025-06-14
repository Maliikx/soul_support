import 'package:flutter/material.dart';
import 'package:flutter_application_1/video/video.dart';
import 'package:flutter_application_1/services/api_service.dart';
// void main() => runApp(const MentalHealthApp());

class MentalHealthApp extends StatelessWidget {
  const MentalHealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/patientDash': (context) => const PatientDashboard(),
      },
      debugShowCheckedModeBanner: false,
      home: const PatientDashboard(),
    );
  }
}

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  @override
    final TextEditingController _sessionIdController = TextEditingController();
    bool _isLoading = false;
      void _joinSession() async {
    final sessionId = _sessionIdController.text.trim();
    if (sessionId.isEmpty) return;

    setState(() => _isLoading = true);

    try {
      // Assume patient ID is hardcoded for now (e.g., 202)
      final patientId = 202;
      final tokenData = await ApiService.getSessionToken(sessionId, patientId);

      if (tokenData != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => VideoCallScreen(
              sessionId: sessionId,
              userId: patientId,
              isDoctor: false,
            ),
          ),
        );
      } else {
        _showError("Invalid session ID or session not active.");
      }
    } catch (e) {
      _showError("Failed to join session.");
    }

    setState(() => _isLoading = false);
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }






  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F0F6),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color(0xFF007EA7),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage('Assets/Profile.png'),
                            radius: 50,
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1.5,
                              ),
                            ),
                            child: Image.asset(
                              'Assets/CHIBI1 2.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'patient name',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          MoodIcon(
                            color: Color(0xFFFFE066),
                            icon: Icons.sentiment_very_satisfied,
                          ),
                          MoodIcon(
                            color: Color(0xFFB5E48C),
                            icon: Icons.sentiment_satisfied,
                          ),
                          MoodIcon(
                            color: Color(0xFF89C2D9),
                            icon: Icons.sentiment_neutral,
                          ),
                          MoodIcon(
                            color: Color(0xFFFFB5A7),
                            icon: Icons.sentiment_dissatisfied,
                          ),
                          MoodIcon(
                            color: Color(0xFFE0A7FF),
                            icon: Icons.sentiment_very_dissatisfied,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'September',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      DayWidget(day: 'Mon', date: '9'),
                      DayWidget(day: 'Tue', date: '10'),
                      DayWidget(day: 'Wed', date: '11', isSelected: true),
                      DayWidget(day: 'Thu', date: '12'),
                      DayWidget(day: 'Fri', date: '13'),
                      DayWidget(day: 'Sat', date: '14'),
                      DayWidget(day: 'Sun', date: '15'),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'New journal record',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildJournalButton(
                        "Assets/emoticons 1.png",
                        "patient mood",
                      ),
                      _buildJournalButton("Assets/paper 1.png", "Diary record"),
                      _buildJournalButton(
                        "Assets/yoga_384156 1.png",
                        "Moments for\n meditation",
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF007EA7),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Start Appointment',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 20,
              right: 20,
              child: Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100, top: 100),
                    child: Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                             Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => VideoCallScreen(

        sessionId: 'therapy_1748802311474',
        userId: 202,
        isDoctor: false,
      ),
    ),
  );
                            }, //video call
                            child:
                                Image(image: AssetImage("Assets/Video.png"))),
                        SizedBox(
                          height: 10,
                        ),
                        
                        GestureDetector(
                            onTap: () {
                              // Navigator.pushAndRemoveUntil(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => Chat(
                              //             senderRole: 'doctor',
                              //           )),
                              //   (route) => false,
                              // );
                            },
                            //chat with doctor
                            child: Image(image: AssetImage("Assets/Chat.png")))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSideIcon(IconData icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
      ),
      child: Icon(icon, color: const Color(0xFF007EA7), size: 28),
    );
  }
}

class MoodIcon extends StatelessWidget {
  final Color color;
  final IconData icon;

  const MoodIcon({super.key, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      child: Icon(icon, color: Colors.white),
    );
  }
}

class DayWidget extends StatelessWidget {
  final String day;
  final String date;
  final bool isSelected;

  const DayWidget({
    super.key,
    required this.day,
    required this.date,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          day,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? const Color(0xFF007EA7) : Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        Text(date),
      ],
    );
  }
}

Widget _buildJournalButton(String imagePath, String label) {
  return Column(
    children: [
      Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(imagePath, fit: BoxFit.contain),
        ),
      ),
      const SizedBox(height: 8),
      Text(label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w500)),
    ],
  );
}
