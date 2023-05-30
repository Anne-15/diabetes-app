import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/app_layout.dart';
import '../../../controllers/my_doctors_controllers.dart';
import '../../../models/my_doctors.dart';
import '../chats/specialist_chat.dart';

class CommunityPlatform extends StatelessWidget {
  const CommunityPlatform({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controllers = Get.put(GetMyDoctorsControllers());
    return SizedBox(
      height: AppLayout.getHeight(90),
      // color: Colors.blue,
      child: FutureBuilder<List<MyDoctorsModel>>(
        future: controllers.getAllMyDoctors(),
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
                            builder: (context) => SpecialistChats(user: doctor),
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
