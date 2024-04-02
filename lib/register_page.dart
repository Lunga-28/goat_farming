import 'package:flutter/material.dart';
import 'package:goat_farm_manager/components/_textfied.dart';
import 'package:goat_farm_manager/components/my_button.dart';
import 'package:goat_farm_manager/auth/auth_services.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  // takes us to login page
  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});
  void Register(BuildContext context) async {
    //register logic
    // get auth services
    final _auth = AuthService();
    // try to register if password and confirm password are the same
    if (passwordController.text == confirmPasswordController.text) {
      try {
        await _auth.registerWithEmailAndPassword(
          emailController.text,
          passwordController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Passwords do not match'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 50),
            Text(
              'Welcome back!',
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 25),

            //email textField
            Myfield(
              hintText: 'Email',
              obscureText: false,
              controller: emailController,
            ),
            const SizedBox(height: 25),

            //Password textField
            Myfield(
              hintText: 'Password',
              obscureText: true,
              controller: passwordController,
            ),
            const SizedBox(height: 25),
            //Confirm Password textField
            Myfield(
              hintText: 'Confirm Password',
              obscureText: true,
              controller: confirmPasswordController,
            ),
            // the Login button
            Mybutton(
              text: "Register",
              onTap: () => Register(context),
            ),

            //register button and field
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
