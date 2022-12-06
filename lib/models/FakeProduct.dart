class FakeProduct {
  num id;
  String title;
  num price;
  String description;
  String category;
  String image;
  Rating rateNum;

  FakeProduct(
      {required this.id,
      required this.price,
      required this.title,
      required this.description,
      required this.category,
      required this.image,
      required this.rateNum});

  factory FakeProduct.fromJson(Map<String, dynamic> json) {
    return FakeProduct(
        id: json['id'],
        price: json['price'],
        title: json['title'],
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rateNum: Rating.fromJson(json['rating']));
  }
}

class Rating {
  num count;
  num rate;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'],
      count: json['count'],
    );
  }
}
