import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //for the form validation
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //the function that runs when the sign up button is pressed
  void validate() {
    //will check if the current form state is validated
    if (formKey.currentState.validate()) {
      print("validated");
    } else {
      print('not validated');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black54,
          ),
          child: Column(
            children: [
              Spacer(),
              Container(
                height: 400.0,
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: Form(
                  //the global key that we created at the top
                  key: formKey,
                  //will autovalidate when the user interacts with the form
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        maxLength: 10,
                        decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(
                            Icons.account_circle_outlined,
                          ),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(
                            Icons.vpn_key_outlined,
                          ),
                        ),
                        //will say required if there is nothing entered in the password
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Required";
                          } else if (value.length < 8) {
                            return "min length must be 8";
                          } else {
                            return null;
                          }
                        },
                      ),
                      MaterialButton(
                        onPressed: validate,
                        child: Text("SIGN UP"),
                        color: Colors.deepOrange,
                        height: 60.0,
                        minWidth: double.infinity,
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                      Text(
                        "By signing up you are agreeing to our terms and conditions.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.deepOrange,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
