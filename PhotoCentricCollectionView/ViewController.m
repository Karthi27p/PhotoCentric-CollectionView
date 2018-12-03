//
//  ViewController.m
//  PhotoCentricCollectionView
//
//  Created by Karthi on 24/07/17.
//  Copyright © 2017 Tringapps. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    arrayData=[[NSMutableArray alloc] init];
    firstSizeArray = [[NSMutableArray alloc] init];
    secondSizeArray = [[NSMutableArray alloc] init];
    [arrayData addObject:@"For my part I know nothing with any certainty, "];
    [arrayData addObject:@"For my part I know nothing with any certainty, "];
    [arrayData addObject:@"For my part I know nothing with any certainty, but the sight of the stars makes me dream."];
    [arrayData addObject:@"For my part I know nothing with any certainty, but the sight of the stars makes me dream.For my part I know nothing with any certainty, but the sight of the stars makes me dream."];
    
    collectionViewHeightBasedOnDevice = UIScreen.mainScreen.bounds.size.width / 320 * 532;
    collectionViewHeight.constant = collectionViewHeightBasedOnDevice;
    
    columnCount=2;
    miniIntegerSpacing=10;
    
    if(![self.photoCentricCollectionView.collectionViewLayout isKindOfClass:[CustomCollectionViewLayout class]]){
        CustomCollectionViewLayout *layout = [CustomCollectionViewLayout new];
        layout.delegate=self;
        layout.columnCount=columnCount;
        
        self.photoCentricCollectionView.collectionViewLayout = layout;
        [self.photoCentricCollectionView reloadData];
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10.0f;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10.0f;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    //return UIEdgeInsetsMake(top, left, bottom, right);
    return UIEdgeInsetsMake(0, 10, 0, 10);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout columnCountForSection:(NSInteger)section
{
    return columnCount;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat itemWidth = 160;
    CGSize firstFinalSize, secondFinalSize;
    CGSize finalSize = CGSizeMake(160, 129);
    finalSize=CGSizeMake(itemWidth, floorf(finalSize.height * itemWidth / finalSize.width));
    finalSize=CGSizeMake(finalSize.width, finalSize.height+33+[self calculateHeightForLbl:[arrayData objectAtIndex:indexPath.row]width:itemWidth-10]);
    if(indexPath.row <= 1)
    {
        [firstSizeArray addObject: [NSNumber numberWithFloat:finalSize.height]];
        NSNumber *height = [firstSizeArray valueForKeyPath:@"@max.self"];
        firstFinalSize = CGSizeMake(finalSize.width,[height floatValue]);
        NSLog(@"size :%@",NSStringFromCGSize(finalSize));
        return firstFinalSize;
    }
    else
    {
        [secondSizeArray addObject: [NSNumber numberWithFloat:finalSize.height]];
        NSNumber *height = [secondSizeArray valueForKeyPath:@"@max.self"];
        secondFinalSize = CGSizeMake(finalSize.width,[height floatValue]);
        NSLog(@"size :%@",NSStringFromCGSize(finalSize));
        return  secondFinalSize;
    }
}
-(float)calculateHeightForLbl:(NSString*)text width:(float)width{
    CGSize constraint = CGSizeMake(width,20000.0f);
    CGSize size;
    
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    CGSize boundingBox = [text boundingRectWithSize:constraint
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                         attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                            context:context].size;
    
    size = CGSizeMake(ceil(boundingBox.width), ceil(boundingBox.height));
    
    return size.height+10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomCell" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:@"page1"];
    cell.sponseredLabel.text=@"Sponsered";
    cell.updatedLabel.text = [NSString stringWithFormat:(@"Updated %ld hours ago"),(long)indexPath.row];
    cell.descriptionLabel.text = [arrayData objectAtIndex:indexPath.row];
    //cell.backgroundColor = [UIColor redColor];
    
    /** Label Hide Controls **/
    //[self hideUpdatedLabel:cell];
    [self hideSponseredLabel:cell];
    //[self hideSponseredAndUpdated:cell];
    
    return cell;
}

-(void)hideUpdatedLabel:(CustomCell*)cell
{
    cell.updatedLabel.hidden = YES;
    cell.sponseredLabel.hidden = NO;
}

-(void)hideSponseredLabel:(CustomCell*)cell
{
    cell.sponseredLabel.hidden = YES;
    cell.updatedLabel.hidden = NO;
    cell.descriptionTopConstraint.constant = 23;
}

-(void)hideSponseredAndUpdated:(CustomCell*)cell
{
    cell.sponseredLabel.hidden = YES;
    cell.updatedLabel.hidden = YES;
    cell.descriptionTopConstraint.constant = 7;
}

@end
