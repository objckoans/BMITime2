//
//  main.m
//  BMITime2
//
//  Created by Calvin Cheng on 3/5/15.
//  Copyright (c) 2015 Hello HQ Pte. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNREmployee *mike = [[BNREmployee alloc] init];
        [mike setWeightInKilos:96];
        [mike setHeightInMeters:1.8];
        mike.employeeID = 12;
        
        // set up the date in which mike was hired
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setYear:1976];
        [comps setMonth:10];
        [comps setDay:10];
        [comps setHour:12];
        [comps setMinute:10];
        [comps setSecond:0];
        NSDate *hiredDate = [cal dateFromComponents:comps];

        mike.hireDate = hiredDate;
        
        // show what we set earlier
        float height = [mike heightInMeters];
        int weight = [mike weightInKilos];
        NSLog(@"Mike is %.2f meters tall and weights %d kilograms and is hired on %@", height, weight, hiredDate);
        
        float bmi = [mike bodyMassIndex];
        NSLog(@"Mike has a BMI of %f has worked with us for %.2f years", bmi, [mike yearsOfEmployment]);
    }
    return 0;
}
