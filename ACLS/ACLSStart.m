//
//  ACLSStart.m
//  ACLS
//
//  Created by Brandon Koenning on 12/26/15.
//  Copyright © 2015 Brandon Koenning. All rights reserved.
//

#import "ACLSStart.h"

@implementation ACLSStart;

@synthesize startTime,titleString, codeTimer, secondsInCode;

-(instancetype)init
{
    self = [super init];
    [self setStartTime:nil];
    [self setCodeTimer:nil];
    [self setTitleString:@"Start Code"];
    [self setSecondsInCode:0];
    return self;
}

-(NSString*)startTimeString
{
    if ([self startTime]){
        NSDateFormatter *format = [[NSDateFormatter alloc]init];
        [format setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"en_US_POSIX"]];
        [format setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:[[NSTimeZone localTimeZone]secondsFromGMT]]];
        [format setDateFormat:@"MM-dd-yyyy 'at' HH:mm:ss"];
        //NSLog(@"%@", [format stringFromDate:[self startTime]]);
        return  [format stringFromDate:[self startTime]];
    }
    else
        return @"";
}

-(void)start
{
    if (![self startTime]){
        [self setStartTime:[NSDate date]];
    }
    if (![self codeTimer]){
        [self setCodeTimer:[NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateSeconds) userInfo:nil repeats:YES]];
    }
}

-(void)updateSeconds
{
    secondsInCode++;
}

-(NSString*)timeInCode
{
    int seconds = secondsInCode % 60;
    int minutes = secondsInCode / 60;
    NSString *secondString, *minuteString;
    if (seconds < 10)
        secondString = [NSString stringWithFormat:@"0%i",seconds];
    else
        secondString = [NSString stringWithFormat:@"%i", seconds];
    if (minutes < 10)
        minuteString = [NSString stringWithFormat:@"0%i", minutes];
    else
        minuteString = [NSString stringWithFormat:@"%i", minutes];
    
    return [NSString stringWithFormat:@"%@:%@", minuteString, secondString];
}

-(BOOL)isStarted
{
    return [self startTime];
}

@end
