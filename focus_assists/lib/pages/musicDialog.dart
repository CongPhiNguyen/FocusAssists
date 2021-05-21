import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_volume_slider/flutter_volume_slider.dart';


class musicDialog extends StatefulWidget {
  const musicDialog({Key key}) : super(key: key);

  @override
  _musicDialogState createState() => _musicDialogState();
}

class _musicDialogState extends State<musicDialog> {
  final fontFamily = "Roboto";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only( left: 60, top: 60, right: 60, bottom: 90),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
        child: Container(
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints.expand(height: 35.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight:Radius.circular(12) ),
                ),
                child: Center(
                  child: Text(
                      "White Noise",
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints.expand(height: 45.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                ),
                child: Center(
                  child: Text(
                    "Choose the song you want to stay focus better!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 1,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // this is music list
              Container(
                constraints: BoxConstraints.expand(height: 200.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 5,),
              Container(
                child: Center(
                  child: Container(
                    constraints: BoxConstraints.expand(height: 50.0, width: 250),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                    ),
                    // child: FlutterVolumeSlider(
                    //    display: Display.HORIZONTAL,
                    //    sliderActiveColor: Colors.blue,
                    //    sliderInActiveColor: Colors.grey,
                    //  ),
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints.expand(height: 48.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight:Radius.circular(12) ),
                ),
                child: Text(
                  "2 button ",
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1.5,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
    );

  }
}
