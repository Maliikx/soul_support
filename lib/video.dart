import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:soul_support/screens/video/constant/const.dart';



class video extends StatefulWidget {
  const video({super.key});

  @override
  State<video> createState() => _videoState();
}

class _videoState extends State<video> {
  @override
  void initState() {
    initAgora();
    super.initState();
  }

  @override
  void dispose() {
    _cleanupAgoraEngine();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: _remoteVideo(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 100,
              height: 150,
              child: Center(
                child: _localUserJoined
                    ? AgoraVideoView(
                        controller: VideoViewController(
                          rtcEngine: _engine,
                          canvas: const VideoCanvas(uid: 0),
                        ),
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  late RtcEngine _engine;
  int? _remoteUid;
  bool _localUserJoined = false;

  
  Future<void> initAgora() async {
  // Request permissions
  await [Permission.microphone, Permission.camera].request();

  // Initialize the engine
  _engine = createAgoraRtcEngine();
  await _engine.initialize(RtcEngineContext(
    appId: appId,
    channelProfile: ChannelProfileType.channelProfileCommunication,
  ));

  await _engine.enableVideo();
  await _engine.startPreview();

  // Register event handler
  _engine.registerEventHandler(
    RtcEngineEventHandler(
      onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
        debugPrint("Local user ${connection.localUid} joined");
        setState(() => _localUserJoined = true);
      },
      onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
        debugPrint("Remote user $remoteUid joined");
        setState(() => _remoteUid = remoteUid);
      },
      onUserOffline: (RtcConnection connection, int remoteUid, UserOfflineReasonType reason) {
        debugPrint("Remote user $remoteUid left");
        setState(() => _remoteUid = null);
      },
    ),
  );

  // Join the channel
  await _engine.joinChannel(
    token: token,
    channelId: channel,
    options: const ChannelMediaOptions(
      autoSubscribeVideo: true,
      autoSubscribeAudio: true,
      publishCameraTrack: true,
      publishMicrophoneTrack: true,
      clientRoleType: ClientRoleType.clientRoleBroadcaster,
    ),
    uid: 0,
  );
}


  // If a remote user has joined, render their video, else display a waiting message
  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine, // Uses the Agora engine instance
          canvas: VideoCanvas(uid: _remoteUid), // Binds the remote user's video
          connection:
              const RtcConnection(channelId: channel), // Specifies the channel
        ),
      );
    } else {
      return const Text(
        'Waiting for remote user to join...',
        textAlign: TextAlign.center,
      );
    }
  }

  // Leaves the channel and releases resources
  Future<void> _cleanupAgoraEngine() async {
    await _engine.leaveChannel();
    await _engine.release();
  }
}
