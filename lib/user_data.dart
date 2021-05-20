import 'package:flutter/material.dart';
import 'package:dropdown_date_picker/dropdown_date_picker.dart';
import 'helpers/shareded_prefs_utils.dart';

class UserData extends StatefulWidget {
  const UserData({Key key, this.clicks}) : super(key: key);
  final int clicks;
  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();

  String birthdate = "";
  void readUserData() {
    MySharedPreferences.instance
        .getStringValue("birthdate")
        .then((value) => setState(() {
              print(value.replaceAll('-', ''));
              birthdate = value;
            }));

    MySharedPreferences.instance
        .getStringValue("birthdate")
        .then((value) => setState(() {
              if (value != null) {
                //TODO: set currentdate for datefield
                birthdateController.text = value;
              }
            }));
    MySharedPreferences.instance
        .getStringValue("name")
        .then((value) => setState(() {
              nameController.text = value;
            }));
    MySharedPreferences.instance
        .getStringValue("email")
        .then((value) => setState(() {
              emailController.text = value;
            }));
  }

  void initState() {
    super.initState();
    readUserData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('User data'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your name',
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your emailaddress',
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextField(
                  onTap: () async {
                    var date = await showDatePicker(
                        context: context,
                        initialDate:
                            DateTime.parse(birthdate) ?? DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));
                    birthdateController.text = date.toString().substring(0, 10);
                  },
                  controller: birthdateController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your birthdate',
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text('Number of clicks: ${widget.clicks}'),
                IconButton(
                  onPressed: () {
                    MySharedPreferences.instance
                        .setStringValue("birthdate", birthdateController.text);
                    MySharedPreferences.instance
                        .setStringValue("name", nameController.text);
                    MySharedPreferences.instance
                        .setStringValue("email", emailController.text);
                  },
                  icon: Icon(Icons.save),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
