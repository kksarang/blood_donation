import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gradient_button.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final bloodGroup = ['A +', 'A -', 'B +', 'B -', 'AB +', 'AB -', 'O +', 'O -'];

  String? selectedGroup;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Add Donors",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          const Icon(
            Icons.bloodtype_sharp,
            color: Colors.red,
            size: 200,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
            child: TextField(
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Donor Name")),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              maxLength: 10,
              decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Donor Number")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: DropdownButtonFormField(
              borderRadius: BorderRadius.circular(14),
              decoration: InputDecoration(label: Text("Select Blood Group")),
              items: bloodGroup
                  .map((e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              onChanged: (val) {
                selectedGroup = val as String?;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13.0, right: 13.0, top: 30.0),
            child: GradientButton(
              isDisabled: false,
              child: const Center(
                  child: Text(
                "Add Donor",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.white),
              )),
            ),
          )
        ],
      ),
    );
  }
}
