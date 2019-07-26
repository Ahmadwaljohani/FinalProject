//
//  Images.swift
//  VirtualTourist
//
//  Created by Ahmad on 25/07/2019.
//  Copyright © 2019 ahmad. All rights reserved.
//

import UIKit

extension Photo {
    func setPhoto(image: UIImage) {
        self.image = image.pngData()
    }
    
    func getPhoto() -> UIImage? {
        return (image == nil) ? nil : UIImage(data: image!)
    }
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        createdDate = Date()
    }
}
