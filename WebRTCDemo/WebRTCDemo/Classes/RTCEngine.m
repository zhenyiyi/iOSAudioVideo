//
//  RTCEngine.m
//  WebRTCDemo
//
//  Created by wenhua.zhang on 2020/10/16.
//

#import "RTCEngine.h"
#import <WebRTC/WebRTC.h>
#import <AVFoundation/AVCaptureDevice.h>

@interface RTCEngine()
{
    RTCPeerConnectionFactory *_peerConnectionFactory;
}
@end
@implementation RTCEngine

+ (instancetype)shared {
    static RTCEngine *engine;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        engine = [[RTCEngine alloc] init];
    });
    return engine;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initWebRTC];
    }
    return self;
}

- (void)initWebRTC {
    [RTCPeerConnectionFactory initialize];
    RTCDefaultVideoEncoderFactory *videoEncoder = [[RTCDefaultVideoEncoderFactory alloc] init];
    RTCDefaultVideoDecoderFactory *videoDecoder = [[RTCDefaultVideoDecoderFactory alloc] init];
    NSArray<RTCVideoCodecInfo *> * decoderInfos = [videoDecoder supportedCodecs];
    NSArray<RTCVideoCodecInfo *> * encoderInfos = [videoEncoder supportedCodecs];
    NSLog(@"encoderInfos-> %@",encoderInfos);
    NSLog(@"decoderInfos-> %@",decoderInfos);
    [videoEncoder setPreferredCodec:encoderInfos[0]];
    _peerConnectionFactory = [[RTCPeerConnectionFactory alloc] initWithEncoderFactory:videoEncoder decoderFactory:videoDecoder];
    
    NSLog(@"_peerConnectionFactory->%@", _peerConnectionFactory);
    NSLog(@"videoEncoder->%@ videoDecoder->%@",videoEncoder, videoDecoder);
}
- (void)startAudio {
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {
        NSLog(@"granted --- %d currentThread : %@",granted,NSThread.currentThread);
    }];
    
    
}

- (void)startPreview:(UIView *)view {
    NSArray<AVCaptureDevice *> *devices = [AVCaptureDevice devices];
    NSLog(@"video devices ->%@",devices);
    AVCaptureDevice *device = devices.firstObject;
    RTCVideoSource *videoSource = [_peerConnectionFactory videoSource];
    RTCCameraVideoCapturer *videoCapturer = [[RTCCameraVideoCapturer alloc] initWithDelegate:videoSource];
    AVCaptureDeviceFormat *format = [[RTCCameraVideoCapturer supportedFormatsForDevice:device] firstObject];
    [videoCapturer startCaptureWithDevice:device format:format fps:60 completionHandler:^(NSError * _Nonnull err) {
        NSLog(@"err-> %@", err);
    }];
    RTCCameraPreviewView *preview = [[RTCCameraPreviewView alloc] initWithFrame:view.bounds];
    preview.captureSession = videoCapturer.captureSession;
    [view addSubview:preview];
}

- (void)stopVideo {
    
}

@end


/**
 WebRTC implements three APIs:

 MediaStream (aka getUserMedia)
 RTCPeerConnection
 RTCDataChannel
 */



/**
 1. Get streaming audio, video or other data.
 2. Get network information such as IP addresses and ports, and exchange this with other WebRTC clients (known as peers) to enable connection, even through NATs and firewalls.
 3. Coordinate signaling communication to report errors and initiate or close sessions.
 4. Exchange information about media and client capability, such as resolution and codecs.
 5. Communicate streaming audio, video or data.
 */
