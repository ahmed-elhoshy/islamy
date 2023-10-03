import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islamy/my_theme.dart';

class SebhaScreen extends StatefulWidget {
  static const String routename = 'SebhaScreen';

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int tasbeeh = 0;
  int index = 0;
  List<String> doaa = ['سبحان الله', 'الحمد لله'];
  double rotation = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // SizedBox(
          //   height: 20,
          // ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                child: Image.asset(
                  'assets/images/head_of_seb7a.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                child: InkWell(
                    onTap: () {
                      tasbeeh++;
                      if (tasbeeh % 33 == 0) {
                        index++;
                      }
                      if (tasbeeh % 66 == 0) {
                        index = 0;
                      }
                      setState(() {
                        rotation = rotation + new Random().nextInt(45);
                      });
                    },
                    child: Transform.rotate(
                        angle: rotation,
                        child: Image.asset('assets/images/body_of_seb7a.png'))),
              ),
            ],
          ),
          Text('عدد التسبيحات', style: Theme.of(context).textTheme.bodyLarge),
          Container(
            height: 70,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFC7B295),
            ),
            child: Center(
                child: Text(
              '$tasbeeh',
              style: Theme.of(context).textTheme.titleMedium,
            )),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MyTheme.primaryLight,
            ),
            child: Text(
              '${doaa[index]}',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        ],
      ),
    );
  }

  void rotate() {
    setState(() {
      if (tasbeeh % 33 == 0) {
        index++;
      }
      if (tasbeeh % 66 == 0) {
        index = 0;
      }
    });
  }
}
