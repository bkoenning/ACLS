//
//  DoseRecord.m
//  ACLS
//
//  Created by Brandon Koenning on 1/3/16.
//  Copyright © 2016 Brandon Koenning. All rights reserved.
//

#import "DoseRecord.h"

@implementation DoseRecord

-(instancetype)init
{
    self =[super init];
    [self setTimeGiven:[NSDate date]];
    [self setTitleString:@"Dose"];
    return self;
}
-(NSString*)timeGivenString
{
    if ([self timeGiven]){
        NSDateFormatter *format = [[NSDateFormatter alloc]init];
        [format setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"en_US_POSIX"]];
        [format setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:[[NSTimeZone localTimeZone]secondsFromGMT]]];
        [format setDateFormat:@"MM-dd-yyyy 'at' HH:mm:ss"];
        //NSLog(@"%@", [format stringFromDate:[self timeGiven]]);
        return  [format stringFromDate:[self timeGiven]];
    }
    else
        return @"";
}

@end
