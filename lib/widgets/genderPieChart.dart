import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GenderPieChart extends StatelessWidget {
  final int maleCount;
  final int femaleCount;

  const GenderPieChart({
    super.key,
    required this.maleCount,
    required this.femaleCount,
  });

  @override
  Widget build(BuildContext context) {
    final total = maleCount + femaleCount;
    final malePercent = maleCount / total * 100;
    final femalePercent = femaleCount / total * 100;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: PieChart(
            PieChartData(
              sectionsSpace: 2,
              centerSpaceRadius: 40,
              sections: [
                PieChartSectionData(
                  value: maleCount.toDouble(),
                  color: femalePercent > malePercent ? Colors.white70 : Colors.white,
                  titlePositionPercentageOffset: 3,
                  title: "${malePercent.toStringAsFixed(1)}%",
                  radius: 10,
                  titleStyle: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                PieChartSectionData(
                  value: femaleCount.toDouble(),
                  color: malePercent > femalePercent ? Colors.white70 : Colors.white,
                  titlePositionPercentageOffset: 3,
                  title: "${femalePercent.toStringAsFixed(1)}%",
                  radius: 10,
                  titleStyle: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                  color: femalePercent > malePercent ? Colors.white70 : Colors.white,
              ),
            ),
            SizedBox(width: 5,),
            Text("Male",
            style: TextStyle(
              fontWeight: femalePercent > malePercent ? FontWeight.normal : FontWeight.bold,

              color: Colors.white
            ),),
          ],
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                  color: malePercent > femalePercent ? Colors.white70 : Colors.white,
              ),
            ),
            SizedBox(width: 5,),
            Text("Female",
            style: TextStyle(
              fontWeight: malePercent > femalePercent ? FontWeight.normal : FontWeight.bold,
              color: Colors.white
            ),),
          ],
                 ),
      ],
    );
  }
}
