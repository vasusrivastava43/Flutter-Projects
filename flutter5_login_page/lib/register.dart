import 'package:flutter/material.dart';

class myRegister extends StatefulWidget {
  const myRegister({Key? key}) : super(key: key);

  @override
  State<myRegister> createState() => _myRegisterState();
}

class _myRegisterState extends State<myRegister> {
  bool _isObscure=true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/backgroung.jpg'),
              fit:BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [Container(
            padding: EdgeInsets.only(top:40,left: 30),
            child: Text('Create\nAccount',
              style: TextStyle(
                color: Colors.lightBlue[500],
                fontSize: 30,
              ),
            ),
          ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3,left: 35,right: 35),
                child:Column(
                  children:[
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ) ,
                    SizedBox(height: 30,),
                    TextField(obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),) ,
                    SizedBox(height: 30,),
                    TextField(
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: (){},
                            child: Text('Sign In',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                        ),

                        CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 30,
                            child:IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.arrow_forward),
                              color: Colors.white,
                            )
                        )
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
