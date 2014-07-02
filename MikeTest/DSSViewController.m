//
//  Created by Pete Callaway on 01/07/2014.
//  Copyright (c) 2014 Dative Studios. All rights reserved.
//

#import "DSSViewController.h"

#import "DSSViewControllerCell.h"


@interface DSSViewController ()

@property (nonatomic, copy) NSArray *sectionData;

@end


@implementation DSSViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        _sectionData = @[@[@"A1", @"A2", @"A3", @"A4", @"A5"], @[@"B1", @"B2", @"B3", @"B4", @"B5"]];
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        return NO;
    }
    else {
        return YES;
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        return UITableViewCellEditingStyleNone;
    }
    else {
        return UITableViewCellEditingStyleDelete;
    }
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!self.editing) {
        return YES;
    }
    else {
        return (indexPath.section == 0);
    }
}

- (IBAction)toggleEditMode:(id)sender {
    [self setEditing:!self.editing animated:YES];
}

@end
