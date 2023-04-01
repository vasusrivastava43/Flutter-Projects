import 'package:flutter/material.dart';
import 'package:praan_daan/themes.dart';

class MythVsFact extends StatelessWidget {
  const MythVsFact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        foregroundColor: Colors.black,
        title: Text('Organ Donation',
          style: appBarTitleStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: physicalWidth*.12,
                  height: physicalHeight*.03,
                  color: Color(0xffF9A3CB),
                  child: Center(
                    child: Text('Myths',style: appBarTitleStyle.copyWith(fontWeight: FontWeight.bold),),
                  ),
                ),Container(
                  width: physicalWidth*.12,
                  height: physicalHeight*.03,
                  child: Center(
                    child: Text('vs',style: appBarTitleStyle.copyWith(fontWeight: FontWeight.bold),),
                  ),
                ),Container(
                  width: physicalWidth*.12,
                  height: physicalHeight*.03,
                  child: Center(
                    child: Text('Facts',
                    style: appBarTitleStyle.copyWith(fontWeight: FontWeight.bold),),
                  ),
                  color: Color(0xffF9A3CB),
                ),
              ],
            ),
            Row(
              children: [
                content('Doctors will let me die if I’m a known registered donor'),
                Container(
                  width: physicalWidth*.12,
                  height: physicalHeight*.08,
                  child: Center(
                    child: Image.asset('assets/img_2.png',),
                  ),
                ),content('Your treatment has nothing to do with donation. Donation is considered only after declared dead')
              ],
            ),
            Row(
              children: [
                content('I’m too young/old to donate'),
                Container(
                  width: physicalWidth*.12,
                  height: physicalHeight*.08,
                  child: Center(
                    child: Image.asset('assets/img_1.png',),
                  ),
                ),content('No one is too young/old to donate. Once the consent is given, decision depends on various medical criteria not age')
              ],
            ),
            Row(
              children: [
                content('donation is against my religion'),
                Container(
                  width: physicalWidth*.12,
                  height: physicalHeight*.08,
                  child: Center(
                    child: Image.asset('assets/img_3.png',),
                  ),
                ),content('All major religions support organ donation as ultimate form of charity')
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container content(String content) {
    return Container(
              width: physicalWidth*.12,
              height: physicalHeight*.16,
              color: Color(0xffF9A3CB),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Text(content,softWrap: true,style: appBarTitleStyle,),
                ),
              ),
            );
  }
}
