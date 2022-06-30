class FoodItem {
  final String? name;
  // final String? images;
  final double? rating;
  final String? totalTime;

  FoodItem({
    required this.name,
    // required this.images,
    required this.rating,
    required this.totalTime,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
    name: json['content']['details']['name'] as String?,
    // images: json['images']['hostedLargeUrl'] as String?,
    rating: json['content']['details']["rating"] as double?,
    totalTime: json['content']['details']["totalTime"] as String?,
  );

  static List<FoodItem> fromJsonList(List<dynamic> jsonList) {
    List<FoodItem> list = [];
    for (int i = 0; i < jsonList.length; i++) {
      if (jsonList[i]['content']['details']['name'] != null) {
        list.add(FoodItem.fromJson(jsonList[i]));
      }
    }
    return list;
  }
}