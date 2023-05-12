import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference donor = FirebaseFirestore.instance.collection('donor');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.person,
              color: Colors.black,
              size: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Icon(
              Icons.featured_play_list,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
        backgroundColor: Colors.white,
        title: const Text(
          "Blood Donation App",
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, '/add')},
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          size: 28,
        ),
      ),
      body: StreamBuilder(
        stream: donor.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot donorSnap = snapshot.data!.docs[index];
                return Text(donorSnap['name']);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
