import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SurrahDetails extends StatefulWidget {
  static const String routename = 'SurrahDetails';

  @override
  State<SurrahDetails> createState() => _SurrahDetailsState();
}

class _SurrahDetailsState extends State<SurrahDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SurahDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
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
            title: Text('${args.name}',
                style: Theme.of(context).textTheme.titleLarge),
          ),
          body: verses.length == 0
              ? Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor))
              :

              /// if else
              Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.width * 0.06,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Text(
                        '${verses[index]}  {${index + 1}} \n',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                        textDirection: TextDirection.rtl,
                      );
                    },
                    itemCount: verses.length,
                  ),
                ),
        ),
      ],
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/quranFiles/${index + 1}.txt');

    /// 3shan a2ra el files
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}

class SurahDetailsArgs {
  String name;
  int index;

  SurahDetailsArgs({required this.name, required this.index});
}
