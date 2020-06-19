//
//  SMYContactPresentTool.h
//  shengbei
//
//  Created by penggongxu on 2020/6/19.
//  Copyright © 2020 smyfinancial. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ContactsUI/ContactsUI.h>


@protocol SMYContactPresentToolDelegate <NSObject>

- (void)contactPickerViewControllerDidCancel:(CNContactPickerViewController *)picker;

- (void)contactPickerViewController:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact;

@end

@interface SMYContactPresentTool : NSObject <CNContactPickerDelegate>

@property (nonatomic, assign) id<SMYContactPresentToolDelegate> delegate;

+ (instancetype)sharedInstance;

+ (void)presentContactPickerViewControllerWithAnimated:(BOOL)animated;

@end

