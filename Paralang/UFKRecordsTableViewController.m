//
//  UFKRecordsTableViewController.m
//  Paralang
//
//  Created by dpree on 29.06.13.
//  Copyright (c) 2013 uberfork. All rights reserved.
//

#import "UFKRecordsTableViewController.h"

@interface UFKRecordsTableViewController ()

@property NSArray *listItems;

@end

@implementation UFKRecordsTableViewController

+ (id)controller
{
    return [[self alloc] initWithNibName:[self className] bundle:nil];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    [self loadData];
    if (self.listItems) {
        return [self.listItems count];
    } else {
        return 0;
    }
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    if (self.listItems) {
        NSArray *itemsAtRow = [self.listItems objectAtIndex:row];
        if (itemsAtRow) {
            NSString *itemAtRowAndColumn;
            
            if ([itemsAtRow count] > 30) {
                
                NSString *identifier = [tableColumn identifier];
                if ([identifier isEqualToString:@"createdAt"]) {
                    NSString *date = [itemsAtRow objectAtIndex:13];
                    NSString *time = [itemsAtRow objectAtIndex:15];
                    itemAtRowAndColumn = [NSString stringWithFormat:@"%@ %@", date, time];
                } else if ([identifier isEqualToString:@"weight"]) {
                    itemAtRowAndColumn = [itemsAtRow objectAtIndex:27];
                } else if ([identifier isEqualToString:@"fat"]) {
                    itemAtRowAndColumn = [itemsAtRow objectAtIndex:31];
                } else if ([identifier isEqualToString:@"muscleMass"]) {
                    itemAtRowAndColumn = [itemsAtRow objectAtIndex:43];
                } else if ([identifier isEqualToString:@"bodyMassIndex"]) {
                    itemAtRowAndColumn = [itemsAtRow objectAtIndex:29];
                } else if ([identifier isEqualToString:@"energyConsumption"]) {
                    itemAtRowAndColumn = [itemsAtRow objectAtIndex:59];
                }
                
                if (itemAtRowAndColumn) {
                    return itemAtRowAndColumn;
                }
                
            }
        }
    }
    return nil;
}

- (void)loadData
{
    //#?,?,?,?,?,?,?,?,ModelType,Model,DateType,Date,TimeType,Time,Type,?,AgeType,Age,HeightType,Height,?...

    // @"/Volumes/NO NAME/TANITA/GRAPHV1/DATA/DATA1.CSV"
    // NSString *pathToFile =[[NSBundle mainBundle] pathForResource:@"example" ofType: @"txt"];
    NSString *list = [NSString stringWithContentsOfFile:@"/Users/dpree/dev/paralang/example.csv" encoding:NSUTF8StringEncoding error:nil];
    if (list) {
        NSArray *lines = [list componentsSeparatedByString:@"\n"];
        NSMutableArray *listItems = [@[] mutableCopy];
        for (NSString *line in lines) {
            NSArray *items = [line componentsSeparatedByString:@","];
            [listItems addObject:items];
        }
        self.listItems = listItems;
    }
}

@end
