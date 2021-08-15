//
//  MainPhotoFrameView.swift
//  P4_01_Xcode
//
//  Created by Nora Lilla Matyassi on 10/08/2021.
//




import UIKit

class MainPhotoFrameView: UIView {
    
    
    
    // variables for frame setup for layouts
    let layoutImage = UIView()
    let smallFrame1 = UIImageView()
    let smallFrame2 = UIImageView()
    let smallFrame3 = UIImageView()
    let smallFrame4 = UIImageView()
    let bigFrame = UIImageView()
    
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    
    let buttonImage = UIImage(named: "Plus.png")
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayout1View()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func loadImage(_ sender: UIButton!) {
        print("Button was tapped")
        smallFrame1.backgroundColor = .red
    }
    
    func setupLayout1View() {
        
        layoutImage.backgroundColor = UIColor(red: 15/255, green: 102/255, blue: 152/255, alpha: 1)
        addSubview(layoutImage)
        
        smallFrame1.backgroundColor = .white
        addSubview(smallFrame1)
        
        button1.setImage(buttonImage, for: .normal)
        button1.contentMode = .scaleAspectFill
        button1.imageEdgeInsets = UIEdgeInsets.zero
        button1.contentVerticalAlignment = .fill
        button1.contentHorizontalAlignment = .fill
        button1.addTarget(self, action: #selector(loadImage), for: .touchUpInside)
        self.smallFrame1.addSubview(button1)
        
       
        
        smallFrame2.backgroundColor = .white
        addSubview(smallFrame2)
        
        button2.setImage(buttonImage, for: .normal)
        button2.contentMode = .scaleAspectFill
        button2.imageEdgeInsets = UIEdgeInsets.zero
        button2.contentVerticalAlignment = .fill
        button2.contentHorizontalAlignment = .fill
        self.smallFrame2.addSubview(button2)
        
        bigFrame.backgroundColor = .white
        addSubview(bigFrame)
        
        button3.setImage(buttonImage, for: .normal)
        button3.contentMode = .scaleAspectFill
        button3.imageEdgeInsets = UIEdgeInsets.zero
        button3.contentVerticalAlignment = .fill
        button3.contentHorizontalAlignment = .fill
        self.bigFrame.addSubview(button3)
        
        [layoutImage, smallFrame1, smallFrame2, bigFrame, button1, button2, button3].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            layoutImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            layoutImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            layoutImage.widthAnchor.constraint(equalToConstant: 320),
            layoutImage.heightAnchor.constraint(equalToConstant: 320),
            
            smallFrame1.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            smallFrame1.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            smallFrame1.heightAnchor.constraint(equalToConstant: 145),
            smallFrame1.widthAnchor.constraint(equalToConstant: 145),
            
            smallFrame2.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            smallFrame2.leftAnchor.constraint(equalTo: leftAnchor, constant: 165),
            smallFrame2.heightAnchor.constraint(equalToConstant: 145),
            smallFrame2.widthAnchor.constraint(equalToConstant: 145),
            
            bigFrame.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            bigFrame.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            bigFrame.heightAnchor.constraint(equalToConstant: 145),
            bigFrame.widthAnchor.constraint(equalToConstant: 300),
            
            button1.centerXAnchor.constraint(equalTo: smallFrame1.centerXAnchor),
            button1.centerYAnchor.constraint(equalTo: smallFrame1.centerYAnchor),
            button1.heightAnchor.constraint(equalToConstant: 45),
            button1.widthAnchor.constraint(equalToConstant: 45),
            
            button2.centerXAnchor.constraint(equalTo: smallFrame2.centerXAnchor),
            button2.centerYAnchor.constraint(equalTo: smallFrame2.centerYAnchor),
            button2.heightAnchor.constraint(equalToConstant: 45),
            button2.widthAnchor.constraint(equalToConstant: 45),
            
            button3.centerXAnchor.constraint(equalTo: bigFrame.centerXAnchor),
            button3.centerYAnchor.constraint(equalTo: bigFrame.centerYAnchor),
            button3.heightAnchor.constraint(equalToConstant: 45),
            button3.widthAnchor.constraint(equalToConstant: 45),
                                        
                                        ])
        
    }
    
    func setupLayout2View() {
        
        layoutImage.backgroundColor = UIColor(red: 15/255, green: 102/255, blue: 152/255, alpha: 1)
        addSubview(layoutImage)
        
        smallFrame1.backgroundColor = .white
        addSubview(smallFrame1)
        
        smallFrame2.backgroundColor = .white
        addSubview(smallFrame2)
        
        bigFrame.backgroundColor = .white
        addSubview(bigFrame)
        
        [layoutImage, smallFrame1, smallFrame2, bigFrame].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            layoutImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            layoutImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            layoutImage.widthAnchor.constraint(equalToConstant: 320),
            layoutImage.heightAnchor.constraint(equalToConstant: 320),
            
            smallFrame1.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            smallFrame1.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            smallFrame1.heightAnchor.constraint(equalToConstant: 145),
            smallFrame1.widthAnchor.constraint(equalToConstant: 145),
            
            smallFrame2.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            smallFrame2.leftAnchor.constraint(equalTo: leftAnchor, constant: 165),
            smallFrame2.heightAnchor.constraint(equalToConstant: 145),
            smallFrame2.widthAnchor.constraint(equalToConstant: 145),
            
            bigFrame.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            bigFrame.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            bigFrame.heightAnchor.constraint(equalToConstant: 145),
            bigFrame.widthAnchor.constraint(equalToConstant: 300)
                                        
                                        ])
        
       
    }
    
    
    func setupLayout3View() {
        
        layoutImage.backgroundColor = UIColor(red: 15/255, green: 102/255, blue: 152/255, alpha: 1)
        addSubview(layoutImage)
        
        smallFrame1.backgroundColor = .white
        addSubview(smallFrame1)
        
        smallFrame2.backgroundColor = .white
        addSubview(smallFrame2)
        
        smallFrame3.backgroundColor = .white
        addSubview(smallFrame3)
        
        smallFrame4.backgroundColor = .white
        addSubview(smallFrame4)
        
        [layoutImage, smallFrame1, smallFrame2, smallFrame3, smallFrame4].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            layoutImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            layoutImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            layoutImage.widthAnchor.constraint(equalToConstant: 320),
            layoutImage.heightAnchor.constraint(equalToConstant: 320),
            
            smallFrame1.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            smallFrame1.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            smallFrame1.heightAnchor.constraint(equalToConstant: 145),
            smallFrame1.widthAnchor.constraint(equalToConstant: 145),
            
            smallFrame2.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            smallFrame2.leftAnchor.constraint(equalTo: leftAnchor, constant: 165),
            smallFrame2.heightAnchor.constraint(equalToConstant: 145),
            smallFrame2.widthAnchor.constraint(equalToConstant: 145),
            
            smallFrame3.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            smallFrame3.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            smallFrame3.heightAnchor.constraint(equalToConstant: 145),
            smallFrame3.widthAnchor.constraint(equalToConstant: 145),
            
            smallFrame4.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            smallFrame4.leftAnchor.constraint(equalTo: leftAnchor, constant: 165),
            smallFrame4.heightAnchor.constraint(equalToConstant: 145),
            smallFrame4.widthAnchor.constraint(equalToConstant: 145)
                                        
                                        ])
    
    }


}
