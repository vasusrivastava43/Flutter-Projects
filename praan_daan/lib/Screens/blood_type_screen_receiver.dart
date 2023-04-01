import 'package:flutter/material.dart';
import 'package:praan_daan/Screens/contact_detail_screen.dart';
import 'package:praan_daan/themes.dart';
import 'package:praan_daan/widget/button.dart';

class BloodCategoryReceiver extends StatefulWidget {
  const BloodCategoryReceiver({Key? key}) : super(key: key);

  @override
  State<BloodCategoryReceiver> createState() => _BloodCategoryReceiverState();
}

class _BloodCategoryReceiverState extends State<BloodCategoryReceiver> {
  String selectedBloodType = '';
  TextEditingController hospitalAddress=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: backgroundColor,
        title: Text(
          'Blood Type',
          style: appBarTitleStyle,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              runSpacing: 10,
              spacing: 10,
              children: [
                buildChoiceChip('A+'),
                buildChoiceChip('A-'),
                buildChoiceChip('B-'),
                buildChoiceChip('B+'),
                buildChoiceChip('AB+'),buildChoiceChip('AB-'),buildChoiceChip('O+'),buildChoiceChip('O-'),
              ],
            ),
            InkWell(onTap: (){showModalBottomSheet(context: context,
                builder: (context) => TextField(controller: hospitalAddress,
                  decoration: InputDecoration(
                    hintText: 'Hospital Address',
                  ),),);},
                child: Button(heading: 'Contact Donor')),
          ],
        ),
      ),
    );
  }

  ChoiceChip buildChoiceChip(String lable) => ChoiceChip(
    label: Text(lable),
    labelStyle: elevatedButtonTextStyle,
    selectedColor: Color(0xffF9A3CB),
    backgroundColor: backgroundColor,
    labelPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    selected: selectedBloodType == lable,
    onSelected: (_) => setState(() {
      selectedBloodType = lable;
    }),
  );
}
