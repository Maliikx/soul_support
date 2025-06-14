import 'package:flutter/material.dart';
import 'Therapist_Home.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';
import 'providers/calendar_provider.dart';
//import 'models/calendar_model.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: SchedulePage()),
  );
}

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Constants for colors
  static const primaryColor = Color(0xFF01709A);
  static const secondaryColor = Color(0xFF97CADB);
  static const timeLabelColor = Color(0xFFA4B9DE);

  @override
  void initState() {
    super.initState();
    // Load events for today on first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<CalendarProvider>(context, listen: false);
      provider.setSelectedDate(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header with Close Button
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade300, Colors.blue.shade100],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 10,
              bottom: 20,
            ),
            child: Stack(
              children: [
                const Center(
                  child: Text(
                    "UPCOMING FOR YOU",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TherapistHome(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Calendar
          TableCalendar(
            firstDay: DateTime.utc(2025, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
              Provider.of<CalendarProvider>(
                context,
                listen: false,
              ).setSelectedDate(selectedDay);
            },
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            calendarStyle: const CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: secondaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Event List
          Expanded(
            child: Consumer<CalendarProvider>(
              builder: (context, calendarProvider, _) {
                if (calendarProvider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (calendarProvider.error != null) {
                  return Center(
                    child: Text('Error: \\${calendarProvider.error}'),
                  );
                }
                final events = calendarProvider.events;
                if (events.isEmpty) {
                  return const Center(
                    child: Text('لا يوجد مواعيد في هذا اليوم'),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final event = events[index];
                    final start = event.startTime;
                    final end = event.endTime;
                    String timeLabel =
                        "${start.hour.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')}";
                    String timeRange =
                        "${start.hour.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')} - ${end.hour.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}";
                    return _buildEventRow(
                      timeLabel,
                      _buildEventCard(
                        event.title,
                        timeRange,
                        Icons
                            .medical_services_outlined, // يمكنك تخصيص الأيقونة حسب نوع الحدث
                        location: event.data['location']?.toString(),
                        // avatars: event.data['avatars'],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventRow(String time, Widget eventCard) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            time,
            style: const TextStyle(color: timeLabelColor, fontSize: 12),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(child: eventCard),
      ],
    );
  }

  Widget _buildEventCard(
    String title,
    String time,
    IconData icon, {
    String? location,
    List<String>? avatars,
  }) {
    return Card(
      color: primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              time,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            if (location != null) ...[
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.white70,
                    size: 18,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    location,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ],
            if (avatars != null && avatars.isNotEmpty) ...[
              const SizedBox(height: 10),
              Row(
                children:
                    avatars.map((avatar) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage(avatar),
                          onBackgroundImageError: (_, __) {
                            // Handle image loading errors
                          },
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ), // Fallback
                        ),
                      );
                    }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
