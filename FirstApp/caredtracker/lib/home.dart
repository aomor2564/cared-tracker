import 'package:flutter/material.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(fontFamily: 'hind'),
          // Add other text styles as needed
        ),
      ),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.0), // Adjust the height as needed
          child: AppBar(
            title: Container(
              padding: EdgeInsets.only(
                  top: 13), // Adjust the top padding to move the title down
            ),
            flexibleSpace: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/aom.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ContainerPage(),
      ),
    );
  }
}

class ContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FutureBuilder<String>(
            future: fetchDataFromCloud(
                'heart_rate'), // Replace 'heart_rate' with appropriate key for heart rate data
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return CustomContainer(
                  image: AssetImage('assets/images/1.png'),
                  label: snapshot.data ??
                      'No data', // Use fetched data or fallback to 'No data' if data is null
                );
              }
            },
          ),
          FutureBuilder<String>(
            future: fetchDataFromCloud(
                'oxygen_level'), // Replace 'oxygen_level' with appropriate key for oxygen level data
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return CustomContainer(
                  image: AssetImage('assets/images/2.png'),
                  label: snapshot.data ??
                      'No data', // Use fetched data or fallback to 'No data' if data is null
                );
              }
            },
          ),
          FutureBuilder<String>(
            future: fetchDataFromCloud(
                'body_temperature'), // Replace 'body_temperature' with appropriate key for body temperature data
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return CustomContainer(
                  image: AssetImage('assets/images/3.jpg'),
                  label: snapshot.data ??
                      'No data', // Use fetched data or fallback to 'No data' if data is null
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final ImageProvider image;
  final String label;

  const CustomContainer({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                label,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 137, 199, 250)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// This is a mock function for fetching data from the cloud.
// Replace it with your actual function to fetch data.
Future<String> fetchDataFromCloud(String dataType) async {
  // Simulate fetching data from the cloud with some delay
  await Future.delayed(Duration(seconds: 2));

  // In a real app, replace this with actual data fetching logic
  // For demonstration purposes, return some dummy data based on the dataType
  switch (dataType) {
    case 'heart_rate':
      return 'อัตรการเต้นของหัวใจ : ' + '\n' + '         80 bpm';
    case 'oxygen_level':
      return 'ระดับออกซิเจนในโลหิต : ' + '\n' + '         98 %';
    case 'body_temperature':
      return 'อุณภูมิร่างกาย : ' + '\n' + '         36.5°C';
    default:
      return 'No data';
  }
}
