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


@interface RootViewController ()<InstagramDataDownloaderDelegate, UITabBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UITabBarControllerDelegate,UIGestureRecognizerDelegate>
@property InstagramDataDownloader *downloader;
@property NSMutableArray *igImageObjectArray;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecognizer;

@property NSMutableArray *favoritePhotosArray;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.downloader = [InstagramDataDownloader new];

    //set the delegate.
    self.downloader.parentVC = self;

    //register custom class for use. This needs to be done before collection view is loads and is displayed.
    // [self setupCollectionView];

    self.igImageObjectArray = [NSMutableArray new];

    //hide the activity indicator when it's not annimating.
    self.activityIndicator.hidesWhenStopped = true;

    //Tap Gesture Recognizer Set up.
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tappedResponder:)];

    [self setRequiredTapGestureForFavorite];
    //need to add the gesture recognizer to our view.
    [self.view addGestureRecognizer:self.tapGestureRecognizer];

    self.favoritePhotosArray = [NSMutableArray new];





}
//Helper method for tap selector. This is where the like of each picture is set up.
-(void) tappedResponder:(UITapGestureRecognizer *)sender{

    if (sender.state == UIGestureRecognizerStateEnded)
    {
        CGPoint point = [sender locationInView:self.collectionView];

        NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:point];

        //if image is tapped twice, a heart shape will appear to indicate it was favorited
        //TODO:this feature is still buggy
        if (indexPath)
        {
            NSLog(@"Image at %li was double tapped",indexPath.item);

            //Check if the photo is already in the array
            IGImage *favoritedPhoto = self.igImageObjectArray[indexPath.item];
            [self checkAndAddToFavoritedPhotosArray:favoritedPhoto];
        }
    }

}


//
//Check if double tapped photo is already in the favorited array, if not, add it in the favorite Photos array
- (void)checkAndAddToFavoritedPhotosArray:(IGImage *)favoritedPhoto
{
    //IfPhoto is already favorited, set isFavorited value to YES, but don't add it again to the array
    for (UIImage *favePhoto in self.favoritePhotosArray)
    {
        if ([favePhoto isEqual:favoritedPhoto])
        {
            favoritedPhoto.isFavorited = YES;
        }
    }

    //IF photo is not already favorited, add it to the array, add location as well
    if (favoritedPhoto.isFavorited == NO)
    {
        [self.favoritePhotosArray addObject:favoritedPhoto];
        NSLog(@"Photo added to array");


        favoritedPhoto.isFavorited = YES;

    }

    [self.collectionView reloadData];
  //  [self save];
}



//Helper method to set up the tap gesture recognizer.
- (void)setRequiredTapGestureForFavorite
{
    //1. set up the number of taps
    self.tapGestureRecognizer.numberOfTapsRequired = 2;
    //2. we need to set the number of fingers
    self.tapGestureRecognizer.numberOfTouchesRequired = 1;
}
//this is the method that will allow us to access the array of images from the downloader class.



-(void)gotIgRawData:(NSArray *)igRawData{


    for (int i = 0; i<10; i++) {

        NSDictionary *dict = igRawData[i];


        IGImage *igImage = [[IGImage alloc]initWithMediaDictionary:dict];
        [self.igImageObjectArray addObject:igImage];
    }

    [self.collectionView reloadData];
    [self.activityIndicator stopAnimating];

}


#pragma Marks UICollectionViewDelegates

//neeed to get the number of sectiosn. For this app we only need a single section to display photos.
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

//need to tell the collection view how many items it will display.
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{


    return self.igImageObjectArray.count;
}


//Feed the cells with data (images to display)

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];



    NSLog(@"%@", [[self.igImageObjectArray objectAtIndex:0]imageToDisplay]);
    UIImage *image = [[self.igImageObjectArray objectAtIndex:indexPath.row]imageToDisplay];

    //check if the image has been liked.

    if ([[self.igImageObjectArray objectAtIndex:indexPath.row]isFavorited] == true) {
        cell.isImageLiked.alpha = 1.0;
    }else{
        cell.isImageLiked.alpha = 0.0;
    }

    cell.imageView.image = image;




    return cell;
}
#pragma mark -- UI SEARCHBAR DELEGATE

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    if (![searchBar.text isEqualToString:@""]) {

        [self.activityIndicator startAnimating];


        [self searchForSearchTag:searchBar.text];

        [self.searchBar endEditing:YES];


    }

}
-(void)searchForSearchTag:(NSString *)searchTag{
    //change the hashtag
    self.downloader.searchTag = searchTag;

    //Call method to pull the images from image downloader class.
    [self.downloader pullImagesFromIGAPI];
    
    self.activityIndicator.hidesWhenStopped = true;
}



@end
