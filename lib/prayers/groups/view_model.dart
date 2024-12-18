import 'package:flutter/material.dart';
import 'model.dart';

class GroupViewModel extends ChangeNotifier {
  final List<Group> _groups = [
    Group(
      id: 1,
      name: 'Group 1',
      description: 'This is the first group.',
      members: [
        User(id: 1, name: 'Alice Smith'),
        User(id: 2, name: 'Bob Johnson'),
      ],
    ),
    Group(
      id: 2,
      name: 'Group 2',
      description: 'This is the second group.',
      members: [
        User(id: 3, name: 'Charlie Brown'),
        User(id: 4, name: 'Daisy Miller'),
      ],
    ),
  ];

  List<Group> get groups => _groups;

  void addGroup(Group group) {
    _groups.add(group);
    notifyListeners();
  }

  void removeGroup(Group group) {
    _groups.remove(group);
    notifyListeners();
  }

  void addUserToGroup(Group group, User user) {
    group.members.add(user);
    notifyListeners();
  }
}