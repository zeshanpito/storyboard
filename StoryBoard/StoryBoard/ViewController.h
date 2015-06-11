//
//  ViewController.h
//  StoryBoard
//
//  Created by Zeshan Hayder on 11/06/2015.
//  Copyright (c) 2015 Putitout. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM (NSInteger, PIOTextBoxType) {
    PIOTextBoxTypeFirstName,
    PIOTextBoxTypeSurname,
    PIOTextBoxTypeEmail,
    PIOTextBoxTypePassword
};

@interface ViewController : UIViewController <UITextFieldDelegate>


@end

