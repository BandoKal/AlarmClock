/*
 Copyright (c) 2012, Jason Bandy & Justin Tiffner.
 All rights reserved.
 
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 1. Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 2. Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE. 
 */

#import "WorldTimeTableViewController.h"


@implementation WorldTimeTableViewController
@synthesize mainList;
@synthesize timer;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    mainList = [[NSArray alloc]initWithObjects:@"New York", @"London", @"Cairo", @"New Delhi", @"Hong Kong", @"Tokyo", @"San Francisco", @"Murfreesboro",nil];
  
    [NSTimer scheduledTimerWithTimeInterval:0.5 
                                     target:self 
                                   selector:@selector(updateTimer) 
                                   userInfo:nil 
                                    repeats:YES];

    
}

-(void)updateTimer
{
    NSArray *currentCells = [self.tableView visibleCells];
    
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:@"hh:mm:ss"];
    
    for (int i =0 ; i< [currentCells count];i++)
    {
        UILabel *timeLabel = (UILabel *) [[currentCells objectAtIndex:i] viewWithTag:2];
        
        switch ([self.tableView indexPathForCell:[currentCells objectAtIndex:i]].row) {
            case 0:
                timeFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"EST"];
                timeLabel.text = [timeFormatter stringFromDate:[NSDate date]];
                break;
            case 1:
                timeFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
                timeLabel.text = [timeFormatter stringFromDate:[NSDate date]];
                break;
            case 2:
                timeFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"EET"];
                timeLabel.text = [timeFormatter stringFromDate:[NSDate date]];
                break;
            case 3:
                timeFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"IST"];
                timeLabel.text = [timeFormatter stringFromDate:[NSDate date]];
                break;
            case 4:
                timeFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"HKT"];
                timeLabel.text = [timeFormatter stringFromDate:[NSDate date]];
                break;
            case 5:
                timeFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"JST"];
                timeLabel.text = [timeFormatter stringFromDate:[NSDate date]];
                break;
            case 6:
                timeFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"PST"];
                timeLabel.text = [timeFormatter stringFromDate:[NSDate date]];
                break;
            case 7:
                timeFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"CST"];
                timeLabel.text = [timeFormatter stringFromDate:[NSDate date]];
                break;
                
            default:
                break;
        }
        
    }
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [mainList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"worldCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    UILabel *locationLabel = (UILabel *)[cell viewWithTag:1];
    locationLabel.text = [mainList objectAtIndex:indexPath.row];
    
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    [timeFormatter setDateFormat:@"hh:mm:ss"];
    UILabel *timeLabel = (UILabel *) [cell viewWithTag:2];
    
    
    //Now setup for the time label
    switch (indexPath.row) {
        case 0:
            timeFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"EST"];
            timeLabel.text = [timeFormatter stringFromDate:[NSDate date]];
            break;
        case 1:
            timeFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
            timeLabel.text = [timeFormatter stringFromDate:[NSDate date]];
            break;
        case 2:
            timeFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"EET"];
            timeLabel.text = [timeFormatter stringFromDate:[NSDate date]];
            break;
        case 3:
            timeFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"IST"];
            timeLabel.text = [timeFormatter stringFromDate:[NSDate date]];
            break;
        case 4:
            timeFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"HKT"];
            timeLabel.text = [timeFormatter stringFromDate:[NSDate date]];
            break;
        case 5:
            timeFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"JST"];
            timeLabel.text = [timeFormatter stringFromDate:[NSDate date]];
            break;
        case 6:
            timeFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"PST"];
            timeLabel.text = [timeFormatter stringFromDate:[NSDate date]];
            break;
        case 7:
            timeFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"CST"];
            timeLabel.text = [timeFormatter stringFromDate:[NSDate date]];
            break;
            
        default:
            break;
    }
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
