import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up/app/modules/profile/components/tabs.dart';
import 'package:up/app/modules/profile/profile_store.dart';
import 'package:flutter/material.dart';

import 'components/profile_card.dart';
import 'edit/edit_store.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  const ProfilePage({Key? key, this.title = 'ProfilePage'}) : super(key: key);
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final ProfileStore store = Modular.get();
  final EditStore eStore = Modular.get();
  @override
  void initState() {
    eStore.recoverDataFromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: LayoutBuilder(builder: (_, constraints) {
                return SingleChildScrollView(
                  child: Column(
                    children: [ProfileCard(), GalleryTabs()],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
