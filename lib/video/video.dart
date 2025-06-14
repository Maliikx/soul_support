// // video_call_screen.dart
// import 'dart:async';

// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:flutter_application_1/services/api_service.dart';
// import 'package:flutter_application_1/video/constant/const.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';

// class VideoCallScreen extends StatefulWidget {
//   final String sessionId;
//   final bool isDoctor;
//   final int userId;
  
//   const VideoCallScreen({
//     super.key,
//     required this.sessionId,
//     required this.isDoctor,
//     required this.userId,
//   });

//   @override
//   State<VideoCallScreen> createState() => _VideoCallScreenState();
// }

// class _VideoCallScreenState extends State<VideoCallScreen> {
//   late RtcEngine _engine;
//   int? _remoteUid;
//   bool _localUserJoined = false;
//   bool _isLoading = true;
//   String _callStatus = 'Connecting...';

//   @override
//   void initState() {
//     super.initState();
//     _initializeCall();
//   }

// Future<void> _initializeCall() async {
//   try {
//     debugPrint('Initializing video call...');
    
//     // 1. Permissions
//     debugPrint('Requesting permissions...');
//     final micStatus = await Permission.microphone.request();
//     final cameraStatus = await Permission.camera.request();
    
//     if (!micStatus.isGranted || !cameraStatus.isGranted) {
//       throw Exception('Permissions not granted');
//     }

//     // 2. Get token
//     debugPrint('Requesting Agora token...');
//     final tokenData = await ApiService.getSessionToken(
//       widget.sessionId,
//       widget.userId,
//     ).timeout(const Duration(seconds: 10));

//     debugPrint('Token received: ${tokenData['token']?.substring(0, 10)}...');
//     debugPrint('Channel: ${tokenData['channel']}');

//     // 3. Initialize engine
//     debugPrint('Initializing Agora engine...');
//     _engine = createAgoraRtcEngine();
//     await _engine.initialize(RtcEngineContext(
//       appId: tokenData['appId'] ?? appId,
//       channelProfile: ChannelProfileType.channelProfileCommunication,
//       logConfig: LogConfig(level: LogLevel.logLevelInfo),
//     ));

//     // Enable video
//     debugPrint('Enabling video...');
//     await _engine.enableVideo();
//     await _engine.startPreview();

//     // Setup event handlers
//     debugPrint('Setting up event handlers...');
//     _engine.registerEventHandler(
//       RtcEngineEventHandler(
//         onJoinChannelSuccess: (connection, elapsed) {
//           debugPrint('JOINED CHANNEL SUCCESS');
//           setState(() {
//             _localUserJoined = true;
//             _callStatus = 'Waiting for participant...';
//             _isLoading = false;
//           });
//         },
//         // ... other handlers ...
//       ),
//     );

//     // Join channel
//     debugPrint('Joining channel...');
//     await _engine.joinChannel(
//       token: tokenData['token'],
//       channelId: tokenData['channel'],
//       uid: widget.userId,
//       options: const ChannelMediaOptions(
//         clientRoleType: ClientRoleType.clientRoleBroadcaster,
//         channelProfile: ChannelProfileType.channelProfileCommunication,
//         publishCameraTrack: true,
//         publishMicrophoneTrack: true,
//       ),
//     );

//   } on TimeoutException {
//     debugPrint('Timeout during initialization');
//     // Handle timeout
//   } catch (e) {
//     debugPrint('Initialization error: $e');
//     // Handle error
//   }
// }

//   Future<void> _endCall() async {
//     try {
//       // Update session status first
//       await ApiService.updateSessionStatus(
//         widget.sessionId, 
//         'completed'
//       );
      
//       // Leave channel
//       await _engine.leaveChannel();
//       await _engine.release();
      
//       if (mounted && Navigator.canPop(context)) Navigator.pop(context);
      
//     } catch (e) {
//       debugPrint('Error ending call: $e');
//       if (mounted && Navigator.canPop(context)) Navigator.pop(context);
//     }
//   }

//   @override
//   void dispose() {
//     _endCall();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_callStatus),
//       ),
//       body: Stack(
//         children: [
//           // Remote video
//           Center(child: _renderRemoteVideo()),

//           // Local preview
//           Positioned(
//             top: 20,
//             right: 20,
//             child: Container(
//               width: 120,
//               height: 180,
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.white, width: 1),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: _localUserJoined
//                   ? AgoraVideoView(
//                       controller: VideoViewController(
//                         rtcEngine: _engine,
//                         canvas: const VideoCanvas(uid: 0),
//                       ),
//                     )
//                   : const Center(child: CircularProgressIndicator()),
//             ),
//           ),

