//
//  main.m
//  BMITime2
//
//  Created by Calvin Cheng on 3/5/15.
//  Copyright (c) 2015 Hello HQ Pte. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNRPerson *mike = [[BNRPerson alloc] init];
        [mike setWeightInKilos:96];
        [mike setHeightInMeters:1.8];
        
        // show what we set earlier
        float height = [mike heightInMeters];
        int weight = [mike weightInKilos];
        NSLog(@"Mike is %.2f meters tall and weights %d kilograms", height, weight);
        
        float bmi = [mike bodyMassIndex];
        NSLog(@"Mike has a BMI of %f", bmi);
    }
    return 0;
}
