// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  List<Source> sources;

  CategoryModel({required this.sources});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    sources: List<Source>.from(json["sources"].map((x) => Source.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "sources": List<dynamic>.from(sources.map((x) => x.toJson())),
  };
}

class Source {
  String id;
  String name;
  String description;
  String url;
  String category;
  String language;
  String country;

  Source({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    url: json["url"],
    category: json["category"],
    language: json["language"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "url": url,
    "category": category,
    "language": language,
    "country": country,
  };
}
