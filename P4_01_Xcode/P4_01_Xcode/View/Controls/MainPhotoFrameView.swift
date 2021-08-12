//
//  MainPhotoFrameView.swift
//  P4_01_Xcode
//
//  Created by Nora Lilla Matyassi on 10/08/2021.
//




import UIKit

class MainPhotoFrameView: UIView {
    
    let mainLayoutImage = UIImageView()
    
    // frame setup for layout 1
    
    let smallFrameL = UIImageView()
    let smallFrameR = UIImageView()
    let bigFrame = UIImageView()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        mainLayoutImage.backgroundColor = UIColor(red: 15/255, green: 102/255, blue: 152/255, alpha: 1)
        addSubview(mainLayoutImage)
        
        smallFrameL.backgroundColor = .white
        addSubview(smallFrameL)
        
        smallFrameR.backgroundColor = .white
        addSubview(smallFrameR)
        
        bigFrame.backgroundColor = .white
        addSubview(bigFrame)
        
        [mainLayoutImage, smallFrameL, smallFrameR, bigFrame].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            mainLayoutImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            mainLayoutImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainLayoutImage.widthAnchor.constraint(equalToConstant: 320),
            mainLayoutImage.heightAnchor.constraint(equalToConstant: 320),
            
            smallFrameL.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            smallFrameL.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            smallFrameL.heightAnchor.constraint(equalToConstant: 145),
            smallFrameL.widthAnchor.constraint(equalToConstant: 145),
            
            smallFrameR.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            smallFrameR.leftAnchor.constraint(equalTo: leftAnchor, constant: 165),
            smallFrameR.heightAnchor.constraint(equalToConstant: 145),
            smallFrameR.widthAnchor.constraint(equalToConstant: 145),
            
            bigFrame.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            bigFrame.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            bigFrame.heightAnchor.constraint(equalToConstant: 145),
            bigFrame.widthAnchor.constraint(equalToConstant: 300)
                                        
                                        ])
        
    }

}
