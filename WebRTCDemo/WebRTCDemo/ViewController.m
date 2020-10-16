//
//  ViewController.m
//  WebRTCDemo
//
//  Created by wenhua.zhang on 2020/10/16.
//

#import "ViewController.h"
#import <AVFoundation/AVCaptureDevice.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray<AVCaptureDevice *> *devices = [AVCaptureDevice devices];
    NSLog(@"%@",devices);
}


@end
