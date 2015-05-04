//
//  BNREmployee.m
//  BMITime2
//
//  Created by Calvin Cheng on 3/5/15.
//  Copyright (c) 2015 Hello HQ Pte. Ltd. All rights reserved.
//

#import "BNREmployee.h"
#import "BNRAsset.h"    // We don't use forward declaration in implementation file.

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

// methods that helps us compute assets relating to an Employee

- (void)setAssets:(NSArray *)a {
    _assets = [a mutableCopy];
}

- (NSArray *)assets {
    return [_assets copy];
}

- (void)addAsset:(BNRAsset *)a {
    if (!_assets) {
        _assets = [[NSMutableArray alloc] init];
    }
    [_assets addObject:a];
}
- (unsigned int)valueOfAssets {
    unsigned int sum = 0;
    for (BNRAsset *a in _assets) {
        sum += [a resaleValue];
    }
    return sum;
}

@end
