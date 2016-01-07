//
//  ACLSTableViewController.m
//  ACLS
//
//  Created by Brandon Koenning on 12/26/15.
//  Copyright © 2015 Brandon Koenning. All rights reserved.
//

#import "ACLSTableViewController.h"


@interface ACLSTableViewController()
{
    //int epinephineTimeInSeconds;
    NSMutableArray *sectionHolders;
    NSTimer *timerForLabels;
}

@property (nonatomic, weak) UILabel *timeInCodeLabel;
@property (nonatomic,weak) UILabel *epiTimeLabel;

@end

@implementation ACLSTableViewController



-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    SectionHolder *obj = [sectionHolders objectAtIndex:section];
    
    if (obj)
        return [obj sectionTitle];
    else
        return @"nil section";
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SectionHolder *sectionObj = [sectionHolders objectAtIndex:indexPath.section];
    NSObject *rowObj;
    
    if ([sectionObj ])
    
    if ([sectionObj isKindOfClass:[StartSectionHolder class]]){
        StartSectionHolder *s = (StartSectionHolder*)sectionObj;
        rowObj = [[s list]objectAtIndex:indexPath.row];
        if ([rowObj isKindOfClass:[ACLSStart class]]){
            ACLSStart *aclsObj = (ACLSStart*)rowObj;
            StartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"startCell"];
            [[cell topLeftLabel]setText:[aclsObj titleString]];
            _timeInCodeLabel = [cell topRightLabel];
            if ([aclsObj isStarted]){
                [[cell bottomLeftLabel]setText:[NSString stringWithFormat:@"%@ %@", @"Code started:  ", [aclsObj startTimeString]]];
                [[cell bottomLeftLabel]setHidden:NO];
                [[cell topRightLabel]setHidden:NO];
            }
            else
            {
                [[cell bottomLeftLabel]setHidden:YES];
                [[cell topRightLabel]setHidden:YES];
            }
            return cell;
        }
    }
    else if ([sectionObj isKindOfClass:[EpinephrineSectionHolder class]]){
        EpinephrineSectionHolder *es = (EpinephrineSectionHolder*)sectionObj;
        rowObj = [[es list]objectAtIndex:indexPath.row];
        if ([rowObj isKindOfClass:[EpinephrineDose class]]){
            EpinephrineDose *epiObj = (EpinephrineDose*)rowObj;
            DrugDoseCell *epiCell = [tableView dequeueReusableCellWithIdentifier:@"drugDoseCell"];
            [[epiCell titleLabel]setText:[epiObj titleString]];
            _epiTimeLabel = [epiCell timerLabel];
            if ([[es list]count] > 0){
                [[epiCell timerLabel]setHidden:NO];
            }
            else
                [[epiCell timerLabel]setHidden:YES];
            return epiCell;
        }
        else if ([rowObj isKindOfClass:[EpinephrineDoseRecord class]]){
            EpinephrineDoseRecord *er = (EpinephrineDoseRecord*)rowObj;
            DrugRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"drugRecordCell"];
            [[cell drugTitleLabel]setText:[er titleString]];
            [[cell whenGivenLabel]setText:[[er timeGiven]description]];
            
            return  cell;
            
        }
        
    }
    
    /*
    if ([obj isKindOfClass:[ACLSStart class]]){
        ACLSStart *aclsObj = (ACLSStart*)obj;
        StartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"startCell"];
        [[cell topLeftLabel]setText:[aclsObj titleString]];
        _timeInCodeLabel = [cell topRightLabel];
        if ([aclsObj startTime]){
            [[cell bottomLeftLabel]setText:[NSString stringWithFormat:@"%@ %@", @"Code started:  ", [[aclsObj startTime]description]]];
            [[cell bottomLeftLabel]setHidden:NO];
            [[cell topRightLabel]setHidden:NO];
        }
        else
        {
            [[cell bottomLeftLabel]setHidden:YES];
            [[cell topRightLabel]setHidden:YES];
        }
        return cell;
    }
    else if ([obj isKindOfClass:[EpinephrineDose class]]){
        EpinephrineDose *epiDoseObj = (EpinephrineDose*)obj;
        DrugDoseCell *epiCell = [tableView dequeueReusableCellWithIdentifier:@"drugDoseCell"];
        [[epiCell titleLabel]setText:[epiDoseObj titleString]];
        _epiTimeLabel = [epiCell timerLabel];
        if ([epiDoseObj timeLastGiven]){
            [[epiCell timerLabel]setHidden:NO];
        }
        else{
            [[epiCell timerLabel]setHidden:YES];
        }

        
        return  epiCell;
    }
    
    else if ([obj isKindOfClass:[EpinephrineDoseRecord class]]){
        EpinephrineDoseRecord *epiRecord = (EpinephrineDoseRecord*)obj;
        DrugRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"drugRecordCell"];
        [[cell drugTitleLabel]setText:[epiRecord titleString]];
        [[cell whenGivenLabel]setText:[[epiRecord timeGiven]description]];
        
        return  cell;
        
    }
     */
    return nil;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSObject *obj = [sectionHolders objectAtIndex:indexPath.section];
    
    [cell setBackgroundColor:[UIColor clearColor]];
    
    CAGradientLayer *grad = [CAGradientLayer layer];
    grad.frame = cell.bounds;
    if ([obj isKindOfClass:[StartSectionHolder class]]){
        grad.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:255.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0] CGColor], (id)[[UIColor colorWithRed:255.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0] CGColor], nil];
    }
    else if ([obj isKindOfClass:[EpinephrineSectionHolder class]]){
                grad.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:229.0/255.0 alpha:1.0] CGColor], (id)[[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:128.0/255.0 alpha:1.0] CGColor], nil];
        
    }
    
    [cell setBackgroundView:[[UIView alloc] init]];
    [cell.backgroundView.layer insertSublayer:grad atIndex:0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




-(void)viewDidAppear:(BOOL)animated
{
    [[self tableView]reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SectionHolder *sectionObj = [sectionHolders objectAtIndex:indexPath.section];
    NSObject *rowObj;
    if ([sectionObj isKindOfClass:[StartSectionHolder class]]){
        StartSectionHolder *sa = (StartSectionHolder*)sectionObj;
        rowObj = [[sa list]objectAtIndex:indexPath.row];
        if ([rowObj isKindOfClass:[ACLSStart class]]){
            ACLSStart *aclsObj = (ACLSStart*)rowObj;
            if (![aclsObj isStarted]){
                [aclsObj start];
                timerForLabels = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateLabels) userInfo:nil repeats:YES];
            }
            [sectionHolders addObject:[[EpinephrineSectionHolder alloc]init]];
            [[self tableView]reloadData];
        }
    }
    if ([sectionObj isKindOfClass:[EpinephrineSectionHolder class]]){
        EpinephrineSectionHolder *es = (EpinephrineSectionHolder*)sectionObj;
        rowObj = [[es list]objectAtIndex:indexPath.row];
        if ([rowObj isKindOfClass:[EpinephrineDose class]]){
            //EpinephrineDose *ed = (EpinephrineDose*)rowObj;
            //[ed addDose];
            [[es list]addObject:[[EpinephrineDoseRecord alloc]init]];
            [[self tableView]reloadData];
        }
    }
    
    /*
    if ([obj isKindOfClass:[ACLSStart class]] && !codeTimer){
        ACLSStart *aclsObj = (ACLSStart*)obj;
        [aclsObj setStartTime:[NSDate date]];
        codeTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCodeTimerLabel) userInfo:nil repeats:YES];
        [objects addObject:[[EpinephrineDose alloc]init]];
        [[self tableView]reloadData];
    }
    else if ([obj isKindOfClass:[EpinephrineDose class]]){
        EpinephrineDose *epiDoseObj = (EpinephrineDose*)obj;
        [epiDoseObj setTimeLastGiven:[NSDate date]];
        epinephineTimeInSeconds = 0;
        if (!epiTimer){
            epiTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateEpiTimerLabel) userInfo:nil repeats:YES];
        }
        [epinephrineDoseRecords addObject:[[EpinephrineDoseRecord alloc]init]];
        NSUInteger num = [epinephrineDoseRecords count] - 1;
        [objects addObject:[epinephrineDoseRecords objectAtIndex:num]];
        [[self tableView]reloadData];
    }
     */
}


