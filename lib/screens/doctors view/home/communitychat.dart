import 'package:android_testing/controllers/signup_controller.dart';
import 'package:android_testing/models/usermodel.dart';
import 'package:android_testing/screens/doctors%20view/chats/individual_chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/app_layout.dart';

class CommunityChat extends StatelessWidget {
  const CommunityChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controllers = Get.put(SignupController());
    return SizedBox(
      height: AppLayout.getHeight(90),
      // color: Colors.blue,
      child: FutureBuilder<List<UserModel>>(
        future: controllers.getAllUsers(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (i, index) {
                  final doctor = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IndividualChat(user: doctor),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 25.0,
                            backgroundImage:
                                AssetImage("assets/images/profile.png"),
                          ),
                          SizedBox(height: AppLayout.getHeight(6.0)),
                          Text(
                            snapshot.data![index].fullname,
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 10.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const Center(
                child: Text("Something went wrong"),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
