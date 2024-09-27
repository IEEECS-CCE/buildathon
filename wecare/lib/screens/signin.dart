// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:wecare/widgets/button.dart';
// import 'package:wecare/widgets/textFeild.dart';
// import 'home.dart';

// class SignInPage extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           'SIGN IN',
//           style: TextStyle(letterSpacing: 12, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'assets/images/logo.png',
//                 width: 200,
//                 height: 200,
//               ),
//               TextField(
//                 controller: emailController,
//                 decoration: const InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.email),
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//               ),
//               const SizedBox(height: 16.0),
//               TextField(
//                 controller: passwordController,
//                 decoration: const InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.lock),
//                 ),
//                 obscureText: true,
//               ),
//               const SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: () {
//                   // if (_validateInputs()) {
//                   //   Get.off(const HomePage());
//                   // } else {
//                   //   Get.snackbar('Error', 'Please enter valid credentials',
//                   //       snackPosition: SnackPosition.BOTTOM);
//                   // }
//                   Get.off(() => HomePage());
//                 },
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 40.0, vertical: 16.0),
//                 ),
//                 child: const Text('Sign In'),
//               ),
//               const SizedBox(height: 10.0),
//               TextButton(
//                 onPressed: () {},
//                 child: const Text("Don't have an account? Sign up"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   bool _validateInputs() {
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();

//     if (email.isNotEmpty && password.isNotEmpty) {
//       if (GetUtils.isEmail(email)) {
//         return true;
//       }
//     }
//     return false;
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecare/widgets/custom_button.dart';
import 'package:wecare/widgets/custom_text_field.dart';
import 'home.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    centerTitle: true,
        title: const Text(
          'SIGN UP',
          style: TextStyle(letterSpacing: 12, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 200,
                height: 200,
              ),
              CustomTextField(
                controller: nameController,
                labelText: 'Name',
                prefixIcon: Icons.person,
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                controller: emailController,
                labelText: 'Email',
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                controller: passwordController,
                labelText: 'Password',
                prefixIcon: Icons.lock,
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                controller: bloodGroupController,
                labelText: 'Blood Group',
                prefixIcon: Icons.bloodtype,
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: ageController,
                      labelText: 'Age',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: CustomTextField(
                      controller: genderController,
                      labelText: 'Gender',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: weightController,
                      labelText: 'Weight',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: CustomTextField(
                      controller: heightController,
                      labelText: 'Height',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              CustomButton(
                text: 'Sign Up',
                onPressed: () {
                  if (_validateInputs()) {
                    Get.off(() => HomePage());
                  } else {
                    Get.snackbar('Error', 'Please enter valid credentials',
                        snackPosition: SnackPosition.BOTTOM);
                  }
                },
              ),
              const SizedBox(height: 10.0),
              TextButton(
                onPressed: () {
                  // Navigate to Sign In page or other relevant action
                },
                child: const Text("Already have an account? Sign in"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateInputs() {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String bloodGroup = bloodGroupController.text.trim();
    String age = ageController.text.trim();
    String gender = genderController.text.trim();
    String weight = weightController.text.trim();
    String height = heightController.text.trim();

    if (name.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        bloodGroup.isNotEmpty &&
        age.isNotEmpty &&
        gender.isNotEmpty &&
        weight.isNotEmpty &&
        height.isNotEmpty) {
      if (GetUtils.isEmail(email)) {
        return true;
      }
    }
    return false;
  }
}
