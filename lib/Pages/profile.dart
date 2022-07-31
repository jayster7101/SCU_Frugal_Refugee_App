import 'package:flutter/material.dart';
import 'package:starter/Pages/services/camera.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'package:starter/Pages/services/profilechange.dart';
import 'dart:io';
import 'services/profiledata.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<String> tags = [];
  ProfileData pd = ProfileData();
  bool _isLoading = true;

  /// Function to remove tags
  void _onDelete(index) {
    setState(() {
      tags.removeAt(index);
      pd.changeTags(tags);
      pd.writeFile();
    });
  }
  @override
  void initState(){
    super.initState();
    pd.loadClass().then((value){
      setState(() {
        _isLoading = false;
        tags = pd.getTags();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 12.0),
            if (_isLoading)...[
              const Padding(
                padding: EdgeInsets.fromLTRB(179, 0, 179, 0),
                child: CircularProgressIndicator(),
              )
            ]
            else ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (pd.getLastName() == "") ...[
                    Text(pd.getFirstName(), style: const TextStyle(fontSize: 35)),
                  ]
                  else ... [
                    Text(pd.getFirstName(), style: const TextStyle(fontSize: 35)),
                    const SizedBox(width: 10),
                    Text(pd.getLastName(), style: const TextStyle(fontSize: 35)),
                  ]
                ],
              ),
              if (pd.getImage() == " ") ... []
              else ... [
                Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
                child: SizedBox(
                  child: Image.file(
                      File(pd.getImage()),
                      fit: BoxFit.fill,
                    ),
                ),
              ),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
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
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Camera(),
                                  settings: RouteSettings(arguments: pd)))
                          .then((value) {
                        setState(() {});
                      });
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.camera),
                        Text("Change Picture"),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(pd.getGender(), style: const TextStyle(fontSize: 25)),
                  Text(pd.getBirthday(), style: const TextStyle(fontSize: 25)),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TagEditor(
                      length: tags.length,
                      delimiters: const[',', ' '],
                      hasAddButton: true,
                      inputDecoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Add Medical Conditions...',
                      ),
                      onTagChanged: (newValue) {
                        setState(() {
                          tags.add(newValue);
                          pd.changeTags(tags);
                          pd.writeFile();
                        });
                      },
                      tagBuilder: (context, index) => _Chip(
                        index: index,
                        label: tags[index],
                        onDeleted: _onDelete,
                      ),
                    ),
                  ),
                ]
              )
            ]
          ],
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: const Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}