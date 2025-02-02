// To parse this JSON data, do
//
//     final archiveModel = archiveModelFromJson(jsonString);

import 'dart:convert';

ArchiveModel archiveModelFromJson(String str) =>
    ArchiveModel.fromJson(json.decode(str));

String archiveModelToJson(ArchiveModel data) => json.encode(data.toJson());

class ArchiveModel {
  final int id;
  final dynamic image;
  final int? status;
  final String? klasorNo;
  final String? konu;
  final dynamic tarih;
  final String? sdp;
  final String? konum;
  final String? dosyaIslemNo;
  final String? sicilKodu;
  final String? arsivdekiYeri;
  final String? mahalle;
  final String? pafta;
  final String? ada;
  final String? parsel;
  final String? adres;
  final String? imarPlaniAdi;
  final String? ozelSartlar;
  final dynamic tasdikTarihi1;
  final dynamic tasdikTarihi2;
  final dynamic tasdikTarihi3;
  final String? aciklama;
  final String? parselKodu;
  final String? arsivId;
  final String? yeni;
  final String? yeniDosyaYili;

  ArchiveModel({
    required this.id,
    this.image,
    this.status,
    this.klasorNo,
    this.konu,
    this.tarih,
    this.sdp,
    this.konum,
    this.dosyaIslemNo,
    this.sicilKodu,
    this.arsivdekiYeri,
    this.mahalle,
    this.pafta,
    this.ada,
    this.parsel,
    this.adres,
    this.imarPlaniAdi,
    this.ozelSartlar,
    this.tasdikTarihi1,
    this.tasdikTarihi2,
    this.tasdikTarihi3,
    this.aciklama,
    this.parselKodu,
    this.arsivId,
    this.yeni,
    this.yeniDosyaYili,
  });

  factory ArchiveModel.fromJson(Map<String, dynamic> json) => ArchiveModel(
        id: json["id"],
        image: json["image"],
        status: json["status"],
        klasorNo: json["klasorNo"],
        konu: json["konu"],
        tarih: json["tarih"],
        sdp: json["sdp"],
        konum: json["konum"],
        dosyaIslemNo: json["dosyaIslemNo"],
        sicilKodu: json["sicilKodu"],
        arsivdekiYeri: json["arsivdekiYeri"],
        mahalle: json["mahalle"],
        pafta: json["pafta"],
        ada: json["ada"],
        parsel: json["parsel"],
        adres: json["adres"],
        imarPlaniAdi: json["imarPlaniAdi"],
        ozelSartlar: json["ozelSartlar"],
        tasdikTarihi1: json["tasdikTarihi1"],
        tasdikTarihi2: json["tasdikTarihi2"],
        tasdikTarihi3: json["tasdikTarihi3"],
        aciklama: json["aciklama"],
        parselKodu: json["parselKodu"],
        arsivId: json["arsivId"],
        yeni: json["yeni"],
        yeniDosyaYili: json["yeniDosyaYili"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "status": status,
        "klasorNo": klasorNo,
        "konu": konu,
        "tarih": tarih,
        "sdp": sdp,
        "konum": konum,
        "dosyaIslemNo": dosyaIslemNo,
        "sicilKodu": sicilKodu,
        "arsivdekiYeri": arsivdekiYeri,
        "mahalle": mahalle,
        "pafta": pafta,
        "ada": ada,
        "parsel": parsel,
        "adres": adres,
        "imarPlaniAdi": imarPlaniAdi,
        "ozelSartlar": ozelSartlar,
        "tasdikTarihi1": tasdikTarihi1,
        "tasdikTarihi2": tasdikTarihi2,
        "tasdikTarihi3": tasdikTarihi3,
        "aciklama": aciklama,
        "parselKodu": parselKodu,
        "arsivId": arsivId,
        "yeni": yeni,
        "yeniDosyaYili": yeniDosyaYili,
      };
}
