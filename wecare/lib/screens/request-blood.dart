import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wecare/services/firebase_services.dart';
import 'package:wecare/widgets/bloodgroup_dropdown.dart';

class RequestBlood extends StatelessWidget {
  RequestBlood({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController hospitalController = TextEditingController();
  String? selectedBloodGroup; 
  final FirebaseFirestore _firestore = FirestoreService.instance;

  final CollectionReference users = FirestoreService.instance.collection('users');

  
  @override
  Widget build(BuildContext context) {

    bool validateData() {
      if (nameController.text.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Name is required')));
        return false;
      }
      if (ageController.text.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Age is required')));
        return false;
      }
      if (phoneController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Phone number is required')));
        return false;
      }
      if (addressController.text.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Address is required')));
        return false;
      }
      if (hospitalController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Hospital is required')));
        return false;
      }
      if (selectedBloodGroup!.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Phone number is required')));
        return false;
      }
      return true;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter the donor's details"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTextFeild(
                    placeHolder: 'Name', controller: nameController),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFeild(placeHolder: 'Age', controller: ageController),
                const SizedBox(
                  height: 30,
                ),
                BloodGroupDropdown(
                  selectedBloodGroup: selectedBloodGroup,
                  onChanged: (value) {
                    selectedBloodGroup = value;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFeild(
                    placeHolder: 'Phone Number', controller: phoneController),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFeild(
                    placeHolder: 'Address', controller: addressController),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFeild(
                    placeHolder: 'Hospital', controller: hospitalController),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (validateData()) {
                      users
                          .add({
                            'name': nameController.text,
                            'age': ageController.text,
                            'phone': phoneController.text,
                            'address': addressController.text,
                            'hospital': hospitalController.text,
                            'blood group': selectedBloodGroup
                          })
                          .then((value) => {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Data submitted successfully')),
                                ),
                                nameController.clear(),
                                ageController.clear(),
                                phoneController.clear(),
                                addressController.clear(),
                                hospitalController.clear(),
                                selectedBloodGroup = ''
                              })
                          .catchError((error) => {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Error: $error')),
                                ),
                              });
                    }
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
  CustomTextFeild({required this.placeHolder, required this.controller});

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
