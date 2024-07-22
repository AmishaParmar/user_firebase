import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user/screens/login.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController uNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pswdController = TextEditingController();
  TextEditingController confirmPswdController = TextEditingController();

  TextStyle appTxtStyle = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  TextStyle txtStyle = const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  final TextStyle labels = const TextStyle(
      color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w600);

  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    uNameController.dispose();
    pswdController.dispose();
    confirmPswdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: appTxtStyle,
        ),
        centerTitle: true,
        elevation: 15,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/signup.jpg",
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLength: 10,
                  keyboardType: TextInputType.text,
                  controller: uNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Username";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_2),
                    focusColor: Colors.grey,
                    label: const Text("Username"),
                    labelStyle: labels,
                  ),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLength: 20,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty ||
                        !value.contains("@")) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.mail),
                    focusColor: Colors.grey,
                    label: const Text("Email"),
                    labelStyle: labels,
                  ),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: true,
                  maxLength: 6,
                  controller: pswdController,
                  validator: (value) {
                    if (value == null || value.trim().length < 6) {
                      return "Please enter Password of atleast 6 characters long";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    focusColor: Colors.grey,
                    label: const Text("Password"),
                    labelStyle: labels,
                  ),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: true,
                  maxLength: 6,
                  controller: confirmPswdController,
                  validator: (value) {
                    if (value!.isEmpty ||
                        pswdController.text != confirmPswdController.text) {
                      return "Please confirm Password";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    focusColor: Colors.grey,
                    label: const Text("Confirm Password"),
                    labelStyle: labels,
                  ),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async{
                    FocusScope.of(context).unfocus();
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Registration is successful"),
                        ),
                      );

                       try {
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: pswdController.text,
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LogIn()),
                      );
                    } catch (e) {
                      print('Error: $e');
                    }
                    }
                  },
                  style: const ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(
                      Size.fromHeight(50),
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                    elevation: WidgetStatePropertyAll(10),
                    backgroundColor:
                        WidgetStatePropertyAll(Color.fromARGB(255, 22, 81, 21)),
                  ),
                  child: const Text(
                    "Create an account",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                      style: const ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                        elevation: WidgetStatePropertyAll(20),
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return const LogIn();
                        }));
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
