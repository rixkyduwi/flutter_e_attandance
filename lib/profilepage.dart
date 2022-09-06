import 'package:flutter/material.dart';
import 'package:flutter_e_attandance/main.dart';
import 'package:flutter_e_attandance/model/login_model.dart';
import 'package:flutter_e_attandance/services/api_service.dart';
import 'package:flutter_e_attandance/model/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.token}) : super(key: key);
  final String token;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  DataLogin? profile;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    profile = (await ApiService().getProfile(widget.token))!;
    Future.delayed(const Duration(seconds: 3)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  verticalDirection: VerticalDirection.up,
                  children: [
                    Text(profile!.nip),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  verticalDirection: VerticalDirection.up,
                  children: [
                    Text(profile!.nama),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  verticalDirection: VerticalDirection.up,
                  children: [
                    Text(profile!.no_hp),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  verticalDirection: VerticalDirection.up,
                  children: [
                    Text(profile!.gender),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  verticalDirection: VerticalDirection.up,
                  children: [
                    Text(profile!.posisi),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  verticalDirection: VerticalDirection.up,
                  children: [
                    Text(profile!.ttl),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  verticalDirection: VerticalDirection.up,
                  children: [
                    Text(profile!.alamat),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  verticalDirection: VerticalDirection.up,
                  children: [
                    Text(profile!.email),
                  ],
                ),
                ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(
                        255, 199, 122, 6), //background color of button
                    // side: BorderSide(width:3, color:Colors.brown), //border width and color
                    elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(10) //content padding inside button

                    ),
                onPressed: () {
                  const MyApp();
                },
                child: Text("Logout")),
              ],
            ),
          );
  }
}
