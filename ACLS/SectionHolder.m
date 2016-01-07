//
//  SectionHolder.m
//  ACLS
//
//  Created by Brandon Koenning on 1/2/16.
//  Copyright © 2016 Brandon Koenning. All rights reserved.
//

#import "SectionHolder.h"

@implementation SectionHolder

-(instancetype)init
{
    self = [super init];
    [self setSectionTitle:@"Section"];
    [self setList:[[NSMutableArray alloc]init]];
    return self;
}

@end
