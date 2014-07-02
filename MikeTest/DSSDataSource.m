//
//  DSSDataSource.m
//  MikeTest
//
//  Created by Mike on 02/07/2014.
//  Copyright (c) 2014 Dative Studios. All rights reserved.
//

#import "DSSDataSource.h"

#import "DSSViewControllerCell.h"


@interface DSSDataSource ()

@property (nonatomic, copy) NSArray *sectionData;

@end


@implementation DSSDataSource

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _sectionData = @[@[@"A1", @"A2", @"A3", @"A4", @"A5"], @[@"B1", @"B2", @"B3", @"B4", @"B5"]];
    }
    
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.sectionData[section] count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DSSViewControllerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TEST" forIndexPath:indexPath];
    cell.titleLabel.text = [NSString stringWithFormat:@"%@", [self.sectionData[indexPath.section] objectAtIndex:indexPath.row]];
    cell.editingAccessoryType = UITableViewCellAccessoryNone;
    
    return cell;
}

@end
