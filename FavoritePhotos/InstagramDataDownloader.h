//
//  InstagramDataDownloader.h
//  FavoritePhotos
//
//  Created by Ronald Hernandez on 3/30/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import <Foundation/Foundation.h>



@protocol InstagramDataDownloaderDelegate <NSObject>

-(void)gotIgRawData:(NSArray *)igRawData;

@end
@interface InstagramDataDownloader : NSObject

@property id<InstagramDataDownloaderDelegate>parentVC;
@property NSString *searchTag;

-(void)pullImagesFromIGAPI;

@end
