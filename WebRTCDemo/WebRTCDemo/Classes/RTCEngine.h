//
//  RTCEngine.h
//  WebRTCDemo
//
//  Created by wenhua.zhang on 2020/10/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RTCEngine : NSObject

+ (instancetype)shared;

- (void)startAudio;

- (void)startVideoWithView:(UIView *)view;

- (void)startPreview:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
