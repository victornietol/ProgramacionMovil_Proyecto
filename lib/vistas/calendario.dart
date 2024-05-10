import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Calendario extends StatefulWidget {
  const Calendario({super.key, required this.title});
  final String title;

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  final db = FirebaseFirestore.instance;
  late List<Meeting> meetings = [];

  @override
  void initState() {
    super.initState();
    _cargarDatos(); // para cargar los datos de la bd
  }

  Future<void>  _cargarDatos() async{
    List<Meeting> m = [];
    await db.collection("calendario").get().then(
            (documentos){
          for(var doc in documentos.docs){
            final datos = doc.data();
            final nombre = datos["nombre"];
            final inicio = (datos["inicio"] as Timestamp).toDate();
            final fin = (datos["fin"] as Timestamp).toDate();
            final color = Color(datos["color"]);
            m.add(
                Meeting(nombre, inicio, fin, color, false)
            );
          }
        }
    );
    setState(() {
      meetings = m;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(  // imagen para el fondo de la vista
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/pruebas/fondoApp1.png"),
              fit: BoxFit.cover,
              repeat: ImageRepeat.repeat,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: ListView(
                      children: <Widget>[
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Calendario de actividades",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            height: 600,
                            width: double.infinity,
                            child: SfCalendar(
                              dataSource: MeetingDataSource(meetings),
                              view: CalendarView.month,
                              firstDayOfWeek: 7,
                              initialDisplayDate: DateTime(2011,4),
                              minDate: DateTime(2011,3),
                              maxDate: DateTime(2012,3),
                              monthViewSettings: const MonthViewSettings(
                                //appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                                  showAgenda: true,
                              ),
                              timeSlotViewSettings: const TimeSlotViewSettings(
                                  nonWorkingDays: <int>[DateTime.saturday, DateTime.saturday],
                              ),
                              cellBorderColor: Theme.of(context).colorScheme.inversePrimary,

                            )
                        ),
                      ],
                    )
                ),

              ],
            ),
          ),
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}