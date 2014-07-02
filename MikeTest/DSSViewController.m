//
//  Created by Pete Callaway on 01/07/2014.
//  Copyright (c) 2014 Dative Studios. All rights reserved.
//

#import "DSSViewController.h"

#import "DSSViewControllerCell.h"


@implementation DSSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

@end
