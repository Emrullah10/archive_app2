class SubBolum {
  final int id;
  final String name;
  final int? parentId;
  final List<SubBolum> subBolums;
  final int belgeCount;
  final bool isPredefined;
  final String? archiveDocumentId;

  SubBolum({
    required this.id,
    required this.name,
    this.parentId,
    required this.subBolums,
    required this.belgeCount,
    required this.isPredefined,
    this.archiveDocumentId,
  });

  factory SubBolum.fromJson(Map<String, dynamic> json) {
    var list = json['subBolums'] as List;
    List<SubBolum> subBolumsList =
        list.map((i) => SubBolum.fromJson(i)).toList();

    return SubBolum(
      id: json['id'],
      name: json['name'],
      parentId: json['parentId'],
      subBolums: subBolumsList,
      belgeCount: json['belgeCount'],
      isPredefined: json['isPredefined'],
      archiveDocumentId: json['archiveDocumentId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'parentId': parentId,
      'subBolums': subBolums.map((e) => e.toJson()).toList(),
      'belgeCount': belgeCount,
      'isPredefined': isPredefined,
      'archiveDocumentId': archiveDocumentId,
    };
  }
}

class Bolum {
  final int id;
  final String name;
  final int? parentId;
  final List<SubBolum> subBolums;
  final int belgeCount;
  final bool isPredefined;
  final dynamic archiveDocumentId;

  Bolum({
    required this.id,
    required this.name,
    this.parentId,
    required this.subBolums,
    required this.belgeCount,
    required this.isPredefined,
    this.archiveDocumentId,
  });

  factory Bolum.fromJson(Map<String, dynamic> json) {
    var list = json['subBolums'] as List;
    List<SubBolum> subBolumsList =
        list.map((i) => SubBolum.fromJson(i)).toList();

    return Bolum(
      id: json['id'],
      name: json['name'],
      parentId: json['parentId'],
      subBolums: subBolumsList,
      belgeCount: json['belgeCount'],
      isPredefined: json['isPredefined'],
      archiveDocumentId: json['archiveDocumentId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'parentId': parentId,
      'subBolums': subBolums.map((e) => e.toJson()).toList(),
      'belgeCount': belgeCount,
      'isPredefined': isPredefined,
      'archiveDocumentId': archiveDocumentId,
    };
  }
}
