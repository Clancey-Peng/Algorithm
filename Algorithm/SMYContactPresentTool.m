//
//  SMYContactPresentTool.m
//  shengbei
//
//  Created by penggongxu on 2020/6/19.
//  Copyright © 2020 smyfinancial. All rights reserved.
//

#import "SMYContactPresentTool.h"
#import "SMYBusinessBase/SMYApp.h"

static BOOL gIsPresenting = NO;
static UIWindow *gPresentWindow = nil;
//static dispatch_block_t gCompleteHandler = nil;

@implementation SMYContactPresentTool

static SMYContactPresentTool *_manager = nil;

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[self alloc] init];
    });
    return _manager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (!_manager) {
        _manager = [super allocWithZone:zone];
    }
    return _manager;;
}

- (instancetype)copyWithZone:(NSZone *)zone {
    return _manager;
}
// completion:(void(^)())completeHandler
+ (void)presentContactPickerViewControllerWithAnimated:(BOOL)animated {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        gPresentWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
#if defined(__IPHONE_13_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_13_0
        if (@available(iOS 13.0,*)) {
            gPresentWindow.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
        }
#endif
        gPresentWindow.windowLevel = 1;
    });
    @synchronized (self.sharedInstance) {
        if (gIsPresenting) {// 已经处于登录状态中，等待handler回调即可
            return;
        }
//        if (!gCompleteHandler) {
//            gCompleteHandler = completeHandler;
//        }
        gIsPresenting = YES;
    }
    CNContactPickerViewController *picker = [[CNContactPickerViewController alloc] init];
    picker.delegate = self.sharedInstance;
    picker.displayedPropertyKeys = @[CNContactPhoneNumbersKey];
//    picker.modalPresentationStyle = UIModalPresentationFullScreen;
    [gPresentWindow.layer removeAllAnimations];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{// 等待可能存在的关闭登录页面动画结束
        UINavigationController *presentNav = [[UINavigationController alloc] initWithRootViewController:picker];
        gPresentWindow.rootViewController = presentNav;
        CGRect frame = [[UIScreen mainScreen] bounds];
        if (animated) {
            frame.origin.y += frame.size.height;
            gPresentWindow.frame = frame;
            frame.origin.y -= frame.size.height;
            [UIView animateWithDuration:0.3 animations:^{
                gPresentWindow.frame = frame;
            } completion:nil];
        } else {
            gPresentWindow.frame = frame;
        }
        gPresentWindow.hidden = NO;
        [gPresentWindow makeKeyWindow];
    });
}

+ (void)dismissPresentedViewController {
    // 先切换keyWindow，避免handlerItem中处理获取keyWindow出错
    [gPresentWindow endEditing:YES];
    [SMYApp.sharedInstance.delegate.mainWindow makeKeyWindow];
    @synchronized (self.sharedInstance) {
        gIsPresenting = NO;
    }
    // 关闭登录页面
    CGRect frame = gPresentWindow.frame;
    frame.origin.y += frame.size.height;
    [UIView animateWithDuration:0.3 animations:^{
        gPresentWindow.frame = frame;
    } completion:^(BOOL finished) {
        gPresentWindow.hidden = YES;
        gPresentWindow.rootViewController = nil;
    }];
}

- (void)contactPickerDidCancel:(CNContactPickerViewController *)picker {
    [self.class dismissPresentedViewController];
    if ([self.delegate respondsToSelector:@selector(contactPickerViewControllerDidCancel:)]) {
        [self.delegate contactPickerViewControllerDidCancel:picker];
    }
}

- (void)contactPickerViewController:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact {
    [self.class dismissPresentedViewController];
    if ([self.delegate respondsToSelector:@selector(contactPickerViewController:didSelectContact:)]) {
        [self.delegate contactPickerViewController:picker didSelectContact:contact];
    }
}

@end
