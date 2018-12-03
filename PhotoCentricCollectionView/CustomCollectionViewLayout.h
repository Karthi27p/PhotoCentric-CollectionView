//
//  CustomCollectionViewLayout.h
//  PhotoCentricCollectionView
//
//  Created by Karthi on 24/07/17.
//  Copyright © 2017 Tringapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomLayoutDelegate <UICollectionViewDelegateFlowLayout>

- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout columnCountForSection:(NSInteger)section;

@end

@interface CustomCollectionViewLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) CGFloat contentHeight;
@property (nonatomic,assign) CGFloat columnCount;
@property (nonatomic,weak) id<CustomLayoutDelegate> delegate;

@end


