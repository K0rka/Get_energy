//
//  CreateOwnMethodVC.m
//  Get_Energy
//
//  Created by Korovkina on 10.07.13.
//  Copyright (c) 2013 Korovkina. All rights reserved.
//

#import "CreateOwnMethodVC.h"
#import "CreateOwnMethodCell.h"
#import <NSManagedObject+MagicalRecord.h>
#import <NSManagedObjectContext+MagicalRecord.h>
#import <NSManagedObjectContext+MagicalSaves.h>
#import <MagicalRecord/MagicalRecord+Actions.h>


@interface CreateOwnMethodVC () <UITextViewDelegate, UITextFieldDelegate> {
    GE_Method *_currentMethod;
    UIEdgeInsets _initInsets;
    CGPoint _initOffset;
}
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *starsImagesCollection;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveBarButtonItem;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIView *starsSuperview;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UILabel *wishLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UIView *moneySuperview;
@property (weak, nonatomic) IBOutlet UILabel *tagsLabel;
@property (weak, nonatomic) IBOutlet UIButton *addNewTagButton;

@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *moneyImagesCollection;
@end

@implementation CreateOwnMethodVC

- (id) initWithExistringMethod:(GE_Method *)method {
    self =  [[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"CreateOwnMethodVC"];//initWithNibName:nil bundle:nil];
    if (self) {
        _currentMethod = method;
    }
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self =  [[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"CreateOwnMethodVC"];//initWithNibName:nil bundle:nil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onKbShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onKbHide:) name:UIKeyboardWillHideNotification object:nil];
    self.titleTextField.delegate = self;
    self.wishLabel.text = NSLocalizedString(@"Desire level", nil);
    self.moneyLabel.text = NSLocalizedString(@"Money needed", nil);
    if (!_currentMethod) {
        self.titleTextField.placeholder = NSLocalizedString(@"Title", nil);
    }
    else {
        self.titleTextField.text = _currentMethod.title;
        if (_currentMethod.methodDescription) {
            self.descriptionTextView.text = _currentMethod.description;
        }
    }

	for (UIImageView *nextView in _starsImagesCollection) {
		[nextView setUserInteractionEnabled:YES];
		[nextView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onStarTapped:)]];
	}
	for (UIImageView *nextView in _moneyImagesCollection) {
		[nextView setUserInteractionEnabled:YES];
		[nextView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onMoneyTapped:)]];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


////////////////////////////////////////////////////////////////////////
#pragma mark - User Actions
////////////////////////////////////////////////////////////////////////
- (IBAction)onSavePressed:(id)sender {
    if (!_currentMethod) {
		[MagicalRecord saveWithBlock:^(NSManagedObjectContext *context) {
			GE_Method *newMethod = [GE_Method MR_createInContext:context];
			NSString *title = self.titleTextField.text;
			if (!title.length) {
				title = NSLocalizedString(@"_without_title", nil);
			}
			newMethod.title = title;
			if (self.descriptionTextView.text) {
				newMethod.methodDescription = self.descriptionTextView.text;
			}
		} completion:^(BOOL success, NSError *error) {
			[self.navigationController popViewControllerAnimated:YES];
		}];
    }
}


////////////////////////////////////////////////////////////////////////
#pragma mark - User Interaction
////////////////////////////////////////////////////////////////////////
- (IBAction)addNewTag:(id)sender {
}
- (IBAction)onScrollViewTap:(id)sender {
    [self.titleTextField resignFirstResponder];
    [self.descriptionTextView resignFirstResponder];
}


