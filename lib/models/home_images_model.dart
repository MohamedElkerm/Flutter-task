class HomeImagesModel {
  bool success;
  ImagesData data;

  HomeImagesModel({
    required this.success,
    required this.data,
  });

  factory HomeImagesModel.fromJson(json) {
    return HomeImagesModel(
      success: json['success'],
      data: ImagesData.fromJson(json['data']),
    );
  }
}

class ImagesData {
  List<String> imagesSlider;
  List<String> imagesRecommendations;

  ImagesData({
    required this.imagesSlider,
    required this.imagesRecommendations,
  });

  factory ImagesData.fromJson(json) {
    return ImagesData(
      imagesSlider: List<String>.from(json["slider"].map((x) => x)),
      imagesRecommendations:
          List<String>.from(json["recomendations"].map((x) => x)),
    );
  }
}
