import 'package:flutter/material.dart';
import 'package:sample/components/header_bar.dart';
import 'package:sample/components/outline_button.dart';
import 'package:sample/components/primary_button.dart';

class BlutoothDeviceInfo {
  String name;
  String status;

  BlutoothDeviceInfo({required this.name, required this.status});
}

class ConnectionsScreen extends StatefulWidget {
  @override
  _ConnectionsScreenState createState() => _ConnectionsScreenState();
}

class _ConnectionsScreenState extends State<ConnectionsScreen> {
  List<BlutoothDeviceInfo> devices = [
    BlutoothDeviceInfo(name: "BMW_3 Series_New22", status: "Connected"),
    BlutoothDeviceInfo(name: "BMW_3 Series_New22", status: "Not Connected"),
    BlutoothDeviceInfo(name: "BMW_3 Series_New22", status: "Not Connected"),
    BlutoothDeviceInfo(name: "BMW_3 Series_New22", status: "Not Connected"),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: HeaderBar(
              icon: "assets/network.png",
              title: "Connections",
              subTitle: "Vehicle Bluetooth",
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 265.65,
                  height: 265.65 + 14.28,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 265.65,
                        height: 265.65,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xFF36924B),
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.33),
                          child: Container(
                            width: 265.65 - 6.33 * 2,
                            height: 265.65 - 6.33 * 2,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFDCF1E7),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Connected",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                Text(
                                  "BMW_3 Series_New22",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Image.asset(
                                  "assets/sedan.png",
                                  color: Colors.black,
                                  width: 89.6,
                                  height: 89.6,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 12.12,
                        child: Container(
                          width: 119.2,
                          height: 113.6,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFDCF1E7),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 12.12,
                        child: Container(
                          width: 119.2,
                          height: 113.6,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xFF36924B),
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/bluetooth.png",
                                color: Colors.black,
                                width: 35.84,
                                height: 35.91,
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Text(
                                "search Bluetooth Connection",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 12.12,
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Color(0xFFE4F4EB),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                              ),
                              elevation: 2,
                              enableDrag: false,
                              isDismissible: true,
                              isScrollControlled: true,
                              builder: (context) {
                                return bottomPopUpModal(deviceList: devices);
                              },
                            );
                          },
                          child: Container(
                            width: 119.2,
                            height: 113.6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              "assets/Small curve background.png",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 57,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "If You Cannot Find The Device In The List ,Please Pair The Device First & Refresh",
                        style: TextStyle(
                          color: Color(0xFF3F3F3F),
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      PrimaryButton(
                        buttonText: "Refresh",
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 23.4,
                      ),
                      OutlineButton(
                        buttonText: "Bluetooth Setings",
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container bottomPopUpModal({required List<BlutoothDeviceInfo> deviceList}) {
    return Container(
      height: 432,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 12),
              child: Text(
                "Bluetooth devices".toUpperCase(),
                style: TextStyle(
                  color: Color(0xFF555151),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 21),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Connected devices",
                      style: TextStyle(
                        color: Color(0xFF40CFA4),
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    BottomSheetContainer(
                        deviceList: deviceList
                            .where((element) => element.status == "Connected")
                            .toList()),
                    SizedBox(
                      height: 17,
                    ),
                    Text(
                      "Other",
                      style: TextStyle(
                        color: Color(0xFF40CFA4),
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    BottomSheetContainer(
                        deviceList: deviceList
                            .where(
                                (element) => element.status == "Not Connected")
                            .toList()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSheetContainer extends StatelessWidget {
  BottomSheetContainer({super.key, required this.deviceList});

  List<BlutoothDeviceInfo> deviceList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFFE3F4EB),
        border: Border.all(
          color: Color(0xFF7C7C7C).withOpacity(0.25),
          width: 1,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 4,
            blurStyle: BlurStyle.outer,
            color: Color(0xFF000000).withOpacity(0.25),
            offset: Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int value) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 21,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      deviceList[value].name,
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Text(
                    deviceList[value].status,
                    style: TextStyle(
                      color: Color(0xFF050505).withOpacity(0.44),
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.info_outline_rounded,
                    color: Color(0xFF7C7C7C),
                    size: 25,
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int value) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 7),
              child: Divider(
                thickness: 1,
                color: Color(0xFF000000),
              ),
            );
          },
          itemCount: deviceList.length,
        ),
      ),
    );
  }
}
