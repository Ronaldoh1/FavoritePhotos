//
//  FavoriteImagesViewController.m
//  FavoritePhotos
//
//  Created by Ronald Hernandez on 3/30/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import "FavoriteImagesViewController.h"
#import "CustomCollectionViewCell.h"
#import "IGImage.h"

@interface FavoriteImagesViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation FavoriteImagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


//#pragma mark - UICollectionView Delegate methods
//
//-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//    
//    return nil;
//}
//
////neeed to get the number of sectiosn. For this app we only need a single section to display photos.
//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//
//    return 2;
//}
//
////need to tell the collection view how many items it will display.
//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//
//
//    return 1;
//}

@end
