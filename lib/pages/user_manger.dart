import 'package:flutter/material.dart';
import 'package:school_app_desktop/components/app_bar.dart';

class AdminManagementPage extends StatefulWidget {
  @override
  _AdminManagementPageState createState() => _AdminManagementPageState();
}

class _AdminManagementPageState extends State<AdminManagementPage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  // List<Map<String, dynamic>> _users = [];
  List<Map<String, dynamic>> _users = [
  {
    'name': 'Alice Johnson',
    'email': 'alice@example.com',
    'permissions': ['View', 'Edit']
  },
  {
    'name': 'Bob Williams',
    'email': 'bob@example.com',
    'permissions': ['View', 'Delete', 'Admin']
  },
  {
    'name': 'Catherine Lee',
    'email': 'catherine@example.com',
    'permissions': ['View']
  },
  {
    'name': 'David Brown',
    'email': 'david@example.com',
    'permissions': ['View', 'Edit', 'Delete']
  },
  {
    'name': 'Emily Davis',
    'email': 'emily@example.com',
    'permissions': ['Admin']
  },
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Admin Management"),
      body: _users.isEmpty
          ? Center(child: Text("No users available"))
          : AnimatedList(
              key: _listKey,
              initialItemCount: _users.length,
              itemBuilder: (context, index, animation) {
                return _buildListItem(_users[index], index, animation);
              },
            ),
    );
  }

  Widget _buildListItem(Map<String, dynamic> user, int index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        title: Text(user['name']),
        subtitle: Text(user['email']),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                _showEditPermissionsDialog(user);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _removeUser(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showAddUserDialog() {
    String name = "";
    String email = "";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add User"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Name"),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: "Email"),
                onChanged: (value) {
                  email = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("Add"),
              onPressed: () {
                if (name.isNotEmpty && email.isNotEmpty) {
                  _addUser(name, email);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _addUser(String name, String email) {
    final user = {'name': name, 'email': email, 'permissions': []};
    _users.insert(0, user); // Add user at the beginning of the list
    _listKey.currentState?.insertItem(0, duration: Duration(milliseconds: 300));
  }

  void _removeUser(int index) {
    final removedUser = _users[index];
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => _buildListItem(removedUser, index, animation),
      duration: Duration(milliseconds: 300),
    );
    _users.removeAt(index);
  }

  void _showEditPermissionsDialog(Map<String, dynamic> user) {
    List<String> allPermissions = ['View', 'Edit', 'Delete', 'Admin'];
    List<String> selectedPermissions = List.from(user['permissions']);

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Edit Permissions for ${user['name']}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ...allPermissions.map((permission) {
                return CheckboxListTile(
                  title: Text(permission),
                  value: selectedPermissions.contains(permission),
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        selectedPermissions.add(permission);
                      } else {
                        selectedPermissions.remove(permission);
                      }
                    });
                  },
                );
              }).toList(),
              ElevatedButton(
                child: Text("Save"),
                onPressed: () {
                  setState(() {
                    user['permissions'] = selectedPermissions;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
