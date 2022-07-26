import 'package:flutter/material.dart';
import 'package:starter/Pages/services/profiledata.dart';

class ProfileChange extends StatefulWidget {
  const ProfileChange({Key? key}) : super(key: key);

  @override
  State<ProfileChange> createState() => _ProfileChangeState();
}

class _ProfileChangeState extends State<ProfileChange> {
  late TextEditingController _controller1;
  late TextEditingController _controller2;

  /// Function to initiate `TextEditiingController`
  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
  }

  /// Function to remove controller after finished use
  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var pd = ModalRoute.of(context)!.settings.arguments as ProfileData;
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
                  controller: _controller1,
                  onFieldSubmitted: (String value) {},
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "First name",
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                  controller: _controller2,
                  onFieldSubmitted: (String value) {},
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Last name",
                  )),
            ),
            ElevatedButton(
              onPressed: () {
                pd.changeFirstName(_controller1.text);
                pd.changeLastName(_controller2.text);
                Navigator.pop(context);
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
