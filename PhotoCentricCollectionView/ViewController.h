//
//  ViewController.h
//  PhotoCentricCollectionView
//
//  Created by Karthi on 24/07/17.
//  Copyright © 2017 Tringapps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
#import "CustomCollectionViewLayout.h"

@interface ViewController : UIViewController <CustomLayoutDelegate>
{
    IBOutlet NSLayoutConstraint *collectionViewWidth;
    IBOutlet NSLayoutConstraint *collectionViewHeight;
    NSMutableArray *arrayData;
    NSInteger columnCount, miniIntegerSpacing;
    CGFloat collectionViewHeightBasedOnDevice;
    NSMutableArray *firstSizeArray;
    NSMutableArray *secondSizeArray;
}
@property (strong, nonatomic) IBOutlet UICollectionView *photoCentricCollectionView;
@property (strong, nonatomic) CustomCell *prototypeCell;
@property (nonatomic, assign) BOOL isSponseredPresent;
@property (nonatomic, assign) BOOL isUpdatedPresent;


@end

