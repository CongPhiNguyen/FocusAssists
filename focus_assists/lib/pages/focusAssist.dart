import 'package:flutter/material.dart';
import 'package:focus_assist/pages/progress_screen.dart';
import 'package:focus_assist/pages/setting_screen.dart';
import 'package:focus_assist/pages/journal_screen.dart';
// import 'package:focus_assist/classes/DbProvider.dart';
// import 'package:focus_assist/classes/Data.dart';

import 'journal_screen.dart';

//import 'dart:math';

class FocusAssist extends StatefulWidget {
  @override
  _FocusAssistState createState() => _FocusAssistState();
}

class _FocusAssistState extends State<FocusAssist> {
  int selectedIndex = 4;
  //final dbHelper = DbProvider.instance;
  //List<Map<String, dynamic>> database;

  // String getRandomString(int len) {
  //   var r = Random();
  //   return String.fromCharCodes(
  //       List.generate(len, (index) => r.nextInt(33) + 89));
  // }

  // @override
  // void initState() async {
  //   // TODO: implement initState
  //   super.initState();
  //   database = await dbHelper.query('NGUOIDUNG');
  //   while (database.length != 0) {
  //     Map<String, dynamic> row = {
  //       'MANGUOIDUNG': getRandomString(5),
  //       'TENTAIKHOAN': 'NGUYEN CONG PHI',
  //       'MATKHAU': '1111',
  //     };
  //     final id = await dbHelper.insert('NGUOIDUNG', row);
  //     print('inserted row id: $id');
  //     database = await dbHelper.query('NGUOIDUNG');
  //   }
  //   String name = database[0]['MANGUOIDUNG'];
  //   StaticData.userID = name;
  // }

  final List<Widget> widgetOptions = <Widget>[
    Center(
      child: Text(
        'Focus Timer',
      ),
    ),
    Center(child: JournalScreen()),
    Center(
      child: Text(
        'Reward',
      ),
    ),
    /*Center(
      child: Text(
        'Progress',
      ),
    ),*/
    ProgressScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: widgetOptions.elementAt(selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey[600],
          iconSize: 28.0,
          backgroundColor: Colors.grey[300],
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.timer,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wysiwyg_rounded),
              label: 'Journal',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Farm',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.waterfall_chart),
              label: 'Progress',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
