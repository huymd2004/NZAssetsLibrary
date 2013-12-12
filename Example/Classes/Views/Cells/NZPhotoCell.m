//
//  NZPhotoCell.m
//  Photoapp
//
//  Created by Bruno Furtado on 11/12/13.
//  Copyright (c) 2013 No Zebra Network. All rights reserved.
//

#import "NZPhotoCell.h"

@interface NZPhotoCell ()

@property (strong, nonatomic) IBOutlet UIImageView *imgViewPhoto;

@end



@implementation NZPhotoCell

#pragma mark -
#pragma mark - Public methods

- (void)setImage:(UIImage *)image
{
    _image = image;
    self.imgViewPhoto.image = image;
}

@end