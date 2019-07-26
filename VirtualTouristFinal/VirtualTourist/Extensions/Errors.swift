//
//  Errors.swift
//  VirtualTourist
//
//  Created by Ahmad on 25/07/2019.
//  Copyright © 2019 ahmad. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func alerts(errorMessage: String?) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
