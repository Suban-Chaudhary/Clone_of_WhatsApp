import 'package:flutter/material.dart';

class ChatListViewModel {
  String uid;
  String name;
  String profilePhoto;
  String lastMessage;
  String lastMessageDate;
  bool isPinned;

  ChatListViewModel({
    this.isPinned,
    @required this.uid,
    @required this.name,
    @required this.profilePhoto,
    @required this.lastMessage,
    this.lastMessageDate,
  });

  Map toMap(){
    Map modelMap = Map<String, dynamic>();
    modelMap['uid'] = this.uid;
    modelMap['name'] = this.name;
    modelMap['profilePhoto'] = this.profilePhoto;
    modelMap['lastMessage'] = this.lastMessage;
    modelMap['lastMessageDate'] = this.lastMessageDate;
    modelMap['isPinned'] = this.isPinned;
    return modelMap;
  }

  ChatListViewModel.fromMap(Map<String, dynamic> map){
    this.uid = map['uid'];
    this.name = map['name'];
    this.profilePhoto = map['profilePhoto'];
    this.lastMessage = map['lastMessage'];
    this.lastMessageDate = map['lastMessageDate'];
    this.isPinned = map['isPinned'];
  }
}
