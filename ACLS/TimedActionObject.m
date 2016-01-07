//
//  TimedActionObject.m
//  ACLS
//
//  Created by Brandon Koenning on 1/6/16.
//  Copyright © 2016 Brandon Koenning. All rights reserved.
//

#import "TimedActionObject.h"

@implementation TimedActionObject

@synthesize timeStarted, title, durationTimer, secondsSinceLast;

-(instancetype)init
{
    self = [super init];
    [self setTimeStarted:nil];
    [self setDurationTimer:nil];
    [self setSecondsSinceLast:0];
    [self setTitle:@"Timed Action Object"];
    return self;
}

-(void)start
{
    [self setTimeStarted:[NSDate date]];
    [self setDurationTimer:[NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateSecondsSinceLast) userInfo:nil repeats:YES]];
    
}

-(void)updateSecondsSinceLast
{
    secondsSinceLast++;
}

-(void)stop
{
    [self setDurationTimer:nil];
}

-(NSString*)timeStartedString
{
    if ([self timeStarted]){
        NSDateFormatter *format = [[NSDateFormatter alloc]init];
        [format setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"en_US_POSIX"]];
        [format setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:[[NSTimeZone localTimeZone]secondsFromGMT]]];
        [format setDateFormat:@"MM-dd-yyyy 'at' HH:mm:ss"];
        //NSLog(@"%@", [format stringFromDate:[self timeGiven]]);
        return  [format stringFromDate:[self timeStarted]];
    }
    else
        return @"No time started";
}

-(NSString*)timeSinceLastString
{
    
    int seconds = secondsSinceLast % 60;
    int minutes = secondsSinceLast / 60;
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




@end
