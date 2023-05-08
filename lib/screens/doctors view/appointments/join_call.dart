import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:android_testing/auth.dart';
import 'package:android_testing/components/constants.dart';
import 'package:flutter/material.dart';

class JoinVideoCall extends StatefulWidget {
  final String? channelName;
  final String? role;
  JoinVideoCall({super.key, this.role, this.channelName});

  @override
  State<JoinVideoCall> createState() => _JoinVideoCallState();
}

class _JoinVideoCallState extends State<JoinVideoCall> {
  final _users = <int>[];
  final _infoString = <String>[];
  bool camera = false;
  late RtcEngine _engine;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initForAgora();
  }

  @override
  void dispose() {
    _users.clear();
    _engine.leaveChannel();
    _engine.release();
    super.dispose();
  }

  Future<void> initForAgora() async {
    if (appId.isEmpty) {
      setState(() {
        _infoString.add("APP_ID is missing, please provide your app id");
        _infoString.add("Video call is not starting");
      });
      return;
    }
    //initAgoraRtcEngine
    _engine = createAgoraRtcEngine();
    await _engine.initialize(RtcEngineContext(appId: appId));
    await _engine.enableVideo();
    await _engine
        .setChannelProfile(ChannelProfileType.channelProfileLiveBroadcasting);

    //agoraEventHandlers
    _addAgoraEventHandlers();
    await _engine.joinChannel(
        token: token,
        channelId: widget.channelName!,
        uid: 0,
        options: ChannelMediaOptions());
  }

  void _addAgoraEventHandlers() {
    _engine.registerEventHandler(RtcEngineEventHandler(
      onError: (ErrorCodeType err, String msg) {},
      onJoinChannelSuccess: (connection, elapsed) {
        setState(() {
          final info = 'Join channel: $connection';
          _infoString.add(info);
        });
      },
      onLeaveChannel: (RtcConnection connection, RtcStats stats) {
        setState(() {
          _infoString.add('Leave channel');
          _users.clear();
        });
      },
      onUserJoined: (RtcConnection connection, int rUid, int elapsed) {
        setState(() {
          _users.add(rUid);
        });
      },
      onUserOffline:
          (RtcConnection connection, int rUid, UserOfflineReasonType reason) {
        setState(() {
          _users.removeWhere((element) => element == rUid);
        });
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment Call"),
      ),
      body: Stack(
        children: [Text("Waiting for others to join call")],
      ),
    );
  }
}

// ignore: camel_case_types, unused_element
class _toolbar extends StatefulWidget {
  // ignore: unused_element
  const _toolbar({super.key});

  @override
  State<_toolbar> createState() => _toolbarState();
}

// ignore: camel_case_types
class _toolbarState extends State<_toolbar> {
  bool muted = false;
  late RtcEngine _engine;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(vertical: 48.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {
              setState(() {
                muted = !muted;
              });
              _engine.muteLocalAudioStream(muted);
            },
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: muted ? Styles.c1 : Colors.white,
            padding: EdgeInsets.all(12.0),
            child: Icon(
              muted ? Icons.mic_off_outlined : Icons.mic,
              color: muted ? Colors.white : Styles.c1,
              size: 20.0,
            ),
          ),
          RawMaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.redAccent,
            padding: EdgeInsets.all(15.0),
            child: Icon(
              Icons.call_end,
              color: Colors.white,
              size: 35.0,
            ),
          ),
          RawMaterialButton(
            onPressed: () {
              _engine.switchCamera();
            },
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
            padding: EdgeInsets.all(12.0),
            child: Icon(
              Icons.switch_camera_outlined,
              color: Styles.c1,
              size: 20.0,
            ),
          )
        ],
      ),
    );
  }
}
