import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool _isObscure=true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/back.jpg'),
            fit:BoxFit.cover)
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [Container(
            padding: EdgeInsets.only(top:90,left: 30),
            child: Text('Welcome\nBack',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
         SingleChildScrollView(
           child: Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5,left: 35,right: 35),
            child:Column(
              children:[
                TextField(
                  decoration: InputDecoration(

                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                ) ,
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
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, 'register');
                      },
                        child: Text('Sign Up',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                          ),
                        )
                    ),
                    TextButton(onPressed: (){},
                        child: Text('Forgot Password',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                          ),
                        )
                    ),
                  ],
                )
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
