// To parse this JSON data, do
//
//     final pointOfInterest = pointOfInterestFromJson(jsonString);

import 'dart:convert';

List<PointOfInterest> pointOfInterestFromJson(String str) => List<PointOfInterest>.from(json.decode(str).map((x) => PointOfInterest.fromJson(x)));

String pointOfInterestToJson(List<PointOfInterest> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PointOfInterest {
    PointOfInterest({
        this.description,
        required this.name,
        required this.mainImage,
        required this.createdDate,
        this.createdBy,
        this.modifiedDate,
        required this.poiType,
        required this.longitude,
        required this.latitude,
        required this.markerImage,
        required this.id,
        required this.attraction,
        this.animalType,
        this.imageGallery,
        this.rideType,
    });

    String? description;
    String name;
    String mainImage;
    DateTime? createdDate;
    String? createdBy;
    DateTime? modifiedDate;
    String poiType;
    double longitude;
    double latitude;
    String markerImage;
    String id;
    String attraction;
    String? animalType;
    List<String>? imageGallery;
    String? rideType;

    factory PointOfInterest.fromJson(Map<String, dynamic> json) => PointOfInterest(
        description: json["Description"] == null ? null : json["Description"],
        name: json["Name"] == null ? null : json["Name"],
        mainImage: json["Main Image"] == null ? null : json["Main Image"],
        createdDate: DateTime.parse(json["Created Date"]),
        createdBy: json["Created By"],
        modifiedDate: DateTime.parse(json["Modified Date"]),
        poiType: json["POI Type"] == null ? null : json["POI Type"],
        longitude: json["Longitude"] == null ? null : json["Longitude"].toDouble(),
        latitude: json["Latitude"] == null ? null : json["Latitude"].toDouble(),
        markerImage: json["Marker Image"] == null ? null : json["Marker Image"],
        id: json["_id"],
        attraction: json["Attraction"] == null ? null : json["Attraction"],
        animalType: json["Animal Type"] == null ? null : json["Animal Type"],
        imageGallery: json["Image Gallery"] == null ? null : List<String>.from(json["Image Gallery"].map((x) => x)),
        rideType: json["Ride Type"] == null ? null : json["Ride Type"],
    );

    Map<String, dynamic> toJson() => {
        "Description": description == null ? null : description,
        "Name": name == null ? null : name,
        "Main Image": mainImage == null ? null : mainImage,
        "Created By": createdBy,
        "POI Type": poiType == null ? null : poiType,
        "Longitude": longitude == null ? null : longitude,
        "Latitude": latitude == null ? null : latitude,
        "Marker Image": markerImage == null ? null : markerImage,
        "_id": id,
        "Attraction": attraction == null ? null : attraction,
        "Animal Type": animalType == null ? null : animalType,
        "Image Gallery": imageGallery == null ? List<dynamic>.from(imageGallery!.map((x) => x)) : [],
        "Ride Type": rideType == null ? null : rideType,
    };
}