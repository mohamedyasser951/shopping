import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final int? quantity;
  final double? total;
  final double? discountPercentage;
  final double? discountedTotal;
  final String? thumbnail;

  const Product({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.total,
    this.discountPercentage,
    this.discountedTotal,
    this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int?,
        title: json['title'] as String?,
        price: (json['price'] as num?)?.toDouble(),
        quantity: json['quantity'] as int?,
        total: (json['total'] as num?)?.toDouble(),
        discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
        discountedTotal: (json['discountedTotal'] as num?)?.toDouble(),
        thumbnail: json['thumbnail'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'quantity': quantity,
        'total': total,
        'discountPercentage': discountPercentage,
        'discountedTotal': discountedTotal,
        'thumbnail': thumbnail,
      };

  @override
  List<Object?> get props {
    return [
      id,
      title,
      price,
      quantity,
      total,
      discountPercentage,
      discountedTotal,
      thumbnail,
    ];
  }
}
