import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();

  void login1(String email, password) async{

    try{
       print(" destruction destruction destruction ");
      Response response = await post(Uri.parse('https://reqres.in/api/register'),
        body: {
        'email':email,
          'password': password
        }
      );
      if(response.statusCode==200){
        print('account created succesfully');
      }else{
        print('failed');
      }
    }catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up Api"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email'
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'password'
              ),
            ),
            GestureDetector(
              onTap: (){
                login1(emailController.text.toString(),passwordController.text.toString());
                print("object destructeurs45");
              },
                child: SizedBox(
                  height: 40,)),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text('Sign Up'),),
            )
          ],
        ),
      ),
    );
  }
}
