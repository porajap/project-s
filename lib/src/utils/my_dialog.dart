import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'constants.dart';

class MyDialog {
  static void dialogConfirm({
    required BuildContext context,
    required Function callback,
    required String title,
    required String msg,
    String? cancelText,
    String? confirmText,
  }) {
    var _callBackOnConfirm = () {
      Navigator.pop(context);
      callback();
    };

    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "$title",
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 10),
              Text(
                '$msg',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(primary: AppColor.grayColor, elevation: 0),
                        child: Text(
                          cancelText ?? Constants.textCancel,
                          style: TextStyle(color: AppColor.textPrimaryColor.withOpacity(0.7)),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _callBackOnConfirm,
                        style: ElevatedButton.styleFrom(elevation: 0),
                        child: Text(confirmText ?? Constants.textConfirm),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void dialogCustom({
    required BuildContext context,
    required String title,
    required String msg,
    String? cancelText,
    Function? callback,
  }) {

    var callBackOnConfirm = () {
      Navigator.pop(context);
      if(callback != null){
        callback();
      }
    };

    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        content: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "$title",
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 10),
              Text(
                '$msg',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: callBackOnConfirm,
                  style: ElevatedButton.styleFrom(primary: AppColor.grayColor, elevation: 0),
                  child: Text(
                    "${cancelText ?? Constants.textClose}",
                    style: TextStyle(color: AppColor.textPrimaryColor.withOpacity(0.7)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
