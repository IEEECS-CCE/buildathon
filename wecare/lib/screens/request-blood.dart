import 'package:flutter/material.dart';

class RequestBlood extends StatelessWidget {
  RequestBlood({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController hospitalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Enter the donor's details"),),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTextFeild(placeHolder: 'Name', controller: nameController),
                const SizedBox(height: 30,), 
                CustomTextFeild(placeHolder: 'Age', controller: ageController),
                const SizedBox(height: 30,), 
                CustomTextFeild(placeHolder: 'Phone Number', controller: phoneController),
                const SizedBox(height: 30,), 
                CustomTextFeild(placeHolder: 'Address', controller: addressController),
                const SizedBox(height: 30,), 
                CustomTextFeild(placeHolder: 'Hospital', controller: hospitalController),
                const SizedBox(height: 30,), 
              ElevatedButton(
                onPressed: () {
                  // Handle submit button press
                },
                child: const Text('Submit'),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class CustomTextFeild extends StatelessWidget {
  final String placeHolder;
  final TextEditingController controller;
  CustomTextFeild({ required this.placeHolder, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: placeHolder,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
