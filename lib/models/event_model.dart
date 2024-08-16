import 'dart:convert';

import 'package:equatable/equatable.dart';

class EventModel extends Equatable {
  final String name;
  final String desc;
  final List<Contact> contacts;

  const EventModel(
      {required this.name, required this.desc, required this.contacts});

  EventModel copyWith({
    String? name,
    String? desc,
    List<Contact>? contacts,
  }) {
    return EventModel(
      name: name ?? this.name,
      desc: desc ?? this.desc,
      contacts: contacts ?? this.contacts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'desc': desc,
      'contacts': contacts.map((x) => x.toMap()).toList(),
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      name: map['name'] as String,
      desc: map['desc'] as String,
      contacts: List<Contact>.from(
        (map['contacts']).map<Contact>(
          (x) => Contact.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [name, desc, contacts];
}

class Contact extends Equatable {
  final String name;
  final String mobile;

  const Contact({required this.name, required this.mobile});

  Contact copyWith({
    String? name,
    String? mobile,
  }) {
    return Contact(
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'mobile': mobile,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      name: map['name'] as String,
      mobile: map['mobile'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) =>
      Contact.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [name, mobile];
}
