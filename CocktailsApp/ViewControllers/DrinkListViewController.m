//
//  DrinkListViewController.m
//  CocktailsApp
//
//  Created by AveryW on 5/6/19.
//  Copyright © 2019 Avery. All rights reserved.
//

#import "DrinkListViewController.h"
#import "DrinkDetailViewController.h"

@interface DrinkListViewController ()

@end

@implementation DrinkListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getDrinkList];
}

-(void)getDrinkList {
    NSString *spiritStr = self.drink;
    NSString *spiritSearchString = [spiritStr stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSError *error;
    NSString *url = [NSString stringWithFormat:@"https://thecocktaildb.com/api/json/v1/1/filter.php?i=%@", spiritSearchString];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    
    NSDictionary *drinks = [NSJSONSerialization
                            JSONObjectWithData:data
                            options:kNilOptions
                            error:&error];
    self.drinkArray = drinks[@"drinks"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.drinkArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"drinkCell" forIndexPath:indexPath];
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"drinkCell"];
    }
    NSString *img = self.drinkArray[indexPath.row][@"strDrinkThumb"];
    NSURL *imgURL = [[NSURL alloc] initWithString:img];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:imgURL];

    cell.textLabel.text = self.drinkArray[indexPath.row][@"strDrink"];
    cell.imageView.image = [UIImage imageWithData:imageData];
    cell.imageView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DrinkDetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DrinkDetail"];
    NSString *cocktail = self.drinkArray[indexPath.row][@"strDrink"];
    vc.drink = cocktail;
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
//    [label setFont:[UIFont boldSystemFontOfSize:20]];
//    NSString *string = [NSString stringWithFormat:@"%@ drinks", self.drink];
//    [label setText:string];
//    [view addSubview:label];
//    return view;
//}
@end
