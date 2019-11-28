//
//  CommonFunction.swift
//  CSM
//
//  Created by Dheeraj Arora on 13/09/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setCustomeImage() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "baseline-arrow_back-24px")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "baseline-arrow_back-24px")
        
    }
    
    
}
