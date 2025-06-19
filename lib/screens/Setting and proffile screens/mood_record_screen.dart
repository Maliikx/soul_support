import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/widgets/exitBtn.dart';

class MoodRecordScreen extends StatefulWidget {
  const MoodRecordScreen({super.key});

  @override
  State<MoodRecordScreen> createState() => _MoodRecordScreen();
}

class _MoodRecordScreen extends State<MoodRecordScreen> {
  List<String> moodList = [];

  @override
  void initState() {
    super.initState();
    loadMoods();
  }

  void loadMoods() async {
    var box = await Hive.openBox('myBox');
    List<dynamic> storedMoods = box.get('moodsDetailed', defaultValue: []);
    List<String> descriptions = [];

    for (var item in storedMoods) {
      if (item is Map) {
        String desc = item['description']?.toString() ?? '';
        descriptions.add(desc);
      }
    }

    setState(() {
      moodList = descriptions;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
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
            )
            ),
          Container(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Text("Mood Records",style: 
                TextStyle(
                  color: primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 24
                ),),
                SizedBox(height: 50,),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(20),
                    itemCount: moodList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 12),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          moodList[index],
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
              Exitbtn()
        ],
      ),
    );
  }
}
