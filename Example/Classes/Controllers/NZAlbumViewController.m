//
//  NZAlbumViewController.m
//  Photoapp
//
//  Created by Bruno Furtado on 11/12/13.
//  Copyright (c) 2013 No Zebra Network. All rights reserved.
//

#import "NZAlbumViewController.h"
#import "NZAssetsLibrary.h"
#import "NZAssetImageFile.h"
#import "NZPhotoCell.h"

@interface NZAlbumViewController ()

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) AGPhotoBrowserView *browserView;
@property (strong, nonatomic) NSArray<NZAssetImageFile> *items;

- (void)loadItems;
- (void)populateItems;

@end



@implementation NZAlbumViewController

#pragma mark -
#pragma mark - UIViewController override methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.browserView = [[AGPhotoBrowserView alloc] initWithFrame:self.view.bounds];
    self.browserView.delegate = self;
    self.browserView.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadItems];
}

#pragma mark -
#pragma mark - AGPhotoBrowserDataSource

- (NSInteger)numberOfPhotosForPhotoBrowser:(AGPhotoBrowserView *)photoBrowser
{
    return [self.items count];
}

- (UIImage *)photoBrowser:(AGPhotoBrowserView *)photoBrowser imageAtIndex:(NSInteger)index
{
    return [[self.items objectAtIndex:index] image];
}

- (NSString *)photoBrowser:(AGPhotoBrowserView *)photoBrowser titleForImageAtIndex:(NSInteger)index
{
    return [[self.items objectAtIndex:index] title];
}

- (NSString *)photoBrowser:(AGPhotoBrowserView *)photoBrowser descriptionForImageAtIndex:(NSInteger)index
{
    return [[self.items objectAtIndex:index] description];
}

#pragma mark -
#pragma mark - AGPhotoBrowserDelegate

- (void)photoBrowser:(AGPhotoBrowserView *)photoBrowser didTapOnDoneButton:(UIButton *)doneButton
{
    [photoBrowser hideWithCompletion:^(BOOL finished) {
        //
    }];
}

- (void)photoBrowser:(AGPhotoBrowserView *)photoBrowser didTapOnActionButton:(UIButton *)actionButton atIndex:(NSInteger)index
{
    
}

#pragma mark -
#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PhotoCell";
    NZPhotoCell *cell = (NZPhotoCell *) [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier
                                                                                  forIndexPath:indexPath];
    
    NZAssetImageFile *file = self.items[indexPath.row];
    cell.image = file.image;
    
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 4;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

#pragma mark -
#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.browserView showFromIndex:indexPath.row];
}

#pragma mark -
#pragma mark - Private methods

- (void)loadItems
{
    _items = [@[] mutableCopy];
    
    void (^loadItems)(NSArray<NZAssetImageFile> *array) = ^(NSArray<NZAssetImageFile> *array){
        self.items = array;
        [self populateItems];
        [self.collectionView reloadData];
    };
    
    NZAssetsLibrary *assetsLibrary = [NZAssetsLibrary defaultAssetsLibrary];
    
    // load from documents directory
    /*
    NSArray<NZAssetImageFile> *array = [assetsLibrary loadImagesFromDocumentDirectory];
    loadItems(array);
    */
    
    // load from album
    ///*
     [assetsLibrary loadAssetsFromAlbum:@"My Album" withCallback:^(NSArray<NZAssetImageFile> *assets, NSError *error) {
        if (error) {
            [UIAlertView alertWithMessage:@"Could not load images."];
            return;
        }
     
        loadItems(assets);
    }];
    //*/
}

- (void)populateItems
{
    for (int i = 0; i < [self.items count]; i++) {
        NZAssetImageFile *file = self.items[i];
        
        file.title = [NSString stringWithFormat:@"Image title %i", i];
        file.description = [NSString stringWithFormat:@"Description for image with title %i.\n More description for test.", i];;
    }
}

@end
