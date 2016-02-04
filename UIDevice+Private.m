//
//  UIDevice+Private.m
//  bubblewrap2
//
//  Created by  John Cui on 2/4/16.
//  Copyright © 2016  John Cui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIDevice+Private.h"
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"

@implementation UIDevice (Private)

- (UITapticEngine *)tapticEngine
{
    return [self _tapticEngine];
}

@end

#pragma clang diagnostic pop
