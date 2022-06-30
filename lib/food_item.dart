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
        name: json['content']['details']['name'],
        images: json['content']['details']['images'][0]['hostedLargeUrl'] ,
        rating: json['content']['details']["rating"],
        totalTime: json['content']['details']["totalTime"],
      );

  static List<FoodItem> fromJsonList(List<dynamic> jsonList) {
    List<FoodItem> list = [];
    for (int i = 0; i < jsonList.length; i++) {
      if (jsonList[i]['content']['details'] != null &&
          jsonList[i]['content']['details']['name'] != null &&
          jsonList[i]['content']['details']['rating'] != null &&
          jsonList[i]['content']['details']['totalTime'] != null) {
        list.add(FoodItem.fromJson(jsonList[i]));
      }
    }
    return list;
  }
}
