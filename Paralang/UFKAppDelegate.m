//
//  UFKAppDelegate.m
//  Paralang
//
//  Created by dpree on 28.06.13.
//  Copyright (c) 2013 uberfork. All rights reserved.
//

#import "UFKAppDelegate.h"
#import "UFKRecordsTableViewController.h"

@interface UFKAppDelegate ()

@property (nonatomic) UFKRecordsTableViewController *recordsController;

@end

@implementation UFKAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.recordsController = [UFKRecordsTableViewController controller];
    [self.window setContentView:self.recordsController.view];
}

@end
