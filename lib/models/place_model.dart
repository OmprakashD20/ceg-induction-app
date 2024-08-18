import 'dart:convert';

import 'package:equatable/equatable.dart';

class PlaceModel extends Equatable {
  final String name;
  final String desc;
  final String imageUrl;
  final String mapLink;

  const PlaceModel({
    required this.name,
    required this.desc,
    required this.imageUrl,
    required this.mapLink,
  });

  PlaceModel copyWith({
    String? name,
    String? desc,
    String? imageUrl,
    String? mapLink,
  }) {
    return PlaceModel(
      name: name ?? this.name,
      desc: desc ?? this.desc,
      imageUrl: imageUrl ?? this.imageUrl,
      mapLink: mapLink ?? this.mapLink,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'desc': desc,
      'imageUrl': imageUrl,
      'mapLink': mapLink,
    };
  }

  factory PlaceModel.fromMap(Map<String, dynamic> map) {
    return PlaceModel(
      name: map['name'] as String,
      desc: map['desc'] as String,
      imageUrl: map['imageUrl'] as String,
      mapLink: map['mapLink'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaceModel.fromJson(String source) =>
      PlaceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [name, desc, imageUrl, mapLink];
}
