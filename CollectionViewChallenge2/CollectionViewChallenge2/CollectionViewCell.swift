//
//  CollectionViewCell.swift
//  CollectionViewChallenge2
//
//  Created by Gabrielle Brandenburg dos Anjos on 3/11/16.
//  Copyright © 2016 Gabrielle Brandenburg dos Anjos. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.frame.size = contentView.frame.size
        label.center = contentView.center
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = label.font.withSize(contentView.frame.height/2)
        contentView.addSubview(label)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
