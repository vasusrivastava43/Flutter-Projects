import 'package:flutter/material.dart';
import 'package:praan_daan/themes.dart';
import 'package:praan_daan/widget/button.dart';

class BloodCategoryDonor extends StatefulWidget {
  const BloodCategoryDonor({Key? key}) : super(key: key);

  @override
  State<BloodCategoryDonor> createState() => _BloodCategoryDonorState();
}

class _BloodCategoryDonorState extends State<BloodCategoryDonor> {
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
            InkWell(onTap: (){
              showModalBottomSheet(context: context,
                  builder: (context) => SizedBox(
                    height: physicalHeight*.25,
                    child: TextField(controller: hospitalAddress,
                      decoration: InputDecoration(
                        hintText: 'Hospital Address',
                      ),),
                  ),);
            },
                child: Button(heading: 'Contact Receiver')),
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
