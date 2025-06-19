import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:soul_support/main.dart';

class PatientStatisticsChart extends StatefulWidget {
  @override
  _PatientStatisticsChartState createState() => _PatientStatisticsChartState();
}

class _PatientStatisticsChartState extends State<PatientStatisticsChart> {
  int _selectedPeriod = 0; // 0=Weekly, 1=Monthly, 2=Yearly
  final List<Color> gradientColors = [
    accent,
    smallCircle,
  ];

  final List<double> weeklyData = [12, 8, 16, 12, 15, 10, 14];
    final List<double> monthlyData = [35, 40, 20, 66,];
  final List<double> yearlyData = [200, 150, 324, 250, ];

 List<double> get currentData {
    switch(_selectedPeriod) {
      case 0: return weeklyData;
      case 1: return monthlyData;
      case 2: return yearlyData;
      default: return weeklyData;
    }
  }
  
  final List<String> days = [ 'SAT', 'SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI',];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.only( top: 10, left: 15, right: 15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Period Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'patients \nstatistics',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(147, 1, 113, 154),
                  ),
                ),
                Row(
                children: [
                  _buildPeriodButton('WEEKLY', 0),
                  _buildPeriodButton('MONTHLY', 1),
                  _buildPeriodButton('YEARLY', 2),
                ],
              ),
               
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Line Chart
            SizedBox(
              height: 180,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    horizontalInterval: _selectedPeriod == 2 ? 100
                                      : _selectedPeriod == 1 ? 10 
                                      : 5,                     
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey[200],
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    topTitles: AxisTitles(
                      drawBelowEverything: true,
                      sideTitles: SideTitles(
                        reservedSize: 22, // Space for labels
                        showTitles: true,
                        interval: 1,
                     getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (index >= 0 && index < currentData.length) {
                            if (_selectedPeriod == 0) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  days[index % days.length],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              );
                            } else if (_selectedPeriod == 1) {
                              return Text(
                                'W${index + 1}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              );
                            } else {
                              return Text(
                                'Q${index + 1}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              );
                            }
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '${value.toInt()}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  minX: 0,
                  maxX: currentData.length-1,
                  minY: 0,
                  maxY: _selectedPeriod == 2 
                      ? 500 // Higher max for yearly
                      : _selectedPeriod == 1
                        ? 100 // Medium max for monthly
                        : 20, // Lower max for weekly,
                  lineBarsData: [
                    LineChartBarData(
                      spots: currentData.asMap().entries.map((e) {
                        return FlSpot(e.key.toDouble(), e.value);
                      }).toList(),
                      isCurved: true,
                      
                      gradient: LinearGradient(
                        colors: gradientColors,
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      barWidth: 5,
                      isStrokeCapRound: true,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) {
                          return FlDotCirclePainter(
                            radius: 0,
                            color: Colors.white,
                            strokeWidth: 0,
                            strokeColor: gradientColors[1],
                          );
                        },
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: gradientColors
                              .map((color) => color.withOpacity(0.75))
                              .toList(),
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPeriodButton(String text, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: TextButton(
        onPressed: () => setState(() => _selectedPeriod = index),
        style: TextButton.styleFrom(
          foregroundColor: _selectedPeriod == index 
              ? Colors.white 
              : Colors.grey[700],
          backgroundColor: _selectedPeriod == index 
              ? primary
              : Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}