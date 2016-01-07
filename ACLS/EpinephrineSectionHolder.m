//
//  EpinephrineSectionHolder.m
//  ACLS
//
//  Created by Brandon Koenning on 1/2/16.
//  Copyright © 2016 Brandon Koenning. All rights reserved.
//

#import "EpinephrineSectionHolder.h"

@implementation EpinephrineSectionHolder


-(instancetype)init
{
    self = [super init];
    [self setSectionTitle:@"Epinephrine"];
    [[self list]addObject:[[EpinephrineDose alloc]init]];
    return self;
}

@end
