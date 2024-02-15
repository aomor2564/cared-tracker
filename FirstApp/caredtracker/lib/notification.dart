import 'package:flutter/material.dart';

// Data model for a notification
class NotificationModel {
  final int id;
  final String title;
  final String body;
  final DateTime scheduledTime;

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.scheduledTime,
  });
}

class NotificationListPage extends StatefulWidget {
  @override
  _NotificationListPageState createState() => _NotificationListPageState();
}

class _NotificationListPageState extends State<NotificationListPage> {
  List<NotificationModel> notifications = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification List'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(notifications[index].title),
              subtitle: Text(notifications[index].body),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Remove notification from the list when delete icon is pressed
                  setState(() {
                    notifications.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add a new notification to the list
          setState(() {
            notifications.add(NotificationModel(
              id: notifications.length + 1,
              title: 'New Notification',
              body: 'This is a new notification',
              scheduledTime: DateTime.now(),
            ));
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NotificationListPage(),
  ));
}
