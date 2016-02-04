//
//  TapticEngine.m
//  bubblewrap2
//
//  Created by  John Cui on 2/4/16.
//  Copyright © 2016  John Cui. All rights reserved.
//


#import <Foundation/Foundation.h>

#import "UITapticEngine.h"
#import "UIDevice+Private.h"

#import "TapticEngine.h"

@implementation TapticEngine

+ (void)load
{
    UITapticEngine *tapticEngine = [UIDevice currentDevice]._tapticEngine;
    /*
     [tapticEngine aspect_hookSelector:@selector(actuateFeedback:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> arg1){
     NSLog(@"actuateFeedback: %@", arg1.arguments);
     }error:nil];
     
     [tapticEngine aspect_hookSelector:@selector(endUsingFeedback:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> arg1){
     NSLog(@"endUsingFeedback: %@", arg1.arguments);
     }error:nil];
     
     [tapticEngine aspect_hookSelector:@selector(prepareUsingFeedback:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> arg1){
     NSLog(@"prepareUsingFeedback: %@", arg1.arguments);
     }error:nil];
     */
}

@end
