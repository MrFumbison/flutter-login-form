import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  createState(){
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen>{

  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  Widget build(context){
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0),),
            submitButton(),
          ],
        ),
        ),
    );
  }

  Widget emailField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'email address',
        hintText: 'abcd@gmail.com',
      ),

      validator: (value){
        if (!value!.contains('@')){
          return 'please enter the valid email';
        }

        return null;
      },

      onSaved: (value){
       email = value!;
      }
    );
  }

  Widget passwordField(){
    return TextFormField(
      obscureText: false,
      decoration: InputDecoration(
        labelText: 'enter password',
        hintText: 'password',
      ),

      validator: (value) {
        if (value!.length < 4){
          return 'password must be atleast four(4 character)';
        }

        return null;
      },

      onSaved: (value){
       password = value!;
      },
    );
  }

  Widget submitButton(){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.black,
        primary: Colors.green,
        padding: EdgeInsets.symmetric(horizontal: 16),
        minimumSize: Size(90, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          
        )
      ),
      onPressed: () {
        if (formKey.currentState!.validate()){
          formKey.currentState?.save();

          print('time to post some $email and $password to the API');
        }
      }, 
      child: Text('submit!'),
      );
  }
}