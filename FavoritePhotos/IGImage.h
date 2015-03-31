//
//  IGImage.h
//  FavoritePhotos
//
//  Created by Ronald Hernandez on 3/30/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IGImage : NSObject
@property NSString *idNumber;
@property NSURL *imageURL;
@property UIImage *imageToDisplay;
@property double latitude;
@property double longitude;
@property BOOL isFavorited;

-(instancetype)initWithMediaDictionary:(NSDictionary *)dictionary;


@end
