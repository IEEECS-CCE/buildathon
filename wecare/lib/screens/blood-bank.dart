import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import 'package:wecare/main.dart';
import 'package:wecare/screens/request-blood.dart';
import 'package:wecare/services/firebase_services.dart';
import 'package:wecare/services/local_notification.dart';


class BloodBank extends StatelessWidget {
  final FirebaseFirestore _firestore = FirestoreService.instance;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Bank'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _firestore.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error fetching data'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final document = snapshot.data!.docs[index];
               

                if(document['blood group'].toString() == 'O+')  {

                  String name = document['name'].toString();
             LocalNotification.showBigTextNotification(
                title: "Someone needs your help",
                body: "$name need 0+ blood",
                flutterLocalNotificationsPlugin:
                    flutterLocalNotificationsPlugin);
          }

          print(document['blood group'].toString() == 'O+');

                return ListTile(
                  title: Text(document['name']
                      .toString()), // Using the name from the list
                  subtitle: Text(document['blood group'].toString()), // Using the blood group from the list
                  trailing: ElevatedButton(
                    onPressed: () {
                      // Handle donate button press
                    },
                    child: const Text('Donate',
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent, // Background color
                      // shape: CircleBorder(),
                      padding: const EdgeInsets.all(
                          15), // Padding between icon and circle
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.off(()=> RequestBlood()),
        label: Text('Request'),
        icon: Icon(Icons.water_drop),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