/*
-(void)updateEpiTimerLabel
{
    epinephineTimeInSeconds++;
    if (_epiTimeLabel){
        int min = epinephineTimeInSeconds / 60;
        int seconds = epinephineTimeInSeconds % 60;
        NSString *minString;
        NSString *secString;
        if (min < 10)
            minString = [NSString stringWithFormat:@"%i%i", 0, min];
        else
            minString = [NSString stringWithFormat:@"%i", min];
        if (seconds < 10)
            secString = [NSString stringWithFormat:@"%i%i", 0, seconds];
        else
            secString = [NSString stringWithFormat:@"%i", seconds];
        [_epiTimeLabel setText:[NSString stringWithFormat:@"%@%@%@%@",@"Time since last epinephrine dose:  ", minString,@":",secString ]];
    }
}
*/

-(void)updateLabels
{
    [[self tableView]visibleCells];
    //timeInCodeSeconds++;
    if (_timeInCodeLabel){
        StartSectionHolder *sh;
        for (SectionHolder *s in sectionHolders)
            if ([s isKindOfClass:[StartSectionHolder class]]){
                sh = (StartSectionHolder*)s;
                break;
            }
        if (sh){
            ACLSStart *s = [[sh list]objectAtIndex:0];
            if ([s isStarted]){
                [_timeInCodeLabel setText:[NSString stringWithFormat:@"%@%@", @"Time in code:  ", [s timeInCode]]];
            }
            
        }
        
        
        //int min = timeInCodeSeconds / 60;
        //int seconds = timeInCodeSeconds % 60;
        //NSString *minString;
        //NSString *secString;
        //if (min < 10)
          //  minString = [NSString stringWithFormat:@"%i%i", 0, min];
        //else
          //  minString = [NSString stringWithFormat:@"%i", min];
        //if (seconds < 10)
          //  secString = [NSString stringWithFormat:@"%i%i", 0, seconds];
        //else
          //  secString = [NSString stringWithFormat:@"%i", seconds];
        //[_timeInCodeLabel setText:[NSString stringWithFormat:@"%@%@%@%@",@"Time in code:  ", minString,@":",secString ]];
    }
}



-(void)awakeFromNib
{
    sectionHolders = [[NSMutableArray alloc]init];
    [sectionHolders addObject:[[StartSectionHolder alloc]init]];
    [super awakeFromNib];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [[self tableView]setEstimatedRowHeight:66.0];
    [[self tableView]setRowHeight:UITableViewAutomaticDimension];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SectionHolder *sh = [sectionHolders objectAtIndex:section];
    if ([sh list])
        return [[sh list]count];
    else return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [sectionHolders count];
}

@end
