import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ViewAllActivity extends StatelessWidget {
  String name;
  ViewAllActivity({this.name});

  // Các biến dùng trong cái lịch
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  label: Text(""))
            ],
            title: Text(name),
            centerTitle: true,
            backgroundColor: Color(0xffe66771),
          ),
          body: ListView(children: [])),
    );
  }
}
