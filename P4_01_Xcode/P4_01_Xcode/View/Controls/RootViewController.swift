//
//  RootViewController.swift
//  P4_01_Xcode
//
//  Created by Nora Lilla Matyassi on 05/08/2021.
//

import UIKit

class RootViewController: UIViewController {
    
    let titleLabel = UILabel()
    let layoutSelectionView = LayoutSelectionView()
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .systemTeal
        
        titleLabel.text = "Instagrid"
    }
    
   
}
