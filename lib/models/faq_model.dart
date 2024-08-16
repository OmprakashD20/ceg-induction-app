import 'dart:convert';

import 'package:equatable/equatable.dart';

class FAQModel extends Equatable {
  final String question;
  final String answer;

  const FAQModel({
    required this.question,
    required this.answer,
  });

  FAQModel copyWith({
    String? question,
    String? answer,
  }) {
    return FAQModel(
      question: question ?? this.question,
      answer: answer ?? this.answer,
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
  List<Object> get props => [question, answer];
}
