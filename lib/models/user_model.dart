import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String name;
  final String branch;
  final String dept;
  final String batchId;
  final String dob;
  final String rollNo;
  final String gender;

  const UserModel({
    required this.name,
    required this.branch,
    required this.dept,
    required this.batchId,
    required this.dob,
    required this.rollNo,
    required this.gender,
  });

  UserModel copyWith({
    String? name,
    String? branch,
    String? dept,
    String? batchId,
    String? dob,
    String? rollNo,
    String? gender,
  }) {
    return UserModel(
      name: name ?? this.name,
      branch: branch ?? this.branch,
      dept: dept ?? this.dept,
      batchId: batchId ?? this.batchId,
      dob: dob ?? this.dob,
      rollNo: rollNo ?? this.rollNo,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'branch': branch,
      'dept': dept,
      'batchId': batchId,
      'dob': dob,
      'rollNo': rollNo,
      'gender': gender,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      branch: map['branch'] as String,
      dept: map['dept'] as String,
      batchId: map['batchId'] as String,
      dob: map['dob'] as String,
      rollNo: map['rollNo'] as String,
      gender: map['gender'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserModel get empty => const UserModel(
        name: '',
        branch: '',
        dept: '',
        batchId: '',
        dob: '',
        rollNo: '',
        gender: '',
      );

  factory UserModel.empty() {
    return const UserModel(
      name: '',
      branch: '',
      dept: '',
      batchId: '',
      dob: '',
      rollNo: '',
      gender: '',
    );
  }

  @override
  List<Object?> get props => [name, branch, dept, batchId, dob, rollNo, gender];
}
