//
//  StartSectionHolder.m
//  ACLS
//
//  Created by Brandon Koenning on 1/2/16.
//  Copyright © 2016 Brandon Koenning. All rights reserved.
//

#import "StartSectionHolder.h"
#import "ACLSStart.h"

@implementation StartSectionHolder

-(instancetype)init
{
    self = [super init];
    [self setSectionTitle:@"Start"];
    [[self list]addObject:[[ACLSStart alloc]init]];
    return self;
}

@end
