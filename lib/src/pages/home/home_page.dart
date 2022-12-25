import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:project_s/src/models/home/queue_today_model.dart';
import 'package:project_s/src/models/home/register_selected_model.dart';
import 'package:project_s/src/models/response_model.dart';
import 'package:project_s/src/pages/home/register_at_page.dart';
import 'package:project_s/src/pages/home/scan_page.dart';
import 'package:project_s/src/services/home_service.dart';

import '../../my_app.dart';
import '../../utils/app_theme.dart';
import '../../utils/constants.dart';
import '../../utils/my_widget.dart';
import 'components/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RegisterAtSelected registerSelected = RegisterAtSelected(title: "");

  QueueTodayModel queueData = QueueTodayModel();
  HomeService homeService = HomeService();

  @override
  void initState() {
    getQueueToday();
    super.initState();
  }

  Timer? timer;
  Future<void> timerQ() async {
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => getQueueToday());
  }

  @override
  void dispose() {
    timer?.cancel();
    logger.i('timer active: ${timer?.isActive}');
    super.dispose();
  }

  Future<void> getQueueToday() async {
    if (registerSelected.organizeId != null) {
      queueData = await homeService.getQToday(organizeId: registerSelected.organizeId ?? 0);
    }

    if (!mounted) {
      return;
    }

    if(timer == null){
      timerQ();
    }
    setState(() {});
  }

  Future openScanPage() async {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanPage())).then((value) {
      if (value != null) {
        scanQrCode(queueNo: value);
      }
    });
  }

  Future<void> scanQrCode({required String queueNo}) async {
    BotToast.showLoading();

    if (registerSelected.organizeId != null) {
      ResponseModel _result = await homeService.scanQr(
        qNumber: queueNo.trim(),
        organizeId: registerSelected.organizeId,
      );

      bool _error = _result.error ?? false;

      if (_error) {
        return;
      }

      setState(() {});

    }

    BotToast.closeAllLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: Container(
          child: HomeAppBar(),
        ),
      ),
      bottomNavigationBar: queueData.data != null
          ? SizedBox()
          : BottomAppBar(
              elevation: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: ElevatedButton.icon(
                  onPressed: openScanPage,
                  label: Text("สแกนคิวอาร์โค้ด"),
                  icon: Icon(Icons.qr_code_scanner_rounded),
                ),
              ),
            ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: MyScreen(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 70,
                child: buildSelectRegister(),
              ),
              queueData.data == null
                  ? Container(
                      child: Container(
                        height: 500,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("${Constants.imageUrl}/home_qr.png", width: 180),
                            SizedBox(height: 20),
                            Text("ไม่พบข้อมูล", style: Theme.of(context).textTheme.headline1),
                            SizedBox(height: 5),
                            Text("สแกนคิวอาร์โค้ดเพื่อดูรายละเอียด"),
                          ],
                        ),
                      ),
                    )
                  : buildDetail()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSelectRegister() => InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterAtPage())).then(
            (value) {
              if (value != null) {
                setState(() {
                  registerSelected = value;
                  getQueueToday();
                });
              }
            },
          );
        },
        child: ListTile(
          title: Text("หน่วยงานที่ต้องการติดต่อ"),
          subtitle: registerSelected.title == "" ? Text("กรุณาเลือก") : Text("${registerSelected.title}"),
          trailing: Icon(Icons.navigate_next_rounded),
        ),
      );

  Widget buildQEmpty() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("${Constants.imageUrl}/home_qr.png", width: 180),
          SizedBox(height: 20),
          Text("ไม่พบข้อมูล", style: Theme.of(context).textTheme.headline1),
        ],
      ),
    );
  }

  Widget buildDetail() {
    //hospital
    if (registerSelected.format == 1) {
      return buildHospitalFormat();
    }

    //general
    return buildGeneralFormat();
  }

  Widget buildHospitalFormat() {
    var _queueData = queueData.data;
    var _queueDetail = queueData.data?.detail;
    var _queueFront = _queueDetail?.queueFront ?? 0;

    String _roomName = _queueData?.queue?.roomName ?? "";

    String _queueOfRoom = _queueDetail?.queueOfRoom != null ? '${_queueDetail?.queueOfRoom as int}' : '-';
    String _queueOfFront = '$_queueFront';

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "${Constants.imageUrl}/home_q.png",
                  width: double.maxFinite,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        "${_roomName}",
                        style: TextStyle(
                          color: AppColor.whiteColor,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              decoration:
                                  BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColor.successColor),
                              child: Column(
                                children: [
                                  Text(
                                    "$_queueOfRoom",
                                    style: TextStyle(color: AppColor.whiteColor, fontSize: 32),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "คิวของคุณ",
                                    style: TextStyle(color: AppColor.whiteColor, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              decoration:
                                  BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColor.successColor),
                              child: Column(
                                children: [
                                  Text(
                                    "$_queueOfFront",
                                    style: TextStyle(color: AppColor.whiteColor, fontSize: 32),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "มีคิวก่อนหน้า",
                                    style: TextStyle(color: AppColor.whiteColor, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            buildUserData(),
          ],
        ),
      ),
    );
  }

  Widget buildUserData() {
    var _userData = queueData.data?.userData;
    var _queueData = queueData.data;
    var _queueNo = queueData.data?.queue?.queueNo ?? "";

    String _hnCode = _userData?.hnCode ?? "";
    String _fName = _userData?.thFrist ?? "";
    String _lName = _userData?.thLast ?? "";
    String _fullName = '$_fName $_lName';

    String _date = _queueData?.userData?.dateAt ?? "";
    String _time = _queueData?.userData?.timeAt ?? "";

    String _userType = "ทั่วไป";
    var _isConfirm = queueData.data?.queue?.isConfirm ?? 0;

    //hospital
    if (registerSelected.format == 1) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                dataDetail(title: "ชื่อ - นามสกุล", detail: _fullName),
                Container(padding: EdgeInsets.symmetric(vertical: 10), child: Divider()),
                dataDetail(title: "รหัสผู้ป่วย", detail: "$_queueNo"),
                Container(padding: EdgeInsets.symmetric(vertical: 10), child: Divider()),
                dataDetail(title: "หมายเลข HN", detail: "$_hnCode", detailColor: AppColor.primaryColor),
                Container(padding: EdgeInsets.symmetric(vertical: 10), child: Divider()),
                dataDetail(title: "ประเภทผู้ป่วย", detail: "$_userType"),
                Container(padding: EdgeInsets.symmetric(vertical: 10), child: Divider()),
                dataDetail(title: "อัพเดทล่าสุด", detail: "$_date $_time"),
                Container(padding: EdgeInsets.symmetric(vertical: 10), child: Divider()),
              ],
            ),
            Visibility(
              visible: _isConfirm == 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: confirmQueue,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text("ยันยันรับคิว"),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    //general
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              dataDetail(title: "ชื่อ - นามสกุล", detail: _fullName),
              Container(padding: EdgeInsets.symmetric(vertical: 10), child: Divider()),
              dataDetail(title: "อัพเดทล่าสุด", detail: "$_date $_time"),
              Container(padding: EdgeInsets.symmetric(vertical: 10), child: Divider()),
            ],
          ),
          Visibility(
            visible: _isConfirm == 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: confirmQueue,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("ยันยันรับคิว"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGeneralFormat() {
    var _queueData = queueData.data;
    var _queueDetail = queueData.data?.detail;
    var _queueFront = _queueDetail?.queueFront ?? 0;

    String _queueOfRoom = _queueDetail?.queueOfRoom != null ? '${_queueDetail?.queueOfRoom as int}' : '-';
    String _queueOfFront = '$_queueFront';

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "${Constants.imageUrl}/home_q.png",
                  width: double.maxFinite,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        "ช่องบริการ",
                        style: TextStyle(
                          color: AppColor.whiteColor,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              decoration:
                                  BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColor.successColor),
                              child: Column(
                                children: [
                                  Text(
                                    "$_queueOfRoom",
                                    style: TextStyle(color: AppColor.whiteColor, fontSize: 32),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "คิวของคุณ",
                                    style: TextStyle(color: AppColor.whiteColor, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              decoration:
                                  BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColor.successColor),
                              child: Column(
                                children: [
                                  Text(
                                    "$_queueOfFront",
                                    style: TextStyle(color: AppColor.whiteColor, fontSize: 32),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "มีคิวก่อนหน้า",
                                    style: TextStyle(color: AppColor.whiteColor, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            buildUserData(),
          ],
        ),
      ),
    );
  }

  Widget dataDetail({required String title, required String detail, Color? detailColor}) {
    detailColor = detailColor ?? AppColor.textPrimaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$title"),
        Text(
          "$detail",
          style: TextStyle(color: detailColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Future<void> confirmQueue() async {
    BotToast.showLoading();

    if (registerSelected.organizeId != null) {
      var _qId = queueData.data?.queue?.id ?? 0;
      var _roomId = queueData.data?.queue?.roomId ?? 0;
      String _qNumber = queueData.data?.queue?.queueNo ?? "";

      var _organizeId = registerSelected.organizeId ?? 0;

      ResponseModel _result =
          await homeService.confirmQ(organizeId: _organizeId, qId: _qId, qNumber: _qNumber, roomId: _roomId);
      bool _error = _result.error ?? false;

      if (!_error) {
        getQueueToday();
      }
    }
    setState(() {
      BotToast.closeAllLoading();
    });
  }
}
