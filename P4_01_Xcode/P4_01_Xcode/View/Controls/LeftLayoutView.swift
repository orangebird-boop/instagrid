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
        
        let topFrame = UIImageView()
        topFrame.backgroundColor = .white
        
        let leftBottomFrame = UIImageView()
        leftBottomFrame.backgroundColor = .white
        
        let rightBottomFrame = UIImageView()
        rightBottomFrame.backgroundColor = .white
        
        
        
        
        topImageButton.setImage(UIImage(named: "Plus.png"), for: .normal)
        topImageButton.contentMode = .scaleAspectFill
        topImageButton.imageEdgeInsets = UIEdgeInsets.zero
        topImageButton.contentVerticalAlignment = .fill
        topImageButton.contentHorizontalAlignment = .fill
        
        
        
        rightBottomImageButton.setImage(UIImage(named: "Plus.png"), for: .normal)
        rightBottomImageButton.contentMode = .scaleAspectFill
        rightBottomImageButton.imageEdgeInsets = UIEdgeInsets.zero
        rightBottomImageButton.contentVerticalAlignment = .fill
        rightBottomImageButton.contentHorizontalAlignment = .fill
        
        
        
        leftBottomImageButton.setImage(UIImage(named: "Plus.png"), for: .normal)
        leftBottomImageButton.contentMode = .scaleAspectFill
        leftBottomImageButton.imageEdgeInsets = UIEdgeInsets.zero
        leftBottomImageButton.contentVerticalAlignment = .fill
        leftBottomImageButton.contentHorizontalAlignment = .fill
        
        
        
        addSubview(topFrame)
        addSubview(leftBottomFrame)
        addSubview(rightBottomFrame)
        addSubview(topImageButton)
        addSubview(leftBottomImageButton)
        addSubview(rightBottomImageButton)
        
        
        
        [topFrame, leftBottomFrame, rightBottomFrame, topImageButton,leftBottomImageButton,rightBottomImageButton ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        
        NSLayoutConstraint.activate([
            
            
            leftBottomFrame.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            leftBottomFrame.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            leftBottomFrame.heightAnchor.constraint(equalToConstant: 145),
            leftBottomFrame.widthAnchor.constraint(equalToConstant: 145),
            
            rightBottomFrame.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            rightBottomFrame.leftAnchor.constraint(equalTo: leftAnchor, constant: 165),
            rightBottomFrame.heightAnchor.constraint(equalToConstant: 145),
            rightBottomFrame.widthAnchor.constraint(equalToConstant: 145),
            
            topFrame.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            topFrame.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            topFrame.heightAnchor.constraint(equalToConstant: 145),
            topFrame.widthAnchor.constraint(equalToConstant: 300),
            
            rightBottomImageButton.centerXAnchor.constraint(equalTo: rightBottomFrame.centerXAnchor),
            rightBottomImageButton.centerYAnchor.constraint(equalTo: rightBottomFrame.centerYAnchor),
            rightBottomImageButton.heightAnchor.constraint(equalToConstant: 45),
            rightBottomImageButton.widthAnchor.constraint(equalToConstant: 45),
            
            leftBottomImageButton.centerXAnchor.constraint(equalTo: leftBottomFrame.centerXAnchor),
            leftBottomImageButton.centerYAnchor.constraint(equalTo: leftBottomFrame.centerYAnchor),
            leftBottomImageButton.heightAnchor.constraint(equalToConstant: 45),
            leftBottomImageButton.widthAnchor.constraint(equalToConstant: 45),
            
            topImageButton.centerXAnchor.constraint(equalTo: topFrame.centerXAnchor),
            topImageButton.centerYAnchor.constraint(equalTo: topFrame.centerYAnchor),
            topImageButton.heightAnchor.constraint(equalToConstant: 45),
            topImageButton.widthAnchor.constraint(equalToConstant: 45),
            
        ])
        
    }
    
    
    
}
