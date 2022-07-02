class FoodItem {
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  FoodItem({
    required this.name,
    required this.images,
    required this.rating,
    required this.totalTime,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
        name: json['name'],
        images: json['images'][0]['hostedLargeUrl'],
        rating: json["rating"],
        totalTime: json["totalTime"],
      );

  static List<FoodItem> fromJsonList(List<dynamic> jsonList) {
    List<FoodItem> list = [];
    for (int i = 0; i < jsonList.length; i++) {
      final details = jsonList[i]['content']['details'];
      if (details != null &&
          details['name'] != null &&
          details['rating'] != null &&
          details['totalTime'] != null) {
        list.add(FoodItem.fromJson(details));
      }
    }
    return list;
  }
}
