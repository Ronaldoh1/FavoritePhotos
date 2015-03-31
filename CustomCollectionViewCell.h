//
//  CustomCollectionViewCell.h
//  FavoritePhotos
//
//  Created by Ronald Hernandez on 3/30/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *isImageLiked;


@end
