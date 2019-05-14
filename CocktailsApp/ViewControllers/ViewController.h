//
//  ViewController.h
//  CocktailsApp
//
//  Created by AveryW on 5/3/19.
//  Copyright © 2019 Avery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtCocktail;
@property (weak, nonatomic) IBOutlet UITextField *txtSpirit;

- (IBAction)btnCocktail:(id)sender;
- (IBAction)btnSpirit:(id)sender;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

@end

