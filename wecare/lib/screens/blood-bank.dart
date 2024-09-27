import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import 'package:wecare/screens/request-blood.dart';
import 'package:wecare/services/firebase_services.dart';

// class BloodBank extends StatelessWidget {
//    BloodBank({super.key});

//   final List<Map<String, String>> names = [
//     {'name': 'John Doe', 'blood group': 'A+'},
//     {'name': 'Jane Smith', 'blood group': 'B-'},
//     {'name': 'Michael Johnson', 'blood group': 'O+'},
//     {'name': 'Emily Williams', 'blood group': 'AB-'},
//     {'name': 'William Brown', 'blood group': 'A-'},
//     {'name': 'Hannah Davis', 'blood group': 'B+'},
//     {'name': 'James Miller', 'blood group': 'O-'},
//     {'name': 'Sarah Taylor', 'blood group': 'AB+'},
//     {'name': 'Robert Wilson', 'blood group': 'A+'},
//     {'name': 'Jessica Anderson', 'blood group': 'B-'},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Blood Bank'),
//         centerTitle: true,
//         backgroundColor: Colors.redAccent,
//         elevation: 0.0,
//       ),
//       body: SafeArea(
//         child: ListView.separated(
//           itemCount: names.length, // Using the length of the names list
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(names[index]['name'].toString()), // Using the name from the list
//               subtitle: Text(names[index]['blood group'].toString()), // Using the blood group from the list
//               trailing: ElevatedButton(
//                 onPressed: () {
//                   // Handle donate button press
//                 },
//                 child: const Text('Donate', style: TextStyle(color: Colors.white)),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.redAccent, // Background color
//                   // shape: CircleBorder(),
//                   padding: const EdgeInsets.all(15), // Padding between icon and circle
//                 ),
//               ),
//             );
//           },
//           separatorBuilder: (context, index) {
//             return const Divider();
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () => Get.off(()=> RequestBlood()),
//         label: Text('Request'),
//         icon: Icon(Icons.water_drop),
//         backgroundColor: Colors.redAccent,
//       ),
//     );
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:wecare/services/firebase_services.dart';

class BloodBank extends StatelessWidget {
  final FirebaseFirestore _firestore = FirestoreService.instance;

  @override
  Widget build(BuildContext context) {
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
                // return ListTile(
                //   title: Text(document[
                //       'name']), // Replace 'name' with the actual field name
                // );

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
