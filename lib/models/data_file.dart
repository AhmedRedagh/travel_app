class DataModel {
  final int id;
  String name;
  String img;
  int price;
  int people;
  String description;
  int stars;
  int selectedPeople;
  String location;
  String createdAt;
  String updatedAt;
  DataModel({
    required this.id,
    required this.name,
    required this.img,
    required this.price,
    required this.createdAt,
    required this.description,
    required this.location,
    required this.people,
    required this.selectedPeople,
    required this.stars,
    required this.updatedAt,
  });
  factory DataModel.fromjson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      name: json['name'],
      img: json['img'],
      price: json['price'],
      createdAt: json['created_at'],
      description: json['description'],
      location: json['location'],
      people: json['people'],
      selectedPeople: json['selected_people'],
      stars: json['stars'],
      updatedAt: json['updated_at'],
    );
  }
}
