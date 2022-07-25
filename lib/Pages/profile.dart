import 'package:flutter/material.dart';
import 'package:starter/Pages/services/profilechange.dart';
import 'services/profiledata.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

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
            Row(
              children: [
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
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const ProfileChange(),
                    ));
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.edit),
                      Text("Edit"),
                    ],
                  ),
                ),
                Text(pd.getFirstName()),
                Text(pd.getLastName()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}