// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// ElevatedButton(
// onPressed: () {
// if (!pressAttentionAuto) {
// providerBluetooth.writeData("A");
//
// snack(
// bgColor: Color(0xFFA4C9F1),
// txtColor: Colors.black,
// message: "Mode Changed");
// }
// setState(() {
// pressAttentionAuto = true;
// pressAttentionBeast = false;
// pressAttentionEco = false;
// pressAttentionSilent = false;
// });
// },
// style: ButtonStyle(
// fixedSize:
// MaterialStateProperty.all(Size(90, 85)),
// shape: MaterialStateProperty.all<
//     RoundedRectangleBorder>(
// RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(20),
// )),
// backgroundColor: MaterialStateProperty.all(
// pressAttentionAuto
// ? Color(0xFF2891F0)
// : Colors.white70,
// ),
// foregroundColor: MaterialStateProperty.all(
// pressAttentionAuto
// ? Colors.white
//     : Colors.black38,
// ),
// elevation: MaterialStateProperty.all(
// pressAttentionAuto ? 25 : 0,
// )),
// child: Padding(
// padding: const EdgeInsets.all(5),
// child: Column(
// children: [
// SizedBox(
// height: 10,
// ),
// Icon(Icons.autorenew),
// SizedBox(
// height: 5,
// ),
// Text("Auto",
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.normal)),
// SizedBox(
// height: 10,
// ),
// ],
// ),
// )),
// ElevatedButton(
// onPressed: () {
// if (!pressAttentionBeast) {
// providerBluetooth.writeData("B");
// snack(
// bgColor: Color(0xFFA4C9F1),
// txtColor: Colors.black,
// message: "Mode Changed");
// }
// setState(() {
// pressAttentionAuto = false;
// pressAttentionBeast = true;
// pressAttentionEco = false;
// pressAttentionSilent = false;
// });
// },
// style: ButtonStyle(
// fixedSize: MaterialStateProperty.all(Size(90, 85)),
// shape: MaterialStateProperty.all<
//     RoundedRectangleBorder>(RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(20),
// )),
// backgroundColor: MaterialStateProperty.all(
// pressAttentionBeast
// ? Color(0xFF2891F0)
// : Colors.white70,
// ),
// foregroundColor: MaterialStateProperty.all(
// pressAttentionBeast
// ? Colors.white
//     : Colors.black38,
// ),
// elevation: MaterialStateProperty.all(
// pressAttentionBeast ? 25 : 0,
// ),
// ),
// child: Padding(
// padding: const EdgeInsets.all(5),
// child: Column(
// children: [
// SizedBox(
// height: 10,
// ),
// Icon(Icons.network_check),
// SizedBox(
// height: 5,
// ),
// Text("Beast",
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.normal)),
// SizedBox(
// height: 10,
// ),
// ],
// ),
// )),
// ElevatedButton(
// onPressed: () {
// if (!pressAttentionEco) {
// providerBluetooth.writeData("E");
// snack(
// bgColor: Color(0xFFA4C9F1),
// txtColor: Colors.black,
// message: "Mode Changed");
// }
//
// setState(() {
// pressAttentionAuto = false;
// pressAttentionBeast = false;
// pressAttentionEco = true;
// pressAttentionSilent = false;
// });
// },
// style: ButtonStyle(
// fixedSize:
// MaterialStateProperty.all(Size(90, 85)),
// shape: MaterialStateProperty.all<
//     RoundedRectangleBorder>(
// RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(20),
// )),
// backgroundColor: MaterialStateProperty.all(
// pressAttentionEco
// ? Color(0xFF2891F0)
// : Colors.white70,
// ),
// foregroundColor: MaterialStateProperty.all(
// pressAttentionEco
// ? Colors.white
//     : Colors.black38,
// ),
// elevation: MaterialStateProperty.all(
// pressAttentionEco ? 25 : 0,
// )),
// child: Padding(
// padding: const EdgeInsets.all(5),
// child: Column(
// children: [
// SizedBox(
// height: 10,
// ),
// Icon(Icons.local_florist),
// SizedBox(
// height: 5,
// ),
// Text("Eco",
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.normal)),
// SizedBox(
// height: 10,
// ),
// ],
// ),
// )),
// ElevatedButton(
// onPressed: () {
// if (!pressAttentionSilent) {
// providerBluetooth.writeData("S");
// snack(
// bgColor: Color(0xFFA4C9F1),
// txtColor: Colors.black,
// message: "Mode Changed");
// }
// setState(() {
// pressAttentionAuto = false;
// pressAttentionBeast = false;
// pressAttentionEco = false;
// pressAttentionSilent = true;
// });
// },
// style: ButtonStyle(
// fixedSize:
// MaterialStateProperty.all(Size(90, 85)),
// shape: MaterialStateProperty.all<
//     RoundedRectangleBorder>(
// RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(20),
// )),
// backgroundColor: MaterialStateProperty.all(
// pressAttentionSilent
// ? Color(0xFF2891F0)
// : Colors.white70,
// ),
// foregroundColor: MaterialStateProperty.all(
// pressAttentionSilent
// ? Colors.white
//     : Colors.black38,
// ),
// elevation: MaterialStateProperty.all(
// pressAttentionSilent ? 25 : 0,
// )),
// child: Padding(
// padding: const EdgeInsets.all(5),
// child: Column(
// children: [
// SizedBox(
// height: 10,
// ),
// Icon(Icons.hearing),
// SizedBox(
// height: 5,
// ),
// Text("Silent",
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.normal)),
// SizedBox(
// height: 10,
// ),
// ],
// ),
// )),
// ],
// ),
