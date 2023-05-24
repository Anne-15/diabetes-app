import 'package:android_testing/components/app_layout.dart';
import 'package:android_testing/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/my_doctors_controllers.dart';
import '../../../models/my_doctors.dart';

class FavoriteContacts extends StatelessWidget {
  final List<MyDoctorsModel> users;
  const FavoriteContacts({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    final controllers = Get.put(GetMyDoctorsControllers());
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Favorite Contacts",
                  style: Styles.headerStyle4,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppLayout.getHeight(90),
            // color: Colors.blue,
            child: FutureBuilder<List<MyDoctorsModel>>(
              future: controllers.getAllMyDoctors(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      padding: EdgeInsets.only(left: 30.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (i, index) {
                        // final user = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => SingleChat(
                            //       user: users,
                            //     ),
                            //   ),
                            // );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
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
          ),
        ],
      ),
    );
  }
}
