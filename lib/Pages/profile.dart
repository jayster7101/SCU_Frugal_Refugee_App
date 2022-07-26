import 'package:flutter/material.dart';
import 'package:starter/Pages/services/profilechange.dart';
import 'services/profiledata.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

@override
void initState() {}

class _ProfileState extends State<Profile> {
  ProfileData pd = ProfileData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 12.0),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: FileImage(pd.getImage()),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(150.0, 8.0, 150.0, 8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileChange(),
                              settings: RouteSettings(arguments: pd)))
                      .then((value) {
                    setState(() {});
                  });
                },
                child: Row(
                  children: const [
                    Icon(Icons.edit),
                    Text("Edit"),
                  ],
                ),
              ),
            ),
            Text(pd.getFirstName()),
            Text(pd.getLastName()),
          ],
        ),
      ),
    );
  }
}
