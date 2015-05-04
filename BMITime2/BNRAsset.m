//
//  BNRAsset.m
//  BMITime2
//
//  Created by Calvin Cheng on 4/5/15.
//  Copyright (c) 2015 Hello HQ Pte. Ltd. All rights reserved.
//

#import "BNRAsset.h"

@implementation BNRAsset

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: $%u>", self.label, self.resaleValue];
}
- (void)dealloc {
    NSLog(@"deallocating %@", self);
}

@end