//           // End call button
//           Positioned(
//             bottom: 40,
//             left: 0,
//             right: 0,
//             child: Center(
//               child: ElevatedButton.icon(
//                 onPressed: _endCall,
//                 icon: const Icon(Icons.call_end, color: Colors.white),
//                 label: const Text('End Session'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red,
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 24,
//                     vertical: 12,
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           // Loading overlay
//           if (_isLoading)
//             const Center(child: CircularProgressIndicator()),
//         ],
//       ),
//     );
//   }

//   Widget _renderRemoteVideo() {
//     if (_remoteUid != null) {
//       return AgoraVideoView(
//         controller: VideoViewController.remote(
//           rtcEngine: _engine,
//           canvas: VideoCanvas(uid: _remoteUid),
//           connection: RtcConnection(
//             channelId: 'therapy_${widget.sessionId}',
//           ),
//         ),
//       );
//     } else {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const CircularProgressIndicator(),
//           const SizedBox(height: 20),
//           Text(_callStatus),
//         ],
//       );
//     }
//   }
// }

// video_call_screen.dart
import 'dart:async';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/api_service.dart';
import 'package:flutter_application_1/video/constant/const.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoCallScreen extends StatefulWidget {
  final String sessionId;
  final bool isDoctor;
  final int userId;

  const VideoCallScreen({
    super.key,
    required this.sessionId,
    required this.isDoctor,
    required this.userId,
  });

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late RtcEngine _engine;
  int? _remoteUid;
  bool _localUserJoined = false;
  bool _isLoading = true;
  String _callStatus = 'Connecting...';

  @override
  void initState() {
    super.initState();
    _initializeCall();
  }

  Future<void> _initializeCall() async {
    try {
      final micStatus = await Permission.microphone.request();
      final camStatus = await Permission.camera.request();
      if (!micStatus.isGranted || !camStatus.isGranted) {
        throw Exception('Permissions not granted');
      }

      final tokenData = await ApiService.getSessionToken(
        widget.sessionId,
        widget.userId,
      );

      _engine = createAgoraRtcEngine();
      await _engine.initialize(RtcEngineContext(
        appId: tokenData['appId'] ?? appId,
        channelProfile: ChannelProfileType.channelProfileCommunication,
      ));

      await _engine.enableVideo();
      await _engine.startPreview();

      _engine.registerEventHandler(
        RtcEngineEventHandler(
          onJoinChannelSuccess: (connection, elapsed) {
            setState(() {
              _localUserJoined = true;
              _callStatus = 'Waiting for doctor...';
              _isLoading = false;
            });
          },
          onUserJoined: (connection, remoteUid, elapsed) {
            setState(() {
              _remoteUid = remoteUid;
              _callStatus = 'In Session';
            });
          },
          onUserOffline: (connection, remoteUid, reason) {
            setState(() {
              _callStatus = 'Doctor left';
              _remoteUid = null;
            });
          },
        ),
      );

      await _engine.joinChannel(
        token: tokenData['token'],
        channelId: tokenData['channel'],
        uid: widget.userId,
        options: const ChannelMediaOptions(
          clientRoleType: ClientRoleType.clientRoleBroadcaster,
          channelProfile: ChannelProfileType.channelProfileCommunication,
          publishCameraTrack: true,
          publishMicrophoneTrack: true,
        ),
      );
    } catch (e) {
      debugPrint('Video call init failed: $e');
    }
  }

  Future<void> _endCall() async {
    await ApiService.updateSessionStatus(widget.sessionId, 'completed');
    await _engine.leaveChannel();
    await _engine.release();
    if (mounted && Navigator.canPop(context)) Navigator.pop(context);
  }

  @override
  void dispose() {
    _endCall();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_callStatus)),
      body: Stack(
        children: [
          Center(child: _renderRemoteVideo()),
          Positioned(
            top: 20,
            right: 20,
            child: _localUserJoined
                ? SizedBox(
                    width: 120,
                    height: 180,
                    child: AgoraVideoView(
                      controller: VideoViewController(
                        rtcEngine: _engine,
                        canvas: const VideoCanvas(uid: 0),
                      ),
                    ),
                  )
                : const CircularProgressIndicator(),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton.icon(
                onPressed: _endCall,
                icon: const Icon(Icons.call_end, color: Colors.white),
                label: const Text('End Session'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ),
          ),
          if (_isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  Widget _renderRemoteVideo() {
    if (_remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: _remoteUid),
          connection: RtcConnection(channelId: widget.sessionId),
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 20),
          Text(_callStatus),
        ],
      );
    }
  }
}
