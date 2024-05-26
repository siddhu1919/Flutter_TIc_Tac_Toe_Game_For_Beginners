// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoegame/controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());
    return Scaffold(
      backgroundColor: Colors.green,
      // appBar: AppBar(
      //   title: Center(
      //       child: const Text(
      //     "Tic Tac Toe",
      //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      //   )),
      //   backgroundColor: Colors.blueAccent,
      // ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ignore: avoid_unnecessary_containers
                Obx(
                  () => Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    decoration: BoxDecoration(
                        color: controller.isX.value == false
                            ? Colors.blueAccent
                            : Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "O",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                Obx(
                  () => Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    decoration: BoxDecoration(
                        color: controller.isX.value == true
                            ? Colors.blueAccent
                            : Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "X",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // ignore: avoid_print
                        // print(index); For Debug

                        controller.addValue(index);
                      },
                      child: Container(
                        margin: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Obx(() => Text(
                                  controller.gameValue[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50),
                                ))),
                      ),
                    );
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
