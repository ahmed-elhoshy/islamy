import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/hadeth/hadethDetails.dart';
import 'package:islamy/my_theme.dart';
import 'package:islamy/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethScreen extends StatefulWidget {
  static const String routename = 'hadethScreen';

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (ahadethList.isEmpty) {
      loadHadeth();
    }
    return Column(
      children: [
        Center(child: Image.asset('assets/images/ahadeth_image.png')),
        Divider(
          color: provider.isDark()
              ? MyTheme.goldenColor
              : Theme.of(context).primaryColor,
          thickness: 3,
        ),
        Text(
          'Hadeeth',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
          color: provider.isDark()
              ? MyTheme.goldenColor
              : Theme.of(context).primaryColor,
          thickness: 3,
        ),
        ahadethList.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ))
            : Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Theme.of(context).primaryColor,
                      thickness: 2,
                    );
                  },
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(HadethDetails.routename,
                            arguments: HadethDetailsArgs(
                                title: ahadethList[index].title,
                                content: ahadethList[index].content));
                      },
                      child: Text(
                        ahadethList[index].title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    );
                  },
                  itemCount: ahadethList.length,
                ),
              ),
      ],
    );
  }

  void loadHadeth() async {
    String ahadethContent =
        await rootBundle.loadString('assets/files/hadethFiles/ahadeth.txt');
    List<String> ahadeth = ahadethContent.split('#\r\n');

    /// every hadeth
    for (int i = 0; i < ahadeth.length; i++) {
      List<String> hadethLines = ahadeth[i].split('\n');

      /// lines in every hadeth
      String hadethTitle = hadethLines[0];

      ///title of hadeth
      hadethLines.removeAt(0);

      ///remove title of hadeth
      Hadeth hadeth = Hadeth(title: hadethTitle, content: hadethLines);
      ahadethList.add(hadeth);
    }
    setState(() {});
  }
}

///data class
class Hadeth {
  String title;
  List<String> content = [];

  Hadeth({required this.title, required this.content});
}
