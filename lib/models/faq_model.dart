import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class FAQModel extends Equatable {
  final String question;
  final String answer;
  bool isExpanded;

  FAQModel({
    required this.question,
    required this.answer,
    this.isExpanded = false,
  });

  FAQModel copyWith({
    String? question,
    String? answer,
    bool? isExpanded,
  }) {
    return FAQModel(
      question: question ?? this.question,
      answer: answer ?? this.answer,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'answer': answer, 
    };
  }

  factory FAQModel.fromMap(Map<String, dynamic> map) {
    return FAQModel(
      question: map['question'] as String,
      answer: map['answer'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FAQModel.fromJson(String source) =>
      FAQModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [question, answer, isExpanded];
}
