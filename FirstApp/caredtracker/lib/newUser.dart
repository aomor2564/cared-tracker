import 'package:flutter/material.dart';

class newUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileSelectionPage();
  }
}

class ProfileSelectionPage extends StatefulWidget {
  @override
  _ProfileSelectionPageState createState() => _ProfileSelectionPageState();
}

class _ProfileSelectionPageState extends State<ProfileSelectionPage> {
  String selectedGender = '';
  String name = '';
  // You can define other necessary variables here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Selection'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile Picture selection (you can use any image picker plugin)
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // Placeholder image
              // onTap: () {
              //   // Implement logic to select profile picture
              // },
            ),
            SizedBox(height: 20),
            // Name input
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            // Finish Button
            ElevatedButton(
              onPressed: () {
                // Logic to handle finish button click
                // You can use the values of name, selectedGender, etc. here
                // For example, you can navigate to another page or perform any other action
              },
              child: Text('Finish'),
            ),
          ],
        ),
      ),
    );
  }
}
