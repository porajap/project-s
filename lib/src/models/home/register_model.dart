class RegisterModel {
  RegisterModel({
      this.error, 
      this.message, 
      this.data,});

  RegisterModel.fromJson(dynamic json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? error;
  String? message;
  List<Data>? data;
RegisterModel copyWith({  bool? error,
  String? message,
  List<Data>? data,
}) => RegisterModel(  error: error ?? this.error,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = error;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.organizeId, 
      this.organizeName, 
      this.typeName, 
      this.format,});

  Data.fromJson(dynamic json) {
    organizeId = json['organizeId'];
    organizeName = json['organizeName'];
    typeName = json['typeName'];
    format = json['format'];
  }
  num? organizeId;
  String? organizeName;
  String? typeName;
  num? format;
Data copyWith({  num? organizeId,
  String? organizeName,
  String? typeName,
  num? format,
}) => Data(  organizeId: organizeId ?? this.organizeId,
  organizeName: organizeName ?? this.organizeName,
  typeName: typeName ?? this.typeName,
  format: format ?? this.format,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['organizeId'] = organizeId;
    map['organizeName'] = organizeName;
    map['typeName'] = typeName;
    map['format'] = format;
    return map;
  }

}