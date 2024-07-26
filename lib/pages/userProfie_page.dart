import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_application/components/custom_alert.dart';
import 'package:e_commerce_application/components/text_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //user
  final currentUser = FirebaseAuth.instance.currentUser!;

  //edit field
  Future<void> editField(String field) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(currentUser.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;

              return ListView(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  //profile pic
                  const Icon(
                    Icons.person,
                    size: 72,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //user email
                  Text(
                    currentUser.email!,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[700]),
                  ),

                  //user details
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      'My details',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),

                  //username
                  MyTextBox(
                    text: userData['userName'],
                    sectionName: 'username',
                    onPressed: () => editField('username'),
                  ),

                  //firstName
                  MyTextBox(
                    text: userData['firstName'],
                    sectionName: 'firstName',
                    onPressed: () => editField('firstName'),
                  ),

                  //lastName
                  MyTextBox(
                    text: userData['lastName'],
                    sectionName: 'lastName',
                    onPressed: () => editField('lastName'),
                  ),

                  //mobile no
                  MyTextBox(
                    text: 'xxxxxxxxxx',
                    sectionName: 'mobile',
                    onPressed: () => editField('mobile'),
                  ),

                  //address
                  MyTextBox(
                    text: 'address',
                    sectionName: 'address',
                    onPressed: () => editField('address'),
                  ),
                ],
              );
            } else if(snapshot.hasError) {
              customAlert(context, snapshot.error.toString(), 'something wrong happened');
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          
        ));
  }
}