- (IBAction)onMoneyImagesPan:(UIPanGestureRecognizer *)recognizer {
	switch (recognizer.state) {
  case UIGestureRecognizerStateBegan: {
	  NSLog(@"");
  }
			break;
		case UIGestureRecognizerStateChanged: {
			for (UIImageView *nextView in _moneyImagesCollection) {
				CGPoint point1  = [recognizer locationInView:nextView];
				if (point1.x > CGRectGetWidth([nextView frame])/2.) {
					[nextView setBackgroundColor:[UIColor purpleColor]];
				}
				else if (point1.x < CGRectGetWidth([nextView frame])/2. - 2.5)  {
					[nextView setBackgroundColor:[UIColor clearColor]];
				}
				
			}

		}
			break;
  default:
			break;
	}
}

- (IBAction)onStarsImagesPan:(UIPanGestureRecognizer *)recognizer {
	if ( recognizer.state == UIGestureRecognizerStateChanged) {
		for (UIImageView *nextView in _starsImagesCollection) {
			CGPoint point1  = [recognizer locationInView:nextView];
			if (point1.x > CGRectGetWidth([nextView frame])/2.) {
				[nextView setBackgroundColor:[UIColor yellowColor]];
			}
			else if (point1.x < CGRectGetWidth([nextView frame])/2. - 2.5)  {
				[nextView setBackgroundColor:[UIColor clearColor]];
			}
			
		}
	}
}


////////////////////////////////////////////////////////////////////////
#pragma mark - Keyboard
////////////////////////////////////////////////////////////////////////
- (void) onKbShow:(NSNotification *)ntf {
    NSDictionary *userInfo = ntf.userInfo;
    CGRect kbRect = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    _initOffset = self.scrollView.contentOffset;
    CGPoint newOffset = _initOffset;
    if ([self.descriptionTextView isFirstResponder]) {
        newOffset.y += CGRectGetMinY(self.descriptionTextView.frame) - 50;
    }
    else if ([self.titleTextField isFirstResponder]) {
        newOffset.y += CGRectGetMinY(self.titleTextField.frame) +10;
    }
    UIEdgeInsets insets = self.scrollView.contentInset;
    _initInsets = insets;
    insets.bottom = CGRectGetHeight(kbRect);
    [UIView animateWithDuration:[userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue] animations:^{
        _scrollView.contentInset = insets;
        _scrollView.contentOffset = newOffset;

    }];
    
}

- (void) onKbHide:(NSNotification *)ntf {
    
    NSDictionary *userInfo = ntf.userInfo;

    [UIView animateWithDuration:[userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue] animations:^{
        self.scrollView.contentInset = _initInsets;
        _scrollView.contentOffset = _initOffset;
    }];
}

////////////////////////////////////////////////////////////////////////
#pragma mark - UITextFieldDelegate
////////////////////////////////////////////////////////////////////////
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.titleTextField]) {
        [self.descriptionTextView becomeFirstResponder];
        
        _initOffset = self.scrollView.contentOffset;
        CGPoint newOffset = _initOffset;
        newOffset.y += CGRectGetMinY(self.descriptionTextView.frame) - 50;
        [UIView animateWithDuration:0.25 animations:^{
            _scrollView.contentOffset = newOffset;
            
        }];
        
    }
    return YES;
}


////////////////////////////////////////////////////////////////////////
#pragma mark - Gestures
////////////////////////////////////////////////////////////////////////
-(void)onStarTapped:(UITapGestureRecognizer *)recgn {
	BOOL findView = NO;
	for (UIImageView *nextImageView in _starsImagesCollection) {
		[nextImageView setBackgroundColor:[UIColor yellowColor]];
		if (findView) {
			[nextImageView setBackgroundColor:[UIColor clearColor]];
		}
		if (nextImageView == recgn.view) {
			findView = YES;
		}
	}
}

-(void)onMoneyTapped:(UITapGestureRecognizer *)recgn {
	BOOL findView = NO;
	for (UIImageView *nextImageView in _moneyImagesCollection) {
		[nextImageView setBackgroundColor:[UIColor purpleColor]];
		if (findView) {
			[nextImageView setBackgroundColor:[UIColor clearColor]];
		}
		if (nextImageView == recgn.view) {
			findView = YES;
		}
	}
}

@end
