class QueueTodayModel {
  QueueTodayModel({
      this.error, 
      this.message, 
      this.data,});

  QueueTodayModel.fromJson(dynamic json) {
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? error;
  String? message;
  Data? data;
QueueTodayModel copyWith({  bool? error,
  String? message,
  Data? data,
}) => QueueTodayModel(  error: error ?? this.error,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = error;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.userData, 
      this.queue, 
      this.detail,});

  Data.fromJson(dynamic json) {
    userData = json['userData'] != null ? UserData.fromJson(json['userData']) : null;
    queue = json['queue'] != null ? Queue.fromJson(json['queue']) : null;
    detail = json['detail'] != null ? Detail.fromJson(json['detail']) : null;
  }
  UserData? userData;
  Queue? queue;
  Detail? detail;
Data copyWith({  UserData? userData,
  Queue? queue,
  Detail? detail,
}) => Data(  userData: userData ?? this.userData,
  queue: queue ?? this.queue,
  detail: detail ?? this.detail,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (userData != null) {
      map['userData'] = userData?.toJson();
    }
    if (queue != null) {
      map['queue'] = queue?.toJson();
    }
    if (detail != null) {
      map['detail'] = detail?.toJson();
    }
    return map;
  }

}

class Detail {
  Detail({
      this.id, 
      this.roomId, 
      this.roomName, 
      this.counter, 
      this.startTime, 
      this.endTime, 
      this.queueOfRoom, 
      this.isSuccess, 
      this.queueFront,});

  Detail.fromJson(dynamic json) {
    id = json['id'];
    roomId = json['roomId'];
    roomName = json['roomName'];
    counter = json['Counter'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    queueOfRoom = json['queueOfRoom'];
    isSuccess = json['isSuccess'];
    queueFront = json['queueFront'];
  }
  num? id;
  num? roomId;
  String? roomName;
  dynamic counter;
  String? startTime;
  dynamic endTime;
  num? queueOfRoom;
  num? isSuccess;
  num? queueFront;
Detail copyWith({  num? id,
  num? roomId,
  String? roomName,
  dynamic counter,
  String? startTime,
  dynamic endTime,
  num? queueOfRoom,
  num? isSuccess,
  num? queueFront,
}) => Detail(  id: id ?? this.id,
  roomId: roomId ?? this.roomId,
  roomName: roomName ?? this.roomName,
  counter: counter ?? this.counter,
  startTime: startTime ?? this.startTime,
  endTime: endTime ?? this.endTime,
  queueOfRoom: queueOfRoom ?? this.queueOfRoom,
  isSuccess: isSuccess ?? this.isSuccess,
  queueFront: queueFront ?? this.queueFront,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['roomId'] = roomId;
    map['roomName'] = roomName;
    map['Counter'] = counter;
    map['startTime'] = startTime;
    map['endTime'] = endTime;
    map['queueOfRoom'] = queueOfRoom;
    map['isSuccess'] = isSuccess;
    map['queueFront'] = queueFront;
    return map;
  }

}

class Queue {
  Queue({
      this.id, 
      this.queueNo, 
      this.memberId, 
      this.roomId, 
      this.roomName, 
      this.createdAt, 
      this.dateAt, 
      this.timeAt, 
      this.isConfirm,});

  Queue.fromJson(dynamic json) {
    id = json['id'];
    queueNo = json['queueNo'];
    memberId = json['memberId'];
    roomId = json['roomId'];
    roomName = json['roomName'];
    createdAt = json['createdAt'];
    dateAt = json['dateAt'];
    timeAt = json['timeAt'];
    isConfirm = json['isConfirm'];
  }
  num? id;
  String? queueNo;
  num? memberId;
  num? roomId;
  String? roomName;
  String? createdAt;
  String? dateAt;
  String? timeAt;
  num? isConfirm;
Queue copyWith({  num? id,
  String? queueNo,
  num? memberId,
  num? roomId,
  String? roomName,
  String? createdAt,
  String? dateAt,
  String? timeAt,
  num? isConfirm,
}) => Queue(  id: id ?? this.id,
  queueNo: queueNo ?? this.queueNo,
  memberId: memberId ?? this.memberId,
  roomId: roomId ?? this.roomId,
  roomName: roomName ?? this.roomName,
  createdAt: createdAt ?? this.createdAt,
  dateAt: dateAt ?? this.dateAt,
  timeAt: timeAt ?? this.timeAt,
  isConfirm: isConfirm ?? this.isConfirm,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['queueNo'] = queueNo;
    map['memberId'] = memberId;
    map['roomId'] = roomId;
    map['roomName'] = roomName;
    map['createdAt'] = createdAt;
    map['dateAt'] = dateAt;
    map['timeAt'] = timeAt;
    map['isConfirm'] = isConfirm;
    return map;
  }

}

class UserData {
  UserData({
      this.thTitle, 
      this.thFrist, 
      this.thLast, 
      this.hnCode, 
      this.mobileNo, 
      this.dateAt, 
      this.timeAt,});

  UserData.fromJson(dynamic json) {
    thTitle = json['ThTitle'];
    thFrist = json['ThFrist'];
    thLast = json['ThLast'];
    hnCode = json['HnCode'];
    mobileNo = json['MobileNo'];
    dateAt = json['dateAt'];
    timeAt = json['timeAt'];
  }
  String? thTitle;
  String? thFrist;
  String? thLast;
  String? hnCode;
  String? mobileNo;
  String? dateAt;
  String? timeAt;
UserData copyWith({  String? thTitle,
  String? thFrist,
  String? thLast,
  String? hnCode,
  String? mobileNo,
  String? dateAt,
  String? timeAt,
}) => UserData(  thTitle: thTitle ?? this.thTitle,
  thFrist: thFrist ?? this.thFrist,
  thLast: thLast ?? this.thLast,
  hnCode: hnCode ?? this.hnCode,
  mobileNo: mobileNo ?? this.mobileNo,
  dateAt: dateAt ?? this.dateAt,
  timeAt: timeAt ?? this.timeAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ThTitle'] = thTitle;
    map['ThFrist'] = thFrist;
    map['ThLast'] = thLast;
    map['HnCode'] = hnCode;
    map['MobileNo'] = mobileNo;
    map['dateAt'] = dateAt;
    map['timeAt'] = timeAt;
    return map;
  }

}