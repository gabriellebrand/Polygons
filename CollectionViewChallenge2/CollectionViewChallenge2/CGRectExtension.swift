//
//  CGRectExtension.swift
//  CollectionViewChallenge2
//
//  Created by Gabrielle Brandenburg dos Anjos on 3/11/16.
//  Copyright © 2016 Gabrielle Brandenburg dos Anjos. All rights reserved.
//

import Foundation
import UIKit

extension CGRect {
    var wh: (w: CGFloat, h: CGFloat) {
        return (size.width, size.height)
    }
}

let (width, height) = UIScreen.main.bounds.wh
