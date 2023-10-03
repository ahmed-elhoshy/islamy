import 'package:flutter/material.dart';

class HadethDetails extends StatefulWidget {
  static const String routename = 'HadethDetails';

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethDetailsArgs;

    return Stack(
      children: [
        Image.asset(
          'assets/images/background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('${args.title}',
                style: Theme.of(context).textTheme.titleLarge),
          ),
          body:
              // verses.length == 0
              //     ? Center(
              //     child: CircularProgressIndicator(
              //         color: Theme.of(context).primaryColor))
              //     :    /// if else
              Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.width * 0.06,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(
                  '${args.content[index]}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textDirection: TextDirection.rtl,
                );
              },
              itemCount: args.content.length,
            ),
          ),
        ),
      ],
    );
  }
}

class HadethDetailsArgs {
  String title;
  List<String> content = [];

  HadethDetailsArgs({required this.title, required this.content});
}
