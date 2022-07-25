import 'package:flutter/material.dart';

class ProfileChange extends StatefulWidget {
  const ProfileChange({Key? key}) : super(key: key);

  @override
  State<ProfileChange> createState() => _ProfileChangeState();
}

class _ProfileChangeState extends State<ProfileChange> {
  late TextEditingController _controller;
  /// Function to initiate `TextEditiingController`
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }
  /// Function to remove controller after finished use
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: _controller,
                onFieldSubmitted: (String value){

                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "First name",
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: _controller,
                onFieldSubmitted: (String value){
                  
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Last name",
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}