//
//  ViewController.m
//  WebRTCDemo
//
//  Created by wenhua.zhang on 2020/10/16.
//

#import "ViewController.h"
#import <AVFoundation/AVCaptureDevice.h>
#import "RTCEngine.h"
#import <WebRTC/WebRTC.h>

@interface ViewController ()
{
    RTCEngine *_engine;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[RTCEngine shared] startPreview:self.view];
}



@end



