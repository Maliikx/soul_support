import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'providers/therapist_provider.dart';
import 'Therapist_Calender.dart';
import 'Therapist_Settings.dart';


class Therapist_Home extends StatefulWidget {
  const Therapist_Home({super.key});

  @override
  State<Therapist_Home> createState() => _Therapist_HomeState();
}

class _Therapist_HomeState extends State<Therapist_Home> {

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

  final Color primary = const Color(0xFF01709A);
  final Color bigCircle = Colors.blue.shade200;
  final Color smallCircle = Colors.blue.shade100;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Builder(
        builder: (context) => Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("Assets/Group 6878.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Consumer<TherapistProvider>(
            builder: (context, provider, _) {
              if (provider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (provider.error != null) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        provider.error!,
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          provider.clearError();
                          provider.refreshAll();
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context),
                    _buildPatientImages(provider),
                    _buildTodayAppointments(provider),
                    _buildActivitySection(provider),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(40),
      ),
      child: Stack(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: primary,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
            ),
          ),
          Positioned(
            left: -135,
            top: -135,
            child: Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                color: bigCircle,
                borderRadius: BorderRadiusDirectional.circular(350),
              ),
            ),
          ),
          Positioned(
            left: -50,
            top: -48,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: smallCircle,
                borderRadius: BorderRadiusDirectional.circular(200),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF01709A),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.menu, color: Colors.white),
                      SizedBox(width: 5),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Welcome, Dr. $username',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  '  Have a nice day at work and stay healthy',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPatientImages(TherapistProvider provider) {
    final patients = provider.patients ?? [];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: patients.length,
              itemBuilder: (context, index) {
                final patient = patients[index];
                return _buildImageCard(
                  patient['profileImage'] ?? 'Assets/person.png',
                  patient['name'] ?? 'Patient ${index + 1}',
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Image.asset(
              "Assets/Frame 5.png",
              width: 396.55718994140625,
              height: 266.393310546875,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodayAppointments(TherapistProvider provider) {
    final appointments = provider.todayAppointments ?? [];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Your patients Today',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0889B9),
                ),
              ),
              const SizedBox(width: 110),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SchedulePage()),
                  );
                },
                child: const Text(
                  "Show All",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFF0889B9),
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0889B9),
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index];
                final patient = appointment['patient'] ?? {};
                final startTime = DateTime.parse(appointment['dateTime'] ?? DateTime.now().toIso8601String());
                final endTime = startTime.add(const Duration(hours: 1));
                return _buildPatientCard(
                  patient['name'] ?? 'Unknown Patient',
                  'Today, ${_formatTime(startTime)} - ${_formatTime(endTime)}',
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivitySection(TherapistProvider provider) {
    final activity = provider.todayActivity;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Activity',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0889B9),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Image.asset(
              "Assets/Frame 6.png",
              width: 359.95245361328125,
              height: 179.32794189453125,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard(String imagePath, String name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              print('Image tapped: $imagePath');
            },
            child: Image.asset(
              imagePath,
              width: 143,
              height: 146,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF0889B9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPatientCard(String name, String time) {
    return SizedBox(
      width: 200,
      child: Card(
        elevation: 3,
        child: ListTile(
          title: Text(
            name,
            style: const TextStyle(fontSize: 16, color: Color(0xFF0889B9)),
          ),
          subtitle: Text(time),
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder:
              (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF01709A), Color(0xFF004466)],
          ),
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  static const primary = Color(0xFF01709A);

  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Stack(
        children: [
          Positioned(
            top: 17,
            left: -214,
            child: Transform.rotate(
              angle: 0.12,
              child: Container(
                width: 720,
                height: 750,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 0, 140, 195),
                      Color.fromARGB(0, 151, 202, 219),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 1],
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Positioned(
            top: 645,
            left: 190,
            child: Transform.rotate(
              angle: 0.12,
              child: Container(
                width: 340,
                height: 340,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 244, 223, 218),
                      Color.fromARGB(0, 244, 223, 218),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 1],
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "Assets/Group 36754.png",
                      width: 60,
                      height: 60,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Hello Ethar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                _buildDrawerItem(
                  icon: "Assets/lucide_home.png",
                  title: 'Home',
                  isSelected: true,
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Therapist_Home()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                _buildDrawerItem(
                  icon: "Assets/Group.png",
                  title: 'Calendar',
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SchedulePage()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                _buildDrawerItem(
                  icon: "Assets/lets-icons_setting-line.png",
                  title: 'Settings',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const setting_screen()),
                    );
                  },
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 40),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("Assets/tabler_logout.png"),
                        width: 34,
                        height: 34,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Log out',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required String icon,
    required String title,
    required VoidCallback onTap,
    bool isSelected = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
          ),
          Image.asset(
            icon,
            width: 42,
            height: 42,
            color: isSelected ? Colors.white : const Color(0xFF99C6D7),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF99C6D7),
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
