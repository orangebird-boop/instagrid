//
//  LayoutSelectionView.swift
//  P4_01_Xcode
//
//  Created by Nora Lilla Matyassi on 05/08/2021.
//

import UIKit

class LayoutSelectionView: UIView {
  
    let layout1image = UIImage(named: "Layout 1.png")
    let layout2image = UIImage(named: "Layout 2.png")
    let layout3image = UIImage(named: "Layout 3.png")

    
    let leftLayoutImageButton = UIButton()
    let middleLayoutImageButton = UIButton()
    let rightLayoutButton = UIButton()
    
    let mainPhotoFrameView = MainPhotoFrameView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        print("Paul is here")
        leftLayoutImageButton.setImage(layout1image, for: .normal)
        addSubview(leftLayoutImageButton)

        middleLayoutImageButton.setImage(layout2image, for: .normal)
        addSubview(middleLayoutImageButton)

        rightLayoutButton.setImage(layout3image, for: .normal)
        addSubview(rightLayoutButton)
        
        mainPhotoFrameView.backgroundColor = .white
        addSubview(mainPhotoFrameView)

        [leftLayoutImageButton, middleLayoutImageButton, rightLayoutButton, mainPhotoFrameView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([

            middleLayoutImageButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            middleLayoutImageButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            middleLayoutImageButton.widthAnchor.constraint(equalToConstant: 64),
            middleLayoutImageButton.heightAnchor.constraint(equalToConstant: 64),

            leftLayoutImageButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            leftLayoutImageButton.rightAnchor.constraint(equalTo: middleLayoutImageButton.leftAnchor, constant: -32),
            leftLayoutImageButton.widthAnchor.constraint(equalToConstant: 64),
            leftLayoutImageButton.heightAnchor.constraint(equalToConstant: 64),
        

            
            rightLayoutButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            rightLayoutButton.leftAnchor.constraint(equalTo: middleLayoutImageButton.rightAnchor, constant: 32),
            rightLayoutButton.widthAnchor.constraint(equalToConstant: 64),
            rightLayoutButton.heightAnchor.constraint(equalToConstant: 64),
            
            mainPhotoFrameView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -200),
            mainPhotoFrameView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainPhotoFrameView.widthAnchor.constraint(equalToConstant: 320),
            mainPhotoFrameView.heightAnchor.constraint(equalToConstant: 320),
            
        ])

        
        
    }
}
