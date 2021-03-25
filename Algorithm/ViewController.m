//
//  ViewController.m
//  Algorithm
//
//  Created by penggongxu on 2020/6/5.
//  Copyright © 2020 personnal. All rights reserved.
//

#import "ViewController.h"
#import "SinglyLinkedList.h"
#import "NSArray+Enum.h"
#import "SMYContactPresentTool.h"
#import <ContactsUI/ContactsUI.h>
//#import "NSArray+Description.h"

@interface ViewController () <CNContactPickerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor greenColor]];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(200, 200, 80, 80)];
    [self.view addSubview:btn];
    [btn setTitle:@"通讯录" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(presentContactPickerViewController) forControlEvents:UIControlEventTouchUpInside];
    
    // 指针
//    NSInteger a = 1;
//    NSInteger *b = &a;
//    *b = 3;
//    NSLog(@"a=%ld, ", a);
//    NSString *name = @"name";
//    NSLog(@"name存储数据的地址%p, name指针的地址%p", name, &name);
//    b = &a;
//    NSLog(@"\n a的地址为：%p \n b存储的数据:%ld \n ", &a, (long)*b);
    // Do any additional setup after loading the view.
//    ListNode *one = [ListNode nodeWithValue:2];
//    ListNode *two = [ListNode nodeWithValue:3];
//    ListNode *three = [ListNode nodeWithValue:4];
//    NSArray *array = @[one, two, three];
//    NSArray *copyArray = [array copy];
//    NSMutableArray *mutArray = [array mutableCopy];
//    ListNode *temp = array[2];
//    temp.value = 5;
//    NSLog(@"array:地址：%p, 内容：%@\ncopyArray:地址：%p, 内容：%@\nmutArray:地址：%p, 内容：%@\n", array, array, copyArray, copyArray, mutArray, mutArray);
    NSMutableString *str = [[NSMutableString alloc] initWithString:@"1"];
    NSMutableString *str1 = [[NSMutableString alloc] initWithString:@"2"];
    NSMutableString *str2 = [[NSMutableString alloc] initWithString:@"3"];
//    NSString *str = @"1";
//    NSString *str1 = @"2";
//    NSString *str2 = [NSString stringWithFormat:@"3"];
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[str, str1, str2]];
    [array removeObject:@"1"];

    NSLog(@"%@", array.firstObject);
//    NSArray *copyArray = [array copy];
//    NSNumber *number = @(4);
//    NSMutableArray *mutArray = [array mutableCopy];
//    NSMutableString *string1 = mutArray[2];
//    [string1 insertString:@"4" atIndex:0];

//    NSLog(@"array:地址：%p, 内容：%@\ncopyArray:地址：%p, 内容：%@\nmutArray:地址：%p, 内容：%@\n", array, array, copyArray, copyArray, mutArray, mutArray);
//    NSLog(@"%@\n\n%@\n\n%@", array, copyArray, mutArray);
    
//    [array enumerateObjectsWithBlock:^(NSString *obj, NSUInteger index, BOOL * _Nonnull stop) {
//        if ([obj isEqualToString:@"2"]) {
//            *stop = YES;
//        }
//    }];
    
    
//    SinglyLinkedList *linkedList = [[SinglyLinkedList alloc] init];
//    [linkedList insertNodeWithValue:1];
//    [linkedList insertNodeWithValue:4];
//    [linkedList insertNodeWithValue:8];
//    [linkedList insertNodeWithValue:11];
//    NSLog(@"%@", linkedList);
//    SinglyLinkedList *list2 = [[SinglyLinkedList alloc] init];
//    [list2 insertNodeWithValue:2];
//    [list2 insertNodeWithValue:9];
//    [list2 insertNodeWithValue:15];
//
//    ListNode *node = [SinglyLinkedList mergeList:linkedList.headNode withList:list2.headNode];
//    SinglyLinkedList *list3 = [[SinglyLinkedList alloc] init];
//    list3.headNode = node;
//    NSLog(@"%@", node);
//    ListNode *middleNode = [list3 getMiddleNode];
//    [list3 deleteNodeAtLastIndex:4];
//    NSLog(@"%@", list3);
}

- (void)presentContactPickerViewController {
//    [SMYContactPresentTool presentContactPickerViewControllerWithAnimated:YES];
    CNContactPickerViewController *picker = [[CNContactPickerViewController alloc] init];
    picker.delegate = self;
    picker.displayedPropertyKeys = @[CNContactPhoneNumbersKey];
    picker.modalPresentationStyle = UIModalPresentationFullScreen;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:picker animated:YES completion:nil];
    });
}


- (void)contactPickerDidCancel:(CNContactPickerViewController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact {
    [picker dismissViewControllerAnimated:YES completion:nil];
}


@end
