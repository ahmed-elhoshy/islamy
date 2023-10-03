import 'package:flutter/material.dart';

class RadioScreen extends StatelessWidget {
  static const String routename = 'RadioScreen';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset('assets/images/radio_image.png'),
          Text('إذاعة القرآن الكريم',
              style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/next.png'),
              Image.asset('assets/images/play.png'),
              Image.asset('assets/images/next_left.png'),
            ],
          ),
        ],
      ),
    );
  }
}
