import 'dart:convert';

NetworkResponseModel networkResponseModelFromMap(String str) => NetworkResponseModel.fromMap(json.decode(str));

String networkResponseModelToMap(NetworkResponseModel data) => json.encode(data.toMap());

class NetworkResponseModel {
    NetworkResponseModel({
        required this.error,
        required this.data,
    });

    String error;
    dynamic data;

    factory NetworkResponseModel.fromMap(Map<String, dynamic> json) => NetworkResponseModel(
        error: json["error"],
        data: json["data"],
    );

    Map<String, dynamic> toMap() => {
        "error": error,
        "data": data,
    };
}
