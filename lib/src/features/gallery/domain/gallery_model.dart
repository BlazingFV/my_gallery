class GalleryModel {
  String? status;
  GalleryImages? data;
  String? message;

  GalleryModel({
    this.status,
    this.data,
    this.message,
  });

  GalleryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as String?;
    data = (json['data'] as Map<String,dynamic>?) != null ? GalleryImages.fromJson(json['data'] as Map<String,dynamic>) : null;
    message = json['message'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['status'] = status;
    json['data'] = data?.toJson();
    json['message'] = message;
    return json;
  }
}

class GalleryImages {
  List<String>? images;

  GalleryImages({
    this.images,
  });

  GalleryImages.fromJson(Map<String, dynamic> json) {
    images = (json['images'] as List?)?.map((dynamic e) => e as String).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['images'] = images;
    return json;
  }
}