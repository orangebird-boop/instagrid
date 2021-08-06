//
//  LayoutSelectionView.swift
//  P4_01_Xcode
//
//  Created by Nora Lilla Matyassi on 05/08/2021.
//

import UIKit

class LayoutSelectionView: UIView {
    
    let leftLayoutButton = UIButton()
    let middleLayoutButton = UIButton()
    let rigthLayoutButton = UIButton()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        leftLayoutButton.setImage(UIImage(named: "Layout 1"), for: UIControl.State.normal)
        middleLayoutButton.setImage(UIImage(named: "Layout 2"), for: UIControl.State.normal)
        rigthLayoutButton.setImage(UIImage(named: "Layout 3"), for: UIControl.State.normal)
        
        [leftLayoutButton, middleLayoutButton, leftLayoutButton].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            middleLayoutButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -34),
            middleLayoutButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            middleLayoutButton.widthAnchor.constraint(equalToConstant: 64),
            middleLayoutButton.heightAnchor.constraint(equalToConstant: 64),
            
            rigthLayoutButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -34),
            rigthLayoutButton.leftAnchor.constraint(equalTo: middleLayoutButton.rightAnchor, constant: 32),
            rigthLayoutButton.widthAnchor.constraint(equalToConstant: 64),
            rigthLayoutButton.heightAnchor.constraint(equalToConstant: 64),
            
            leftLayoutButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -34),
            leftLayoutButton.rightAnchor.constraint(equalTo: middleLayoutButton.leftAnchor, constant: 34),
            leftLayoutButton.widthAnchor.constraint(equalToConstant: 64),
            leftLayoutButton.heightAnchor.constraint(equalToConstant: 64),
            
            
        ])
    }
}
