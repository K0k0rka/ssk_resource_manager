class Record {
  int? id;
  String? buhName/*= "undefined"*/;
  String? model/*= "undefined"*/;
  String? serialNumber/*= "undefined"*/;
  String? productNumber/*= "undefined"*/;
  String? buhNumber/*= "undefined"*/;
  String? invNumber/*= "undefined"*/;
  String? userName/*= "undefined"*/;
  String? storage/*= "undefined"*/;
  String? status/*= "undefined"*/;
  String? sealNumber/*= "undefined"*/;
  String? cleanDate/*= "undefined"*/;
  String? comment/*= "undefined"*/;

  Record({
    this.id,
    this.model,
    this.buhName,
    this.serialNumber,
    this.productNumber,
    this.buhNumber,
    this.invNumber,
    this.userName,
    this.storage,
    this.status,
    this.sealNumber,
    this.cleanDate,
    this.comment,
  });

  int p1rint() {
    print(''''
id => ${this.id}
model => ${this.model}
buhName => ${this.buhName}
serialNumber => ${this.serialNumber}
productNumber => ${this.productNumber}
buhNumber => ${this.buhNumber}
invNumber => ${this.invNumber}
userName => ${this.userName}
storage => ${this.storage}
status => ${this.status}
sealNumber => ${this.sealNumber}
cleanDate => ${this.cleanDate}
comment => ${this.comment}
    ''');

    return 1;
  }
}

/// первое решение проблемы ниже

/*import 'dart:convert';

Record RecordFromMap(String str) {
  final jsonData = json.decode(str);
  return Record.fromMap(jsonData);
}

String RecordToJson(Record data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Record {
  int? id;
  String? model;
  String? buhName;
  String? serialNumber;
  String? productNumber;
  String? buhNumber;
  String? invNumber;
  String? userName;
  String? storage;
  String? sealNumber;
  String? cleanDate;
  String? comment;

  Record({
    this.id,
    this.model,
    this.buhName,
    this.serialNumber,
    this.productNumber,
    this.buhNumber,
    this.invNumber,
    this.userName,
    this.storage,
    this.sealNumber,
    this.cleanDate,
    this.comment,
  });

  factory Record.fromMap(Map<String, dynamic> json) => Record(
      id: json["id"],
      model: json["first_name"],
      buhName: json["last_name"],
      serialNumber: json["blocked"],
      productNumber: json["productNumber"],
      buhNumber: json["buhNumber"],
      invNumber: json["invNumber"],
      userName: json["userName"],
      storage: json["storage"],
      sealNumber: json["sealNumber"],
      cleanDate: json["cleanDate"],
      comment: json["comment"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "model": model,
        "buhName": buhName,
        "serialNumber": serialNumber,
        "productNumber": productNumber,
        "buhNumber": buhNumber,
        "invNumber": invNumber,
        "userName": userName,
        "storage": storage,
        "sealNumber": sealNumber,
        "cleanDate": cleanDate,
        "comment": comment
      };
}*/
