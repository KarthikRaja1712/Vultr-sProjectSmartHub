import 'package:flutter/material.dart';
import 'package:vultr/pages/homePage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  var islogin = false;
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    // Clean up controllers when the widget is removed from the widget tree
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.pink.shade100,
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome to Vultr Project',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Your journey begins here.',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 16),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (c) => HomePage()),
                              );
                            },
                            icon: Image.network(
                              "https://static-00.iconduck.com/assets.00/google-icon-2048x2048-pks9lbdv.png",
                              height: 25,
                            ),
                            label: Text('Continue with Google'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(child: Divider(color: Colors.white54)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text("or",
                                    style: TextStyle(color: Colors.white54)),
                              ),
                              Expanded(child: Divider(color: Colors.white54)),
                            ],
                          ),
                          SizedBox(height: 20),
                          Form(
                            key: _formKey,
                            child: islogin
                                ? Column(
                              children: [
                                TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    hintText: 'Name',
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(25),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 12),
                                TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(25),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter an email';
                                    }
                                    if (!RegExp(r'\S+@\S+\.\S+')
                                        .hasMatch(value)) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 12),
                                TextFormField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(25),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a password';
                                    }
                                    if (value.length < 6) {
                                      return 'Password must be at least 6 characters';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 12),
                                TextFormField(
                                  controller: confirmPasswordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'Confirm Password',
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(25),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value != passwordController.text) {
                                      return 'Passwords do not match';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!
                                        .validate()) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomePage()),
                                      );
                                    }
                                  },
                                  child: Text('Create Account'),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        islogin = false;
                                      });
                                    },
                                    child: Text.rich(
                                      TextSpan(
                                        text:
                                        'Already have an account? Login ',
                                        style:
                                        TextStyle(color: Colors.white),
                                        children: [
                                          TextSpan(
                                            text: 'here',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              decoration:
                                              TextDecoration.underline,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                                : Column(
                              children: [
                                TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(25),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter an email';
                                    }
                                    if (!RegExp(r'\S+@\S+\.\S+')
                                        .hasMatch(value)) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 12),
                                TextFormField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(25),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a password';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!
                                        .validate()) {
                                      // Perform login action
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomePage()),
                                      );
                                    }
                                  },
                                  child: Text('Login'),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        islogin = true;
                                      });
                                    },
                                    child: Text.rich(
                                      TextSpan(
                                        text:
                                        'New User? Create an account ',
                                        style:
                                        TextStyle(color: Colors.white),
                                        children: [
                                          TextSpan(
                                            text: 'here',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              decoration:
                                              TextDecoration.underline,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Only show cyan area on large screens
                  if (constraints.maxWidth > 600)
          Expanded(child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.cyan.shade50,
          child: Image.network("https://static.vecteezy.com/system/resources/previews/000/364/016/non_2x/mental-health-concept-vector.jpg"),
          ))
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
