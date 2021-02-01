import 'dart:convert';

import 'package:cleanArchitecture/modules/search/domain/entities/result_search.dart';

class ResultSearchModel implements ResultSearch {
  final String title;
  final int content;
  final String img;
  ResultSearchModel({
    this.title,
    this.content,
    this.img,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'img': img,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ResultSearchModel(
      title: map['login'],
      content: map['id'],
      img: map['avatar_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) =>
      ResultSearchModel.fromMap(json.decode(source));
}
