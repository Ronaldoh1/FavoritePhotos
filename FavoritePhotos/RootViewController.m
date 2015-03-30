//
//  ViewController.m
//  Favorite Photos
//
//  Created by Ronald Hernandez on 3/28/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import "RootViewController.h"
#import "IGImage.h"
#import "InstagramDataDownloader.h"
#import "CustomCollectionViewCell.h"


@interface RootViewController ()<InstagramDataDownloaderDelegate, UITabBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate>
@property InstagramDataDownloader *downloader;
@property NSMutableArray *igImageObjectArray;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.downloader = [InstagramDataDownloader new];

    //set the delegate.
    self.downloader.parentVC = self;
    //Call method to pull the images from image downloader class.
    [self.downloader pullImagesFromIGAPI];
    //register custom class for use. This needs to be done before collection view is loads and is displayed.
   // [self setupCollectionView];

    self.igImageObjectArray = [NSMutableArray new];




}
//this is the method that will allow us to access the array of images from the downloader class.
-(void)gotIgRawData:(NSArray *)igRawData{

    for(NSDictionary *dict in igRawData){

        IGImage *igImage = [[IGImage alloc]initWithMediaDictionary:dict];
        [self.igImageObjectArray addObject:igImage];


    }

}
//-(void)setupCollectionView{
//    [self.collectionView registerClass:[CustomUICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
//
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
//    [flowLayout setMinimumInteritemSpacing:0.0f];
//    [flowLayout setMinimumLineSpacing:0.0f];
//    [self.collectionView setPagingEnabled:YES];
//    [self.collectionView setCollectionViewLayout:flowLayout];
//    [self.collectionView reloadData];
//}

#pragma Marks UICollectionViewDelegates

//neeed to get the number of sectiosn. For this app we only need a single section to display photos.
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 2;
}

//need to tell the collection view how many items it will display.
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{


    return self.igImageObjectArray.count;
}


//Feed the cells with data (images to display)
//
//-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//  CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//
//    //    NSString *imageName = [self.dataArray objectAtIndex:indexPath.row];
//    //    [cell setImageName:imageName];
//
//    NSLog(@"%@", [[self.igImageObjectArray objectAtIndex:0]imageToDisplay]);
//    UIImage *image = [[self.igImageObjectArray objectAtIndex:indexPath.row]imageToDisplay];
//
//    //    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
//    //    [self.imageView setImage:image];
//    
// //   cell.imageView.image = image;
//    
//    
//    //  cell.imageView.image = image;
//    //[cell updateCell:image];
//    // [cell updateCell:[self.igImageObjectArray[indexPath.row]imageView].image];
//    
//    return cell;
//}




@end
