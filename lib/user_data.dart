import 'package:flutter/material.dart';
import 'package:dropdown_date_picker/dropdown_date_picker.dart';

class UserData extends StatefulWidget {
  const UserData({Key key}) : super(key: key);

  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  TextEditingController nameController = TextEditingController();
  DropdownDatePicker datePicker = DropdownDatePicker(
    firstDate: ValidDate(year: DateTime.now().year - 100, month: 1, day: 1),
    lastDate: ValidDate(
        year: DateTime.now().year,
        month: DateTime.now().month,
        day: DateTime.now().day),
    dateFormat: DateFormat.dmy,
    dateHint: DateHint(year: 'year', month: 'month', day: 'day'),
    dropdownColor: Colors.red,

  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('User data'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your name',
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your emailaddress',
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Birthdate',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                datePicker,
                //

                SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          )),
    );
  }
}
