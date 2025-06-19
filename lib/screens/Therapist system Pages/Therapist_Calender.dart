import 'package:flutter/material.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/providers/calendar_provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'Therapist_Home.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';
//import 'models/calendar_model.dart';


class TherapistCalender extends StatefulWidget {
  const TherapistCalender({super.key});

  @override
  _TherapistCalenderState createState() => _TherapistCalenderState();
}

class _TherapistCalenderState extends State<TherapistCalender> {
  
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
              height: screenHeight,
            padding: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                            Text("Upcoming for you", style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: primary
                            ),),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Container(
                        height: screenHeight-105,
                        child: SfCalendar(
                          cellEndPadding: 0,
                          
                          selectionDecoration: BoxDecoration(
                            border: Border.all(
                              color: primary,
                              width: 2
                            )
                          ),
                          headerStyle: CalendarHeaderStyle(
                            backgroundColor: Colors.white,
                            textStyle: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )
                          ),
                          headerHeight:70,
                          backgroundColor: Colors.white,
                          todayHighlightColor: primary,
                          firstDayOfWeek: 6,
                          cellBorderColor: Colors.transparent,
                          showNavigationArrow: true,
                          showTodayButton: true,
                          view: CalendarView.month,

                          monthViewSettings: MonthViewSettings(
                          agendaViewHeight: screenHeight/2.5,
                          appointmentDisplayCount: 1,
                          showAgenda: true,
                          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment
                          ),
                          dataSource: AppointmentDataSource(_getAppointments()),
                        ),
                      ),
                      // SfCalendar(
                      //   showTodayButton: true,
                      //   view: CalendarView.schedule,
                      //   dataSource: AppointmentDataSource(_getAppointments()),
                      // )
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

  List<Appointment> _getAppointments() {
    return [
      Appointment(
        startTime: DateTime.now().add(Duration(hours: 1)),
        endTime: DateTime.now().add(Duration(hours: 2)),
        subject: 'Therapy Session',
        color:  smallCircle,
      ),
      Appointment(
        startTime: DateTime.now().add(Duration(hours: 1)),
        endTime: DateTime.now().add(Duration(hours: 2)),
        subject: 'Therapy Session2',
        color:  smallCircle,
      ),
       Appointment(
        startTime: DateTime.now().add(Duration(hours: 1)),
        endTime: DateTime.now().add(Duration(hours: 2)),
        subject: 'Therapy Session2',
        color:  smallCircle,
      ), Appointment(
        startTime: DateTime.now().add(Duration(hours: 1)),
        endTime: DateTime.now().add(Duration(hours: 2)),
        subject: 'Therapy Session2',
        color:  smallCircle,
      ), Appointment(
        startTime: DateTime.now().add(Duration(hours: 1)),
        endTime: DateTime.now().add(Duration(hours: 2)),
        subject: 'Therapy Session2',
        color:  smallCircle,
      ), Appointment(
        startTime: DateTime.now().add(Duration(hours: 1)),
        endTime: DateTime.now().add(Duration(hours: 2)),
        subject: 'Therapy Session2',
        color:  smallCircle,
      ), Appointment(
        startTime: DateTime.now().add(Duration(hours: 1)),
        endTime: DateTime.now().add(Duration(hours: 2)),
        subject: 'Therapy Session2',
        color:  smallCircle,
      ),
      Appointment(
        startTime: DateTime.now().add(Duration(days: 1, hours: 3)),
        endTime: DateTime.now().add(Duration(days: 1, hours: 4)),
        subject: 'Check-In Call',
        color: smallCircle,
      ),
    ];
  }
}

class AppointmentDataSource extends CalendarDataSource {
  AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
