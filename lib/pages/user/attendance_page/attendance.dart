// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/common/drawer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  final items = ['DSA', 'DBMS', 'OOPS', 'COE', 'OS'];
  String? value;
  late List<GDPData> _chartData;
  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance"),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 35),
            DropdownButton<String>(
              value: value,
              items: items.map(buildMenuItem).toList(),
              onChanged: (value) => setState(() => this.value = value),
            ),
            SizedBox(height: 40),
            Expanded(
              child: Center(
                child: Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: Color.fromARGB(156, 206, 206, 206)),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: SfCircularChart(
                    title: ChartTitle(
                        text: 'Number of classes \n (Attended , Not attended)'),
                    legend: Legend(
                        isVisible: true,
                        overflowMode: LegendItemOverflowMode.wrap),
                    series: <CircularSeries>[
                      DoughnutSeries<GDPData, String>(
                          dataSource: _chartData,
                          xValueMapper: (GDPData data, _) => data.status,
                          yValueMapper: (GDPData data, _) => data.gdp,
                          dataLabelSettings: DataLabelSettings(isVisible: true))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ));

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Attended', 45),
      GDPData('Not Attended', 8),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.status, this.gdp);
  final String status;
  final int gdp;
}
