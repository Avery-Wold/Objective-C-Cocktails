//
//  DrinkDetailViewController.m
//  CocktailsApp
//
//  Created by AveryW on 5/3/19.
//  Copyright © 2019 Avery. All rights reserved.
//

#import "DrinkDetailViewController.h"

@interface DrinkDetailViewController ()

@end

@implementation DrinkDetailViewController :UIViewController

@synthesize drinkName, glassName, measureIngredient1, measureIngredient2, needed, instructions;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.drinkName.text = self.drink;
    self.needed.text = @"What you'll need:";
    [self getDrink];
}

-(void)getDrink {
    NSString *drinkStr = self.drink;
    NSString *drinkSearchString = [drinkStr stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSError *error;
    NSString *url = [NSString stringWithFormat:@"https://thecocktaildb.com/api/json/v1/1/search.php?s=%@", drinkSearchString];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    
    NSDictionary *drinks = [NSJSONSerialization
                            JSONObjectWithData:data
                            options:kNilOptions
                            error:&error];

    NSArray *myDrinks = drinks[@"drinks"];
    for (NSDictionary *theDrink in myDrinks){
        NSString *img = theDrink[@"strDrinkThumb"];
        NSURL *imgURL = [[NSURL alloc] initWithString:img];
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:imgURL];
        
        self.imgDrink.image =  [UIImage imageWithData:imageData];
        self.glassName.text = theDrink[@"strGlass"];
        self.measureIngredient1.text = [NSString stringWithFormat:@"%@ %@", theDrink[@"strMeasure1"], theDrink[@"strIngredient1"]];
        self.measureIngredient2.text = [NSString stringWithFormat:@"%@ %@", theDrink[@"strMeasure2"], theDrink[@"strIngredient2"]];
        self.instructions.text = theDrink[@"strInstructions"];
    }
}

@end
