import 'package:flutter/material.dart';
import 'package:flutter_volume_slider/flutter_volume_slider.dart';
import 'package:focus_assist/pages/dialogHelperToSetTime.dart';
import 'package:path/path.dart';
import 'package:simple_timer/simple_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'dart:async';
import 'PlayPauseButton.dart';

//
const kPrimaryColor = Color(0xFF0C9869);
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);
const double kDefaultPadding = 20.0;
//

class TimerScreen extends StatefulWidget {
  @override
  List <int> value;
  TimerScreen({Key key,@required this.value}): super(key: key);

  _TimerScreenState createState() => _TimerScreenState(value);
}

class _TimerScreenState extends State<TimerScreen> with TickerProviderStateMixin{
  List<int> value;
  _TimerScreenState(this.value);
  bool isVisible = true;
  bool isNotVisible = false;
  TimerController _timerController;

  void initState() {
    // TODO: implement initState
    super.initState();
    _timerController = TimerController(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acitivity name'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.library_music_rounded),
            tooltip: 'Show Snackbar',
            onPressed: () {
              dialogHelper.musicList(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.alarm),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Timer history'),
                    ),
                    body:  Center(
                      child: Container(
                        constraints: BoxConstraints.expand(height: 50.0, width: 250),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                        ),
                        child: FlutterVolumeSlider(
                          display: Display.HORIZONTAL,
                          sliderActiveColor: Colors.blue,
                          sliderInActiveColor: Colors.grey,
                        ),
                      ),
                    ),
                  );
                },
              ));
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff1542bf),Color(0xff51a8ff)],
                begin: FractionalOffset(0.5,1)
            )
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: RaisedButton(
                onPressed: () {
                  // set time here
                  dialogHelper.exit(context);
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors:  <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.body1,
                      children: [
                        TextSpan(text: 'Set time ', style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 1.3,
                        )),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: Icon(Icons.alarm),
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.topCenter,
                height: MediaQuery.of(context).size.height* 0.3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                child: SimpleTimer(
                  duration: Duration(minutes: 10),
                  backgroundColor: Colors.white,
                  controller: _timerController,
                  progressTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                  strokeWidth: 10,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Stack(
              children: <Widget>[
                Container(
                    height: 80,  // height of white range
                    margin: EdgeInsets.only(top: 50),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, -12),
                          blurRadius: 12,
                        ),
                      ],
                      borderRadius: BorderRadius.vertical(
                          top: Radius.elliptical(
                              MediaQuery.of(context).size.width * 2, 50)),
                    )),
                Center(
                  child: Container(
                    child: SizedBox(
                      height: 90,
                      width: 90,
                      child: PlayButton(
                        pauseIcon: Icon(Icons.pause, color: Colors.white, size: 60, ),
                        playIcon: Icon(Icons.play_arrow, color: Colors.white, size: 60),
                        onPressed: () {
                          _timerController.start();
                        },
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 10, top: 65),
                            child: Text(
                              "Focus level:",
                              style: TextStyle(
                                fontSize: 14,
                              ),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 5),
                          child: Text(
                            "   A B C D    ",  // lưu ý khi chỉnh sửa
                            style: TextStyle(
                              fontSize: 20,
                            ),),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 230, top: 65),
                          child: Text(
                            "Recent Focus",
                            style: TextStyle(
                              fontSize: 14,
                            ),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 230, top: 5),
                          child: Text(
                            "00:00:00",
                            style: TextStyle(
                              fontSize: 25,
                            ),),
                        ),

                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  // create set time dialog
  createSetTimeDialog(BuildContext context){
    TextEditingController customController = TextEditingController();
    return showDialog(context: context, builder: (context){
      return AlertDialog ( );
    } );
  }
}



