// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.customCollections,
  });

  List<CustomCollection> customCollections;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        customCollections: List<CustomCollection>.from(
            json["custom_collections"]
                .map((x) => CustomCollection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "custom_collections":
            List<dynamic>.from(customCollections.map((x) => x.toJson())),
      };
}

class CustomCollection {
  CustomCollection({
    this.id,
    this.handle,
    this.updatedAt,
    this.publishedAt,
    this.sortOrder,
    this.templateSuffix,
    this.publishedScope,
    this.title,
    this.bodyHtml,
    this.adminGraphqlApiId,
    this.image,
  });

  int id;
  String handle;
  DateTime updatedAt;
  DateTime publishedAt;
  String sortOrder;
  String templateSuffix;
  String publishedScope;
  String title;
  String bodyHtml;
  String adminGraphqlApiId;
  Image image;

  factory CustomCollection.fromJson(Map<String, dynamic> json) =>
      CustomCollection(
        id: json["id"],
        handle: json["handle"],
        updatedAt: DateTime.parse(json["updated_at"]),
        publishedAt: DateTime.parse(json["published_at"]),
        sortOrder: json["sort_order"],
        templateSuffix: json["template_suffix"],
        publishedScope: json["published_scope"],
        title: json["title"],
        bodyHtml: json["body_html"],
        adminGraphqlApiId: json["admin_graphql_api_id"],
        image: Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "handle": handle,
        "updated_at": updatedAt.toIso8601String(),
        "published_at": publishedAt.toIso8601String(),
        "sort_order": sortOrder,
        "template_suffix": templateSuffix,
        "published_scope": publishedScope,
        "title": title,
        "body_html": bodyHtml,
        "admin_graphql_api_id": adminGraphqlApiId,
        "image": image.toJson(),
      };
}

class Image {
  Image({
    this.createdAt,
    this.alt,
    this.width,
    this.height,
    this.src,
  });

  DateTime createdAt;
  dynamic alt;
  int width;
  int height;
  String src;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        createdAt: DateTime.parse(json["created_at"]),
        alt: json["alt"],
        width: json["width"],
        height: json["height"],
        src: json["src"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "alt": alt,
        "width": width,
        "height": height,
        "src": src,
      };
}
