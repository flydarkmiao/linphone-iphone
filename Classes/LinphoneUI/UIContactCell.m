/* UIContactCell.m
 *
 * Copyright (C) 2012  Belledonne Comunications, Grenoble, France
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */

#import "UIContactCell.h"
#import "Utils.h"
#import "FastAddressBook.h"
#import "UILabel+Boldify.h"

@implementation UIContactCell

@synthesize nameLabel;
@synthesize avatarImage;
@synthesize contact;

#pragma mark - Lifecycle Functions

- (id)initWithIdentifier:(NSString *)identifier {
	if ((self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier]) != nil) {
		NSArray *arrayOfViews =
			[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:self options:nil];

		if ([arrayOfViews count] >= 1) {
			[self.contentView addSubview:[arrayOfViews objectAtIndex:0]];
		}
	}
	return self;
}

#pragma mark - Property Functions

- (void)setContact:(ABRecordRef)acontact {
	contact = acontact;
	[ContactDisplay setDisplayNameLabel:nameLabel forContact:contact];
	_linphoneImage.hidden = !([FastAddressBook contactHasValidSipDomain:contact]);
}

#pragma mark -

- (void)touchUp:(id)sender {
	[self setHighlighted:true animated:true];
}

- (void)touchDown:(id)sender {
	[self setHighlighted:false animated:true];
}

- (NSString *)accessibilityLabel {
	return nameLabel.text;
}

- (void)setHighlighted:(BOOL)highlighted {
	[self setHighlighted:highlighted animated:FALSE];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
	[super setHighlighted:highlighted animated:animated];
	if (highlighted) {
		[nameLabel setTextColor:[UIColor whiteColor]];
	} else {
		[nameLabel setTextColor:[UIColor blackColor]];
	}
}

@end