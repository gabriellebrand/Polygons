//
//  CGFloatExtension.swift
//  CollectionViewChallenge2
//
//  Created by Gabrielle Brandenburg dos Anjos on 3/11/16.
//  Copyright © 2016 Gabrielle Brandenburg dos Anjos. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
    func radians() -> CGFloat {
        let b = CGFloat(M_PI) * (self/180)
        return b
    }
}

