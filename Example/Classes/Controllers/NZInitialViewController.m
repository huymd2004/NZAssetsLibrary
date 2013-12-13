//
//  NZInitialViewController.m
//  Photoapp
//
//  Created by Bruno Furtado on 11/12/13.
//  Copyright (c) 2013 No Zebra Network. All rights reserved.
//

#import "NZInitialViewController.h"
#import "NZAssetsLibrary.h"

@interface NZInitialViewController ()

- (IBAction)cameraClicked;

@end



@implementation NZInitialViewController

#pragma mark -
#pragma mark - Actions

- (IBAction)cameraClicked
{    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [UIAlertView alertWithMessage:@"Device without camera."];
        return;
    }
    
    UIImagePickerController *mediaUI = [[UIImagePickerController alloc] init];
    mediaUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    mediaUI.allowsEditing = YES;
    mediaUI.delegate = self;
    
    [self presentViewController:mediaUI animated:YES completion:nil];
}

#pragma mark -
#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    
    if (![mediaType isEqualToString:(NSString *) kUTTypeImage]) {
        [UIAlertView alertWithMessage:@"Device without media type."];
        return;
    }

    UIImage *image = info[UIImagePickerControllerEditedImage];
    
    NZAssetsLibrary *assetsLibrary = [NZAssetsLibrary defaultAssetsLibrary];
    
    [assetsLibrary saveImage:image toAlbum:@"My Album" withCompletion:^(NSError *error) {
        if (error) {
            [UIAlertView alertWithMessage:@"Failed to save image."];
            
#ifdef NZDEBUG
            NSLog(@"%s Save image with error: %@", __PRETTY_FUNCTION__, error);
#endif
            
            return;
        }
        
        [UIAlertView alertWithMessage:@"Image saved successfully."];
    }];
    
    [assetsLibrary saveJPGImageAtDocumentDirectory:image];
    [assetsLibrary savePNGImageAtDocumentDirectory:image];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
