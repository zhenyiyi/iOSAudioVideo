//
//  RTCEngine.m
//  WebRTCDemo
//
//  Created by wenhua.zhang on 2020/10/16.
//

#import "RTCEngine.h"
#import <WebRTC/WebRTC.h>
#import <AVFoundation/AVCaptureDevice.h>

@implementation RTCEngine

- (void)startAudio {
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {
        NSLog(@"granted --- %d currentThread : %@",granted,NSThread.currentThread);
    }];
}

- (void)startVideo {
    
}

@end
