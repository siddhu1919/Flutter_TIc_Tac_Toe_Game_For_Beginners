import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Controller extends GetxController {
  RxList<String> gameValue = ["", "", "", "", "", "", "", "", ""].obs;

  RxBool isWinner = false.obs;
  RxBool isX = false.obs;
  RxInt turns = 0.obs; // Number Clicks done in a single game session
  void addValue(int index) {
    if (gameValue[index] == '') {
      if (isX.value) {
        gameValue[index] = 'X';
        isX.value = !isX.value;
        turns++;
      } else {
        gameValue[index] = 'O';
        isX.value = !isX.value;
        turns++;
      }
    } else {
      print("Invalid Move");
    }
    print("Number of turns : ${turns}");
    matchDrawMessage(turns);
    checkWinner();
    if (isWinner.value == false) {
      matchDrawMessage(turns);
    }
  }

  void matchDrawMessage(turns) {
    if (turns == 9) {
      Get.defaultDialog(
        title: "Match Draw",
        confirm: Container(
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(15)),
          child: TextButton(
              onPressed: () {
                gameValue.value = ["", "", "", "", "", "", "", "", ""];
                turns.value = 0;
                Get.back();
              },
              style: TextButton.styleFrom(
                shadowColor: Colors.green,
              ),
              child: const Text(
                "Play again",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              )),
        ),
        content: const Text(
          "Better Luck Next Time 🤞",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      );
    }
  }

  void checkWinner() {
    if (gameValue[0] == gameValue[1] &&
        gameValue[0] == gameValue[2] &&
        gameValue[0] != "") {
      winnerDialogBox();
    } else if (gameValue[3] == gameValue[4] &&
        gameValue[3] == gameValue[5] &&
        gameValue[3] != "") {
      winnerDialogBox();
    } else if (gameValue[6] == gameValue[7] &&
        gameValue[6] == gameValue[8] &&
        gameValue[6] != "") {
      winnerDialogBox();
    }
    // Horzontal
    else if (gameValue[0] == gameValue[3] &&
        gameValue[0] == gameValue[6] &&
        gameValue[0] != "") {
      winnerDialogBox();
    } else if (gameValue[1] == gameValue[4] &&
        gameValue[1] == gameValue[7] &&
        gameValue[1] != "") {
      winnerDialogBox();
    } else if (gameValue[2] == gameValue[5] &&
        gameValue[2] == gameValue[8] &&
        gameValue[2] != "") {
      winnerDialogBox();

      //diagonals
    } else if (gameValue[0] == gameValue[4] &&
        gameValue[0] == gameValue[8] &&
        gameValue[0] != "") {
      winnerDialogBox();
    } else if (gameValue[2] == gameValue[4] &&
        gameValue[2] == gameValue[6] &&
        gameValue[2] != "") {
      winnerDialogBox();
    } else {
      print("Debugging");
    }
  }

  resetButton() {
    isWinner.value = false;
    isX = false.obs;
    turns = 0.obs;
    gameValue = ["", "", "", "", "", "", "", "", ""].obs;
  }

  winnerDialogBox() {
    isWinner.value = true;
    Get.defaultDialog(
        title: "🥇Winner🥇",
        content: Column(
          children: [
            const Icon(
              Icons.confirmation_num_rounded,
              size: 50,
              color: Colors.blueAccent,
            ),
            const SizedBox(height: 10),
            isX.value
                ? const Text(
                    "O Won🎉",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                : const Text(
                    "X Won🎉",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red)),
                  onPressed: () {
                    // gameValue.value = ["", "", "", "", "", "", "", "", ""];
                    // turns.value = 0;
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_left,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Go Back",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green)),
                  onPressed: () {
                    gameValue.value = ["", "", "", "", "", "", "", "", ""];
                    turns.value = 0;
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Play Again",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
