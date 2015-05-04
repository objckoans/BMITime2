//
//  main.m
//  BMITime2
//
//  Created by Calvin Cheng on 3/5/15.
//  Copyright (c) 2015 Hello HQ Pte. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"
#import "BNRAsset.h"

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
        
        // Create a bunch of employee objects, e with varying values based on i, and keep them in the employees NSMutableArray
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        for (int i = 0; i < 10; i++) {
            BNREmployee *e = [[BNREmployee alloc] init];
            e.weightInKilos = 90 + i;
            e.heightInMeters = 1.8 - i/10.0;
            e.employeeID = i;
            [employees addObject:e];
        }
        
        // Create a bunch of assets and assign to random employee
        for (int i = 0; i < 10; i++) {
            
            // Instantiate the asset
            BNRAsset *asset = [[BNRAsset alloc] init];
            NSString *currentLabel = [NSString stringWithFormat:@"Laptop %d", i];
            asset.label = currentLabel;
            asset.resaleValue = 350 + i * 17;
            
            // Assign the asset to random employee
            NSUInteger randomIndex = random() % [employees count];
            BNREmployee *randomEmployee = [employees objectAtIndex:randomIndex];
            [randomEmployee addAsset:asset];
        }
        
        NSLog(@"Employees: %@", employees);
        
        // Watch what happens when we dealloc the parent object (the related object(s)) are also dealloc
        NSLog(@"Giving up ownership of one employee");
        [employees removeObjectAtIndex:5];
        NSLog(@"Giving up ownership of arrays");
        employees = nil;
        
    }
    return 0;
}
