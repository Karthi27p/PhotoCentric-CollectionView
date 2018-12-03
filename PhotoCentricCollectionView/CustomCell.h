//
//  CustomCell.h
//  PhotoCentricCollectionView
//
//  Created by Karthi on 24/07/17.
//  Copyright © 2017 Tringapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UILabel *updatedLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *sponseredLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *updatedTopConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *sponseredTopConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *descriptionTopConstraint;

@end
