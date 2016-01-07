//
//  DrugDose.m
//  ACLS
//
//  Created by Brandon Koenning on 1/3/16.
//  Copyright © 2016 Brandon Koenning. All rights reserved.
//

#import "DrugDose.h"

@implementation DrugDose

-(instancetype)init
{
    self = [super init];
    [self setTitleString:@"Drug dose"];
    [self setTimeGiven:nil];
    [self setPreviousTimeGiven:nil];
    [self setDosesGiven:0];
    return self;
}


-(NSString*)timeLastGivenString
{
    if ([self timeGiven]){
        
        NSDateFormatter *format = [[NSDateFormatter alloc]init];
        [format setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"en_US_POSIX"]];
        [format setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:[[NSTimeZone localTimeZone]secondsFromGMT]]];
        
        [format setDateFormat:@"MM-dd-yyyy 'at' HH:mm:ss"];
        NSLog(@"%@", [format stringFromDate:[self timeGiven]]);
        return  [format stringFromDate:[self timeGiven]];
    }
    else
        return @"";
}

-(void)addDose
{
    [self setDosesGiven:[self dosesGiven] + 1];
    if ([self dosesGiven] > 1)
        [self setPreviousTimeGiven:[self timeGiven]];
    [self setTimeGiven:[NSDate date]];
}

@end
