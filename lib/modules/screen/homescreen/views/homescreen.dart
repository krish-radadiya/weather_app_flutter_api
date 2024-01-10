// import 'package:flutter/material.dart';
//
// class homescreen extends StatelessWidget {
//   const homescreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade200,
//       appBar: AppBar(
//         backgroundColor: Colors.grey.shade100,
//         elevation: 0,
//         title: const Text(
//           "weather",
//           style: TextStyle(
//             fontSize: 22,
//             color: Colors.black,
//           ),
//         ),
//         leading: IconButton(
//           onPressed: () {},
//           icon: const Icon(
//             Icons.menu,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.pushNamed(
//                 context,
//                 'search',
//               );
//             },
//             icon: const Icon(
//               Icons.search,
//             ),
//           ),
//         ],
//         centerTitle: true,
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             Expanded(
//               flex: 4,
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.pushNamed(
//                     context,
//                     'details',
//                   );
//                 },
//                 child: Container(
//                   margin: const EdgeInsets.only(
//                     left: 30,
//                     right: 30,
//                     top: 10,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(
//                       30,
//                     ),
//                     border: Border.all(
//                       width: 1,
//                       color: Colors.white10,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Container(
//                 padding: const EdgeInsets.only(
//                   left: 40,
//                 ),
//                 child: const Row(
//                   children: [
//                     Text(
//                       "Forecast",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 6,
//               child: Container(
//                 margin: const EdgeInsets.only(
//                   left: 30,
//                   right: 30,
//                   bottom: 20,
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(
//                     30,
//                   ),
//                   color: Colors.white,
//                   border: Border.all(
//                     width: 1,
//                     color: Colors.white10,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/helpers/apihelpers.dart';
import '../../../../utils/model/api_model.dart';
import '../Provider/platefrom.dart';
import '../Provider/theme_provider.dart';

class home_Screen extends StatefulWidget {
  const home_Screen({super.key});

  @override
  State<home_Screen> createState() => _home_ScreenState();
}

class _home_ScreenState extends State<home_Screen> {
  String titl = "Surat";

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Connectivity().onConnectivityChanged,
      builder: (
        BuildContext context,
        AsyncSnapshot<ConnectivityResult> snapshot,
      ) {
        return (snapshot.data == ConnectivityResult.mobile ||
                snapshot.data == ConnectivityResult.wifi)
            ? Scaffold(
                body: FutureBuilder(
                    future: Apihelper.api.getdata(search: titl),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      } else if (snapshot.hasData) {
                        api_model? apimodel = snapshot.data;
                        return Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    (Provider.of<themeprovider>(context,
                                                    listen: true)
                                                .theme
                                                .isdark ==
                                            true)
                                        ? "https://img.freepik.com/free-vector/gorgeous-clouds-background-with-blue-sky-design_1017-25501.jpg"
                                        : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHeCSVsOBVZFcUHIaUK4sItVXgpN1WfroOPl94BTKNoDPdHG8FkyRVd5LOsARTOn9LVA0&usqp=CAU ",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on_sharp,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "${apimodel?.location['name']}, ${apimodel?.location['country']}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 22),
                                          ),
                                          const Spacer(),
                                          IconButton(
                                            onPressed: () {
                                              Provider.of<themeprovider>(
                                                      context,
                                                      listen: false)
                                                  .changetheme();
                                            },
                                            icon: const Icon(
                                              Icons.bedtime_sharp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          "Today, ${apimodel?.forecast['forecastday'][0]['date']}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 130,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Text(
                                          "${apimodel?.current['temp_c']}℃",
                                          style: const TextStyle(
                                            fontSize: 35,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.25,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: const EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                const Text(
                                                  "Feelslike",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white),
                                                ),
                                                const Text("℃",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white)),
                                                Text(
                                                    "${apimodel?.current['feelslike_c']}",
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white)),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                const Text(
                                                  "Wind",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white),
                                                ),
                                                const Icon(
                                                  Icons.air,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                    "${apimodel?.current['wind_kph']}",
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white)),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                const Text(
                                                  "Cloud",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white),
                                                ),
                                                const Icon(
                                                  Icons.cloud,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                    "${apimodel?.current['cloud']}",
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white)),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                const Text(
                                                  "Humidity",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white),
                                                ),
                                                const Icon(
                                                  Icons.water_drop,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                    "${apimodel?.current['humidity']}",
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: 24,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) =>
                                              Container(
                                            height: 100,
                                            width: 100,
                                            margin: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "${index}:00",
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white),
                                                ),
                                                Image.network(
                                                    "http:${apimodel?.forecast['forecastday'][0]['hour'][index]['condition']['icon']}"),
                                                Text(
                                                    "${apimodel?.forecast['forecastday'][0]['hour'][index]['temp_c']}℃",
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        );
                      }
                      return Center(
                        child: Container(
                          height: 400,
                          width: 400,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://cdn.dribbble.com/users/205136/screenshots/2582152/ae-fun.gif",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }),
              )
            : Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: Container(
                    height: 450,
                    width: 500,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("lib/Assets/1.gif"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
