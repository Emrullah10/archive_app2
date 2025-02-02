import 'dart:convert';

BelgesModel belgesModelFromJson(String str) =>
    BelgesModel.fromJson(json.decode(str));

String belgesModelToJson(BelgesModel data) => json.encode(data.toJson());

class BelgesModel {
  final int? id;
  final String? fileName;
  final String? bolumName;
  final int? bolumId;
  final int? size;
  final DateTime? uploadDate;
  final String? extractedText;

  BelgesModel({
    this.id,
    this.fileName,
    this.bolumName,
    this.bolumId,
    this.size,
    this.uploadDate,
    this.extractedText,
  });

  factory BelgesModel.fromJson(Map<String, dynamic> json) => BelgesModel(
        id: json["id"],
        fileName: json["fileName"],
        bolumName: json["bolumName"],
        bolumId: json["bolumId"],
        size: json["size"],
        uploadDate: json["uploadDate"] == null
            ? null
            : DateTime.parse(json["uploadDate"]),
        extractedText: json["extractedText"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fileName": fileName,
        "bolumName": bolumName,
        "bolumId": bolumId,
        "size": size,
        "uploadDate": uploadDate?.toIso8601String(),
        "extractedText": extractedText,
      };
}
