//
//  LeftLayoutView.swift
//  P4_01_Xcode
//
//  Created by Nora Lilla Matyassi on 20/08/2021.
//

import UIKit

class LeftLayoutView: UIView {
    
    
    public let topImageButton = UIButton(type: .custom)
    public let rightBottomImageButton = UIButton(type: .custom)
    public let leftBottomImageButton = UIButton(type: .custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        let layoutContainer = UIView()
        layoutContainer.backgroundColor = UIColor(red: 15/255, green: 102/255, blue: 152/255, alpha: 1)
        
       
        
        
        
        
        topImageButton.setImage(UIImage(named: "Plus.png"), for: .normal)
        topImageButton.backgroundColor = .white
        topImageButton.imageEdgeInsets = UIEdgeInsets(top: 45, left: 180, bottom: 45, right: 180)
        topImageButton.contentVerticalAlignment = .fill
        topImageButton.contentHorizontalAlignment = .fill
        
        
        
        rightBottomImageButton.setImage(UIImage(named: "Plus.png"), for: .normal)
        rightBottomImageButton.backgroundColor = .white
        rightBottomImageButton.imageEdgeInsets = UIEdgeInsets(top: 45, left: 45, bottom: 45, right: 45)
        rightBottomImageButton.contentVerticalAlignment = .fill
        rightBottomImageButton.contentHorizontalAlignment = .fill
        
        
        
        leftBottomImageButton.setImage(UIImage(named: "Plus.png"), for: .normal)
        leftBottomImageButton.backgroundColor = .white
        leftBottomImageButton.imageEdgeInsets = UIEdgeInsets(top: 45, left: 45, bottom: 45, right: 45)
        leftBottomImageButton.contentVerticalAlignment = .fill
        leftBottomImageButton.contentHorizontalAlignment = .fill
        
        
        
       
        addSubview(topImageButton)
        addSubview(leftBottomImageButton)
        addSubview(rightBottomImageButton)
        
        
        
        [topImageButton,leftBottomImageButton,rightBottomImageButton ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        
        NSLayoutConstraint.activate([
            
            
            rightBottomImageButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -11),
            rightBottomImageButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -11),
            rightBottomImageButton.heightAnchor.constraint(equalToConstant: 145),
            rightBottomImageButton.widthAnchor.constraint(equalToConstant: 145),
            
            leftBottomImageButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -11),
            leftBottomImageButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 11),
            leftBottomImageButton.heightAnchor.constraint(equalToConstant: 145),
            leftBottomImageButton.widthAnchor.constraint(equalToConstant: 145),
            
            topImageButton.topAnchor.constraint(equalTo: topAnchor, constant: 11),
            topImageButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 11),
            topImageButton.heightAnchor.constraint(equalToConstant: 145),
            topImageButton.widthAnchor.constraint(equalToConstant: 300),
            
        ])
        
    }
    
    
    
}
