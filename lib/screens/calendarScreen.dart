import 'package:flutter/material.dart';
import 'package:happy_pleace/config/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class TabelCalendar extends StatefulWidget {
  const TabelCalendar({super.key});

  @override
  TabelCalendarState createState() => TabelCalendarState();
}

class TabelCalendarState extends State<TabelCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hpBlue,
      appBar: AppBar(
        backgroundColor: shadowBlue,
        title: const Text('Kalender',
            style: TextStyle(color: hpwhite, fontWeight: FontWeight.bold)),
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(2024, 01, 01),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: DateTime.now(),
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
