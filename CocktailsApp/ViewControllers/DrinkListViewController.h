//
//  DrinkListViewController.h
//  CocktailsApp
//
//  Created by AveryW on 5/6/19.
//  Copyright © 2019 Avery. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DrinkListViewController : UITableViewController

@property (strong, nonatomic) NSString *drink;
@property (strong, nonatomic) NSMutableArray *drinkArray;

@end

NS_ASSUME_NONNULL_END
