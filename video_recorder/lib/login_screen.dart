import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_recorder/provider/login_manager.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<LoginManager>(context);
    TextEditingController pno = TextEditingController(text:'+91');
    TextEditingController otp = TextEditingController();
    return Container(
      height: 200,
      width: double.maxFinite,
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Visibility(
              visible: !manager.isvisible,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  TextField(
                    controller: pno,
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),

                  ),
                ],
              ),
            ),
            Visibility(
              visible: manager.isvisible,
              child: Column(
                children: [
                  TextField(
                    controller: otp,
                    decoration: InputDecoration(
                      hintText: 'Enter OTP',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                ],
              ),
            ),
            FlatButton(
              onPressed: () {
                // manager.isvisible
                //     ? manager.verifyOtp(otp.text,context)
                //     : manager.loginWithPhone(pno.text, context);
              },
              color: Color(0xffFCA136),
              child: Text(
                manager.isvisible ? 'Submit OTP' : 'Register',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
