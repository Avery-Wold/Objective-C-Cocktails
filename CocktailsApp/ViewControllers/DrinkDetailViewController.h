//
//  DrinkDetailViewController.h
//  CocktailsApp
//
//  Created by AveryW on 5/3/19.
//  Copyright © 2019 Avery. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DrinkDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *needed;
@property (weak, nonatomic) IBOutlet UILabel *drinkName;
@property (weak, nonatomic) IBOutlet UILabel *glassName;
@property (weak, nonatomic) IBOutlet UILabel *measureIngredient1;
@property (weak, nonatomic) IBOutlet UILabel *measureIngredient2;
@property (weak, nonatomic) IBOutlet UIImageView *imgDrink;
@property (weak, nonatomic) IBOutlet UILabel *instructions;

@property (strong, nonatomic) NSString *drink;

-(void)getDrink;
@end

NS_ASSUME_NONNULL_END
