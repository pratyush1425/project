// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/common/bottom_bar.dart';
import 'package:project/common/drawer.dart';
import 'package:table_calendar/table_calendar.dart';

import 'event.dart';

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  late Map<DateTime, List<Event>> selectedEvents;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  final TextEditingController _eventcontroller = TextEditingController();
  @override
  void dispose() {
    _eventcontroller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events And Notice"),
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2000, 1, 1),
            lastDay: DateTime.utc(2050, 3, 14),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update `_focusedDay` here as well
              });
            },
            eventLoader: _getEventsfromDay,
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          SizedBox(
            height: 10,
          ),
          ..._getEventsfromDay(_selectedDay).map((Event event) => ListTile(
                title: Text(event.title),
              ))
        ],
      ),
      bottomNavigationBar: MyBottomBar(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Add Event"),
                  content: TextField(
                    controller: _eventcontroller,
                    decoration: InputDecoration(
                        hintText: "Enter Title", label: Text("Title")),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Cancel")),
                    TextButton(
                      onPressed: () {
                        if (_eventcontroller.text.isNotEmpty) {
                          if (selectedEvents[_selectedDay] == null) {
                            selectedEvents[_selectedDay] = [
                              Event(title: _eventcontroller.text)
                            ];
                          } else {
                            selectedEvents[_selectedDay]
                                ?.add(Event(title: _eventcontroller.text));
                          }
                        }
                        Navigator.pop(context);
                        _eventcontroller.clear();
                        setState(() {});
                        return;
                      },
                      child: Text("Ok"),
                    )
                  ],
                )),
        label: Text("Add Event"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
