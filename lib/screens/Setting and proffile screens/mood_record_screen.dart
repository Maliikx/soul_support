import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:soul_support/widgets/exitBtn.dart';

class moodrecord_screen extends StatefulWidget {
  const moodrecord_screen({super.key});

  @override
  State<moodrecord_screen> createState() => _moodrecord_screenState();
}

class _moodrecord_screenState extends State<moodrecord_screen> {
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
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 10,
            right: 5,
            top: 80,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: const Color(0xffFFFFFF).withOpacity(0.6),
              ),
              width: 398,
              height: 740,
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
          ),
          Exitbtn()
        ],
      ),
    );
  }
}
