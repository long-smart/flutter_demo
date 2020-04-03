class ProductItemModal {
  String desc; // 产品描述
  String type; // 产品类型
  String name; // 产品名字
  String imageUrl; // 图片地址

  ProductItemModal({
    this.desc,
    this.type,
    this.name,
    this.imageUrl,
  });

  factory ProductItemModal.fromJson(dynamic json) {
    return ProductItemModal(
      desc: json['desc'],
      type: json['type'],
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }
}

class ProductListModal {
  List<ProductItemModal> data;
  ProductListModal(this.data);

  factory ProductListModal.fromJson(List json) {
    return ProductListModal(
      json.map((i) => ProductItemModal.fromJson(i)).toList()
    );
  }
}
