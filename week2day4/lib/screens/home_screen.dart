import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int restSec=7;

  static const int fif=3;
  static const int twen =1200;
  static const int twenFive=1500;
  static const int thir=1800;
  static const int thirFive=2100;

  bool isRest=true;
  bool firstStart=true;
  late int tempSec;
  int totalSeconds=1500;
  bool isRunning = false;
  int round=0;
  int roundCount=1;
  int goal=0;

  late Timer timer;

  List<String> format(int seconds){
    var duration=Duration(seconds: seconds);
    List<String> minSec= [duration.toString().split(".").first.substring(2,4),duration.toString().split(".").first.substring(5,7)];
    return minSec;
  }

  void onTick(Timer timer){
    if(round==4){
      round=0;
      goal++;
    }
    else if(totalSeconds==0){
      if(isRest==true){
        round++;
        isRest=false;
        totalSeconds=restSec;
      }
      else if(isRest==false){
        isRest=true;
        totalSeconds=tempSec;
      }
    }
    else
      setState(() {
        totalSeconds=totalSeconds-1;
      });
  }

  void onStartPressed(){
    timer=Timer.periodic(Duration(seconds: 1), onTick,);
    firstStart=false;
    setState(() {
      isRunning=true;
    });
  }

  void onPausePressed(){
    timer.cancel();
    setState(() {
      isRunning=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Column(
        children: [

          ///pomotimer
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 70,horizontal: 20),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text('POMOTIMER',
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                ),
              ),
            ),
          ),

          ///timer
          Flexible(
            flex: 2,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF0EDCC),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 15),
                      child: Text(
                        "${format(totalSeconds)[0]}",
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 70,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Text(" : ",
                    style: TextStyle(
                      color: Theme.of(context).cardColor.withOpacity(0.6),
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF0EDCC),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 15),
                      child: Text(
                        "${format(totalSeconds)[1]}",
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 70,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///time selecter
          Flexible(
            flex: 1,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextButton(
                      onPressed: fifteenMin,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Text('15',
                          style: TextStyle(
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).cardColor,
                        textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,),
                    child: TextButton(
                      onPressed: twentyMin,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Text('20',
                          style: TextStyle(
                            color: Colors.redAccent,
                          ),),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).cardColor,
                        textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextButton(
                      onPressed: twentyFiveMin,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: const Text('25',
                          style: TextStyle(
                            color: Colors.redAccent,
                          ),),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).cardColor,
                        textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextButton(
                      onPressed: thirtyMin,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: const Text('30',
                          style: TextStyle(
                            color: Colors.redAccent,
                          ),),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).cardColor,
                        textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,),
                    child: TextButton(
                      onPressed: thirtyFiveMin,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: const Text('35',
                          style: TextStyle(
                            color: Colors.redAccent,
                          ),),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).cardColor,
                        textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// button
          Flexible(
            flex: 2,
            child: Center(
              child: IconButton(
                iconSize: 110,
                color: Theme.of(context).cardColor,
                onPressed:
                isRunning ? onPausePressed: onStartPressed,
                icon: Icon(
                    isRunning ? Icons.pause_circle_filled_outlined: Icons.play_circle_fill_outlined,
                ),
              ),
            ),
          ),

          /// round, goal
          Flexible(
            flex: 2,
            child: Container(
              child: Row(
              children: [

                ///round
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${round} / 4",
                          style: TextStyle(
                            color: Theme.of(context).cardColor.withOpacity(0.6),
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("ROUND",
                          style: TextStyle(
                            color: Theme.of(context).cardColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),),
                      ],
                    ),
                  ),
                ),

                ///goal
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${goal} / 12",
                          style: TextStyle(
                            color: Theme.of(context).cardColor.withOpacity(0.6),
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("GOAL",
                          style: TextStyle(
                            color: Theme.of(context).cardColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void thirtyFiveMin(){
    round=0;
    isRest=true;
    goal=0;
    firstStart ? {timer=Timer.periodic(Duration(seconds: 1), onTick,),firstStart=false}:{};
    setState(() {
      totalSeconds=thirFive;
      tempSec=thirFive;
      onPausePressed();
    });
  }

  void thirtyMin(){
    round=0;
    isRest=true;
    goal=0;
    firstStart ? {timer=Timer.periodic(Duration(seconds: 1), onTick,),firstStart=false}:{};
    setState(() {
      totalSeconds=thir;
      tempSec=thir;
      onPausePressed();
    });
  }

  void twentyFiveMin(){
    round=0;
    isRest=true;
    goal=0;
    firstStart ? {timer=Timer.periodic(Duration(seconds: 1), onTick,),firstStart=false}:{};
    setState(() {
      totalSeconds=twenFive;
      tempSec=twenFive;
      onPausePressed();
    });
  }

  void twentyMin(){
    round=0;
    isRest=true;
    goal=0;
    firstStart ? {timer=Timer.periodic(Duration(seconds: 1), onTick,),firstStart=false}:{};
    setState(() {
      totalSeconds=twen;
      tempSec=twen;
      onPausePressed();
    });
  }

  void fifteenMin(){
    round=0;
    isRest=true;
    goal=0;
    firstStart ? {timer=Timer.periodic(Duration(seconds: 1), onTick,),firstStart=false}:{};
    setState(() {
      totalSeconds=fif;
      tempSec=fif;
      onPausePressed();
    });
  }
}
