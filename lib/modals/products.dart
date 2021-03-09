// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Products welcomeFromJson(String str) => Products.fromJson(json.decode(str));

String welcomeToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    this.products,
  });

  List<Product> products;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.id,
    this.title,
    this.productType,
    this.createdAt,
    this.handle,
    this.updatedAt,
    this.publishedAt,
    this.templateSuffix,
    this.status,
    this.publishedScope,
    this.tags,
    this.adminGraphqlApiId,
    this.variants,
    this.options,
    this.images,
  });

  int id;
  String title;
  String productType;
  DateTime createdAt;
  String handle;
  DateTime updatedAt;
  DateTime publishedAt;
  String templateSuffix;
  String status;
  String publishedScope;
  String tags;
  String adminGraphqlApiId;
  List<Variant> variants;
  List<Option> options;
  List<Image> images;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        productType: json["product_type"],
        createdAt: DateTime.parse(json["created_at"]),
        handle: json["handle"],
        updatedAt: DateTime.parse(json["updated_at"]),
        publishedAt: DateTime.parse(json["published_at"]),
        templateSuffix: json["template_suffix"],
        status: json["status"],
        publishedScope: json["published_scope"],
        tags: json["tags"],
        adminGraphqlApiId: json["admin_graphql_api_id"],
        variants: List<Variant>.from(
            json["variants"].map((x) => Variant.fromJson(x))),
        options:
            List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "product_type": productType,
        "created_at": createdAt.toIso8601String(),
        "handle": handle,
        "updated_at": updatedAt.toIso8601String(),
        "published_at": publishedAt.toIso8601String(),
        "template_suffix": templateSuffix,
        "status": status,
        "published_scope": publishedScope,
        "tags": tags,
        "admin_graphql_api_id": adminGraphqlApiId,
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Image {
  Image({
    this.id,
    this.productId,
    this.position,
    this.createdAt,
    this.updatedAt,
    this.alt,
    this.width,
    this.height,
    this.src,
    this.variantIds,
    this.adminGraphqlApiId,
  });

  int id;
  int productId;
  int position;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic alt;
  int width;
  int height;
  String src;
  List<dynamic> variantIds;
  String adminGraphqlApiId;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        productId: json["product_id"],
        position: json["position"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        alt: json["alt"],
        width: json["width"],
        height: json["height"],
        src: json["src"],
        variantIds: List<dynamic>.from(json["variant_ids"].map((x) => x)),
        adminGraphqlApiId: json["admin_graphql_api_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "position": position,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "alt": alt,
        "width": width,
        "height": height,
        "src": src,
        "variant_ids": List<dynamic>.from(variantIds.map((x) => x)),
        "admin_graphql_api_id": adminGraphqlApiId,
      };
}

class Option {
  Option({
    this.id,
    this.productId,
    this.name,
    this.position,
    this.values,
  });

  int id;
  int productId;
  String name;
  int position;
  List<String> values;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        productId: json["product_id"],
        name: json["name"],
        position: json["position"],
        values: List<String>.from(json["values"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "name": name,
        "position": position,
        "values": List<dynamic>.from(values.map((x) => x)),
      };
}

class Variant {
  Variant({
    this.id,
    this.productId,
    this.title,
    this.price,
    this.sku,
    this.position,
    this.inventoryPolicy,
    this.compareAtPrice,
    this.fulfillmentService,
    this.inventoryManagement,
    this.option1,
    this.option2,
    this.option3,
    this.createdAt,
    this.updatedAt,
    this.taxable,
    this.barcode,
    this.grams,
    this.imageId,
    this.weight,
    this.weightUnit,
    this.inventoryItemId,
    this.inventoryQuantity,
    this.oldInventoryQuantity,
    this.requiresShipping,
    this.adminGraphqlApiId,
  });

  int id;
  int productId;
  String title;
  String price;
  String sku;
  int position;
  String inventoryPolicy;
  String compareAtPrice;
  String fulfillmentService;
  String inventoryManagement;
  String option1;
  dynamic option2;
  dynamic option3;
  DateTime createdAt;
  DateTime updatedAt;
  bool taxable;
  String barcode;
  int grams;
  dynamic imageId;
  double weight;
  String weightUnit;
  int inventoryItemId;
  int inventoryQuantity;
  int oldInventoryQuantity;
  bool requiresShipping;
  String adminGraphqlApiId;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"],
        productId: json["product_id"],
        title: json["title"],
        price: json["price"],
        sku: json["sku"],
        position: json["position"],
        inventoryPolicy: json["inventory_policy"],
        compareAtPrice: json["compare_at_price"],
        fulfillmentService: json["fulfillment_service"],
        inventoryManagement: json["inventory_management"],
        option1: json["option1"],
        option2: json["option2"],
        option3: json["option3"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        taxable: json["taxable"],
        barcode: json["barcode"],
        grams: json["grams"],
        imageId: json["image_id"],
        weight: json["weight"],
        weightUnit: json["weight_unit"],
        inventoryItemId: json["inventory_item_id"],
        inventoryQuantity: json["inventory_quantity"],
        oldInventoryQuantity: json["old_inventory_quantity"],
        requiresShipping: json["requires_shipping"],
        adminGraphqlApiId: json["admin_graphql_api_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "title": title,
        "price": price,
        "sku": sku,
        "position": position,
        "inventory_policy": inventoryPolicy,
        "compare_at_price": compareAtPrice,
        "fulfillment_service": fulfillmentService,
        "inventory_management": inventoryManagement,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "taxable": taxable,
        "barcode": barcode,
        "grams": grams,
        "image_id": imageId,
        "weight": weight,
        "weight_unit": weightUnit,
        "inventory_item_id": inventoryItemId,
        "inventory_quantity": inventoryQuantity,
        "old_inventory_quantity": oldInventoryQuantity,
        "requires_shipping": requiresShipping,
        "admin_graphql_api_id": adminGraphqlApiId,
      };
}
