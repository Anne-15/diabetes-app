import 'package:android_testing/components/constants.dart';
import 'package:android_testing/controllers/signup_controller.dart';
import 'package:android_testing/screens/doctors%20view/chats/individual_chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/usermodel.dart';

class RecentChat extends StatelessWidget {
  final List<UserModel> users;
  const RecentChat({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    final controllers = Get.put(SignupController());
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: FutureBuilder<List<UserModel>>(
            future: controllers.getAllUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => IndividualChat(
                                  user: snapshot.data![i],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 5.0, bottom: 5.0, right: 20.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25.0,
                                      backgroundImage: AssetImage(
                                          'assets/images/profile.png'),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data![i].fullname,
                                          style: Styles.headerStyle3,
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.45,
                                          child: Text(
                                            'Email: ${snapshot.data![i].email}',
                                            style: Styles.headerStyle4,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return Center(
                    child: Text("Something went wrong"),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
