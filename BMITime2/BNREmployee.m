//
//  BNREmployee.m
//  BMITime2
//
//  Created by Calvin Cheng on 3/5/15.
//  Copyright (c) 2015 Hello HQ Pte. Ltd. All rights reserved.
//

#import "BNREmployee.h"

@implementation BNREmployee

- (double)yearsOfEmployment {
  
    if (self.hireDate) {
        NSLog(@"Computing years of employment from hireDate");
        NSDate *now = [NSDate date];
        NSTimeInterval secs = [now timeIntervalSinceDate:self.hireDate];
        return secs / 31557600.0;   // seconds per year
    } else {
        NSLog(@"No hire date");
        return 0;
    }
};

@end
