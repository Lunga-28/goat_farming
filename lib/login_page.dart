import 'package:flutter/material.dart';
import 'package:goat_farm_manager/components/_textfied.dart';
import 'package:goat_farm_manager/components/my_button.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginPage({super.key});
  void login() {}
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
              'Lets create new account',
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

            // the Login button
            Mybutton(
              text: "Login",
              onTap: login,
            ),

            //register button and field
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    "Register",
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
