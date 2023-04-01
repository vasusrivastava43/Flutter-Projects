import 'package:flutter/material.dart';
import 'package:praan_daan/Screens/donate_organ.dart';
import 'package:praan_daan/Screens/myth_vs_fact_screen.dart';
import 'package:praan_daan/Screens/request_organ.dart';
import 'package:praan_daan/themes.dart';

import '../widget/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Container(
            height: physicalHeight * .12,
            child: Image.asset('assets/img_4.png'),
          ),
          InkWell(
            onTap: (){Navigator.push((context), MaterialPageRoute(builder: (context) => DonateOrganScreen(),));},
              child: Button(heading: 'Donate Organ'),),
          InkWell(onTap: (){Navigator.push((context), MaterialPageRoute(builder: (context) => RequestOrganScreen(),));},
              child: Button(heading: 'Request Organ')),
          InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MythVsFact(),));},
              child: Button(heading: 'Myth vs Facts')),
          InkWell(child: Button(heading: 'Claim Reward')),
        ],
      ),
    );
  }
}

