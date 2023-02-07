// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:main_cluesnew/model/profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Scaffold(
                appBar: AppBar(
                  title: const Text("Error"),
                  ),
                body: Center(child: Text("${snapshot.error}"),
                ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("สร้างบัญชีผู้ใช้"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("อีเมล", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: "กรุณาป้อนอีเมลด้วยครับ"),
                            EmailValidator(errorText: "รูปแบบอีเมลไม่ถูกต้อง")
                          ]),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (String? email) {
                            profile.email = email!;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text("รหัสผ่าน", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: RequiredValidator(errorText: "กรุณาป้อนรหัสผ่านด้วยครับ"),
                            obscureText: true,
                            onSaved: (String? password) {
                            profile.password = password!;
                          },
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: const Text("ลงทะเบียน",style: TextStyle(fontSize: 20)),
                            onPressed: () async{
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                try{
                                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                    email: profile.email, 
                                    password: profile.password
                                  ).then((value){
                                    formKey.currentState?.reset();
                                    Fluttertoast.showToast(
                                      msg: "สร้างบัญชีผู้ใช้เรียบร้อยแล้ว",
                                      gravity: ToastGravity.TOP
                                    );
                                    Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context){
                                        return const HomeScreen();
                                    }));
                                  });
                                }on FirebaseAuthException catch(e){
                                    print(e.code);
                                    String message;
                                    if(e.code == 'email-already-in-use'){
                                        message = "มีอีเมลนี้ในระบบแล้วครับ โปรดใช้อีเมลอื่นแทน";
                                    }else if(e.code == 'weak-password'){
                                        message = "รหัสผ่านต้องมีความยาว 6 ตัวอักษรขึ้นไป";
                                    }else{
                                        message = e.message!;
                                    }
                                    Fluttertoast.showToast(
                                      msg: message,
                                      gravity: ToastGravity.CENTER
                                    );
                                }
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
