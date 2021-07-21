import 'dart:convert';
import 'package:flutter/material.dart';

import '../models/member.dart' as member;
import '../mock.dart' as mockJson;

class Members with ChangeNotifier {
  List<member.Member> memberList = [];

  Members() {
    this.refresh();
  }

  Future<List<member.Member>> _loadMock() async {
    Map<String, dynamic> memberMap = await jsonDecode(mockJson.members);

    List<member.Member> memberObjList = [];
    for (var mem in memberMap["members"]) {
      memberObjList.add(member.Member(mem["name"], mem["age"], mem["job"]));
    }
    return memberObjList;
  }

  void refresh() {
    _loadMock().then((memberObjList) {
      this.memberList = memberObjList;
      notifyListeners();
    });
  }

  void setNameFilterdMembers(String name) {
    var membersObj = this.memberList;
    this.memberList =
        membersObj.where((element) => element.name.contains(name)).toList();
    notifyListeners();
  }

  void setAgeFilterdMembers(String age) {
    var membersObj = this.memberList;
    this.memberList = membersObj
        .where((element) => element.age.toString().contains(age))
        .toList();
    notifyListeners();
  }

  void setJobFilterdMembers(String job) {
    var membersObj = this.memberList;
    this.memberList =
        membersObj.where((element) => element.job.contains(job)).toList();
    notifyListeners();
  }
}
