import 'package:android_testing/components/constants.dart';
import 'package:android_testing/controllers/get_doctors_controllers.dart';
import 'package:android_testing/models/doctormodel.dart';
import 'package:android_testing/screens/patientview/chats/single_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentChats extends StatelessWidget {
  final List<DoctorUserModel> users;
  const RecentChats({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    final controllers = Get.put(DoctorSignupController());
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
          child: FutureBuilder<List<DoctorUserModel>>(
            future: controllers.getAllDoctors(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, i) {
                        final user = snapshot.data![i];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SingleChat(user: user),
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
                                          style: Styles.headerStyle4,
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
                                            style: Styles.textStyle,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('12:45'),
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
