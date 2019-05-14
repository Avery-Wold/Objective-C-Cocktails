//
//  ViewController.m
//  CocktailsApp
//
//  Created by AveryW on 5/3/19.
//  Copyright © 2019 Avery. All rights reserved.
//

#import "ViewController.h"
#import "DrinkDetailViewController.h"
#import "DrinkListViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize txtCocktail, txtSpirit, activityView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [activityView isHidden];
}

- (void)viewWillAppear:(BOOL)animated{
    // clear textfields after returning to main page
    txtSpirit.text = @"";
    txtCocktail.text = @"";
}

- (IBAction)btnCocktail:(id)sender {
    [self performSegueWithIdentifier:@"mainToDrinkVC" sender:sender];
    [activityView startAnimating];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"mainToDrinkVC"]){
        DrinkDetailViewController *vc = [segue destinationViewController];
        NSString *cocktail = txtCocktail.text;
        vc.drink = cocktail;
        [activityView stopAnimating];
    }
    if ([[segue identifier] isEqualToString:@"mainToDrinkListVC"]){
        DrinkListViewController *vc = [segue destinationViewController];
        NSString *spirit = txtSpirit.text;
        vc.drink = spirit;
    }
}

- (IBAction)btnSpirit:(id)sender {
    [self performSegueWithIdentifier:@"mainToDrinkListVC" sender:sender];
}
@end
