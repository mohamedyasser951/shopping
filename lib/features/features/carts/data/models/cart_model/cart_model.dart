import 'package:equatable/equatable.dart';

import 'product.dart';

class CartModel extends Equatable {
  final int? id;
  final List<Product>? products;
  final double? total;
  final double? discountedTotal;
  final int? userId;
  final int? totalProducts;
  final int? totalQuantity;

  const CartModel({
    this.id,
    this.products,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['id'] as int?,
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: (json['total'] as num?)?.toDouble(),
        discountedTotal: (json['discountedTotal'] as num?)?.toDouble(),
        userId: json['userId'] as int?,
        totalProducts: json['totalProducts'] as int?,
        totalQuantity: json['totalQuantity'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'products': products?.map((e) => e.toJson()).toList(),
        'total': total,
        'discountedTotal': discountedTotal,
        'userId': userId,
        'totalProducts': totalProducts,
        'totalQuantity': totalQuantity,
      };

  @override
  List<Object?> get props {
    return [
      id,
      products,
      total,
      discountedTotal,
      userId,
      totalProducts,
      totalQuantity,
    ];
  }
}
