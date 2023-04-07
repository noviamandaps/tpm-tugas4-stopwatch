import 'package:flutter/material.dart';

class MemberListPage extends StatelessWidget {
  final List<Map<String, String>> _members = [
    {
      'name': 'John Doe',
      'position': 'CEO',
      'avatar': 'https://picsum.photos/200',
    },
    {
      'name': 'Jane Doe',
      'position': 'CTO',
      'avatar': 'https://picsum.photos/200',
    },
    {
      'name': 'Bob Smith',
      'position': 'Developer',
      'avatar': 'https://picsum.photos/200',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member List'),
      ),
      body: ListView.builder(
        itemCount: _members.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2.0,
              ),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(_members[index]['avatar']!),
              ),
              title: Text(_members[index]['name']!),
              subtitle: Text(_members[index]['position']!),
            ),
          );
        },
      ),
    );
  }
}
