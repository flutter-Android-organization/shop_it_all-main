class ProductModel {
  ProductModel({
      required this.productId, required this.productImage, required this.productName,
      required this.productPrice, required this.productDescription,
      this.quantity = 1});

  final String productId;
  final String productImage;
  final String productName;
  final double productPrice;
  final String productDescription;
  int quantity;


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModel &&
          runtimeType == other.runtimeType &&
          productId == other.productId &&
          productImage == other.productImage &&
          productName == other.productName &&
          productPrice == other.productPrice &&
          productDescription == other.productDescription &&
          quantity == other.quantity;

  @override
  int get hashCode =>
      productId.hashCode ^
      productImage.hashCode ^
      productName.hashCode ^
      productPrice.hashCode ^
      productDescription.hashCode ^
      quantity.hashCode;

  @override
  String toString() {
    return 'ProductModel{productId: $productId, productImage: $productImage, productName: $productName, productPrice: $productPrice, productDescription: $productDescription, quantity: $quantity}';
  }

  // Convert to JSON for SharedPreferences
  Map<String, dynamic> toJson() => {
    'productId': productId,
    'productImage': productImage,
    'productName': productName,
    'productPrice': productPrice,
    'productDescription': productDescription,
    'quantity': quantity,
  };

  // Convert JSON back to a ProductModel
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['productId'],
      productImage: json['productImage'],
      productName: json['productName'],
      productPrice: json['productPrice'].toDouble(),
      productDescription: json['productDescription'],
      quantity: json['quantity'] ?? 1,
    );
  }

  // Add copyWith method for updating quantity or other fields
  ProductModel copyWith({
    String? productId,
    String? productImage,
    String? productName,
    double? productPrice,
    String? productDescription,
    int? quantity,
  }) {
    return ProductModel(
      productId: productId ?? this.productId,
      productImage: productImage ?? this.productImage,
      productName: productName ?? this.productName,
      productPrice: productPrice ?? this.productPrice,
      productDescription: productDescription ?? this.productDescription,
      quantity: quantity ?? this.quantity, // Update quantity if provided
    );
  }
}


