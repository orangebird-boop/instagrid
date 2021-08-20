//
//  RightLayoutView.swift
//  P4_01_Xcode
//
//  Created by Nora Lilla Matyassi on 20/08/2021.
//

import UIKit

class RightLayoutView: UIView {
    
    public let rightTopImageButton = UIButton(type: .custom)
    public let leftTopImageButton = UIButton(type: .custom)
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
        
        
        backgroundColor = UIColor(red: 15/255, green: 102/255, blue: 152/255, alpha: 1)
        
        
        let leftTopFrame = UIImageView()
        leftTopFrame.backgroundColor = .white
        
        let rightTopFrame = UIImageView()
        rightTopFrame.backgroundColor = .white
        
        let leftBottomFrame = UIImageView()
        leftBottomFrame.backgroundColor = .white
        
        let rightBottomFrame = UIImageView()
        rightBottomFrame.backgroundColor = .white
        
        
        rightTopImageButton.setImage(UIImage(named: "Plus.png"), for: .normal)
        rightTopImageButton.contentMode = .scaleAspectFill
        rightTopImageButton.imageEdgeInsets = UIEdgeInsets.zero
        rightTopImageButton.contentVerticalAlignment = .fill
        rightTopImageButton.contentHorizontalAlignment = .fill
        rightTopImageButton.tag = 10
        
        
        
        leftTopImageButton.setImage(UIImage(named: "Plus.png"), for: .normal)
        leftTopImageButton.contentMode = .scaleAspectFill
        leftTopImageButton.imageEdgeInsets = UIEdgeInsets.zero
        leftTopImageButton.contentVerticalAlignment = .fill
        leftTopImageButton.contentHorizontalAlignment = .fill
        leftTopImageButton.tag = 11
        
        
        
        rightBottomImageButton.setImage(UIImage(named: "Plus.png"), for: .normal)
        rightBottomImageButton.contentMode = .scaleAspectFill
        rightBottomImageButton.imageEdgeInsets = UIEdgeInsets.zero
        rightBottomImageButton.contentVerticalAlignment = .fill
        rightBottomImageButton.contentHorizontalAlignment = .fill
        rightBottomImageButton.tag = 12
        
        
        
        leftBottomImageButton.setImage(UIImage(named: "Plus.png"), for: .normal)
        leftBottomImageButton.contentMode = .scaleAspectFill
        leftBottomImageButton.imageEdgeInsets = UIEdgeInsets.zero
        leftBottomImageButton.contentVerticalAlignment = .fill
        leftBottomImageButton.contentHorizontalAlignment = .fill
        leftBottomImageButton.tag = 13
        
        
        addSubview(rightBottomFrame)
        addSubview(leftBottomFrame)
        addSubview(leftTopFrame)
        addSubview(rightTopFrame)
        
        addSubview(leftBottomImageButton)
        addSubview(rightBottomImageButton)
        addSubview(leftTopImageButton)
        addSubview(rightTopImageButton)
        
        [leftTopFrame, rightTopFrame, leftBottomFrame, rightBottomFrame, rightTopImageButton, leftTopImageButton, rightBottomImageButton, leftBottomImageButton].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            
            leftTopFrame.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            leftTopFrame.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            leftTopFrame.heightAnchor.constraint(equalToConstant: 145),
            leftTopFrame.widthAnchor.constraint(equalToConstant: 145),
            
            rightTopFrame.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            rightTopFrame.leftAnchor.constraint(equalTo: leftTopFrame.leftAnchor, constant: 155),
            rightTopFrame.heightAnchor.constraint(equalToConstant: 145),
            rightTopFrame.widthAnchor.constraint(equalToConstant: 145),
            
            leftBottomFrame.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            leftBottomFrame.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            leftBottomFrame.heightAnchor.constraint(equalToConstant: 145),
            leftBottomFrame.widthAnchor.constraint(equalToConstant: 145),
            
            rightBottomFrame.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            rightBottomFrame.leftAnchor.constraint(equalTo: leftAnchor, constant: 165),
            rightBottomFrame.heightAnchor.constraint(equalToConstant: 145),
            rightBottomFrame.widthAnchor.constraint(equalToConstant: 145),
            
            rightTopImageButton.centerXAnchor.constraint(equalTo: rightTopFrame.centerXAnchor),
            rightTopImageButton.centerYAnchor.constraint(equalTo: rightTopFrame.centerYAnchor),
            rightTopImageButton.heightAnchor.constraint(equalToConstant: 45),
            rightTopImageButton.widthAnchor.constraint(equalToConstant: 45),
            
            leftTopImageButton.centerXAnchor.constraint(equalTo: leftTopFrame.centerXAnchor),
            leftTopImageButton.centerYAnchor.constraint(equalTo: leftTopFrame.centerYAnchor),
            leftTopImageButton.heightAnchor.constraint(equalToConstant: 45),
            leftTopImageButton.widthAnchor.constraint(equalToConstant: 45),
            
            rightBottomImageButton.centerXAnchor.constraint(equalTo: rightBottomFrame.centerXAnchor),
            rightBottomImageButton.centerYAnchor.constraint(equalTo: rightBottomFrame.centerYAnchor),
            rightBottomImageButton.heightAnchor.constraint(equalToConstant: 45),
            rightBottomImageButton.widthAnchor.constraint(equalToConstant: 45),
            
            leftBottomImageButton.centerXAnchor.constraint(equalTo: leftBottomFrame.centerXAnchor),
            leftBottomImageButton.centerYAnchor.constraint(equalTo: leftBottomFrame.centerYAnchor),
            leftBottomImageButton.heightAnchor.constraint(equalToConstant: 45),
            leftBottomImageButton.widthAnchor.constraint(equalToConstant: 45),
            
        ])
        
        
    }
    
}
