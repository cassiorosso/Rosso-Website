import 'dart:convert';

BannerModel bannerModelFromMap(String str) => BannerModel.fromMap(json.decode(str));

String bannerModelToMap(BannerModel data) => json.encode(data.toMap());

class BannerModel {
    BannerModel({
        required this.isMobile,
        required this.url,
    });

    bool isMobile;
    String url;

    factory BannerModel.fromMap(Map<String, dynamic> json) => BannerModel(
        isMobile: json["isMobile"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "isMobile": isMobile,
        "url": url,
    };
}