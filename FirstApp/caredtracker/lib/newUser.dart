import 'package:flutter/material.dart';

class newUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: 'hind'),
          // Add other text styles as needed
        ),
      ),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.0), // Adjust the height as needed
          child: AppBar(
            flexibleSpace: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ProfileSelectionPage(),
      ),
    );
  }
}

class ProfileSelectionPage extends StatefulWidget {
  @override
  _ProfileSelectionPageState createState() => _ProfileSelectionPageState();
}

class _ProfileSelectionPageState extends State<ProfileSelectionPage> {
  String _name = '';
  String _serial = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/images/4.jpg'), // Replace with your profile image
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'ชื่อ',
                    hintText: 'ใส่ชื่อของบุคคล',
                    hintStyle: TextStyle(fontFamily: 'hind')),
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
            ),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'รหัสของกำไร ',
                    hintText: 'ใส่รหัสของกำไร',
                    hintStyle: TextStyle(fontFamily: 'hind')),
                onChanged: (value) {
                  setState(() {
                    _serial = value;
                  });
                },
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Perform actions when Finish button is pressed
                // For example, you can navigate to the next page or save the data
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 48, 162,
                    255), // Change the background color of the button
                onPrimary: Colors.white, // Change the text color of the button
                textStyle: TextStyle(
                  fontFamily:
                      'hind', // Change the font family of the button text
                ),
              ),
              child: Text(
                'เสร็จสิ้น',
                style: TextStyle(
                  fontSize: 16, // Change the font size of the button text
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
