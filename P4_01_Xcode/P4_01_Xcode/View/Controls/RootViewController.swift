//
//  RootViewController.swift
//  P4_01_Xcode
//
//  Created by Nora Lilla Matyassi on 05/08/2021.
//

import UIKit

class RootViewController: UIViewController {

    let titleLabel = UILabel()
    
    let swipeLabel = UILabel()
    
    
   // let layoutSelectionView = UIView()
    
    let layout1image = UIImage(named: "Layout 1.png")
    let layout2image = UIImage(named: "Layout 2.png")
    let layout3image = UIImage(named: "Layout 3.png")
    let selectedLayoutImage = UIImage(named: "Selected.png")

    
    let leftLayoutButton = UIButton()
    let middleLayoutButton = UIButton()
    let rightLayoutButton = UIButton()
    
    var activatedButton = [UIButton]()
    var chosenLayout = UIButton()
    
    // variables for frame setup for layouts
    var layoutImage = UIView()
    
    let layoutContainer = UIView()
    
    let plusImageForButton = UIImage(named: "Plus.png")
    
    
    override func loadView() {
        super.loadView()
       
        
        
       // view.addSubview(layoutSelectionView)
        
        
        view.backgroundColor = #colorLiteral(red: 0.6850972772, green: 0.8479481339, blue: 0.9051222205, alpha: 1)
        
        layoutContainer.backgroundColor = UIColor(red: 15/255, green: 102/255, blue: 152/255, alpha: 1)
        view.addSubview(layoutContainer)
      
        titleLabel.text = "Instagrid"
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "ThirstySoftRegular" , size: 30)
        view.addSubview(titleLabel)
       
    
      
        swipeLabel.text = "Swipe up to share"
        swipeLabel.textColor = .white
        swipeLabel.font = UIFont(name: "Delm-Medium" , size: 26)
        view.addSubview(swipeLabel)
        
        
        
        leftLayoutButton.contentMode = .scaleAspectFill
        leftLayoutButton.imageEdgeInsets = UIEdgeInsets.zero
        leftLayoutButton.contentVerticalAlignment = .fill
        leftLayoutButton.contentHorizontalAlignment = .fill
        leftLayoutButton.setImage(layout1image, for: .normal)
        leftLayoutButton.addTarget(self, action: #selector(userDidTap), for: .touchUpInside)
        leftLayoutButton.tag = 1
        view.addSubview(leftLayoutButton)
        
        middleLayoutButton.contentMode = .scaleAspectFill
        middleLayoutButton.imageEdgeInsets = UIEdgeInsets.zero
        middleLayoutButton.contentVerticalAlignment = .fill
        middleLayoutButton.contentHorizontalAlignment = .fill
        middleLayoutButton.setImage(layout2image, for: .normal)
        middleLayoutButton.addTarget(self, action: #selector(userDidTap), for: .touchUpInside)
        middleLayoutButton.tag = 2
        view.addSubview(middleLayoutButton)

        rightLayoutButton.contentMode = .scaleAspectFill
        rightLayoutButton.imageEdgeInsets = UIEdgeInsets.zero
        rightLayoutButton.contentVerticalAlignment = .fill
        rightLayoutButton.contentHorizontalAlignment = .fill
        rightLayoutButton.setImage(layout3image, for: .normal)
        rightLayoutButton.addTarget(self, action: #selector(userDidTap), for: .touchUpInside)
        rightLayoutButton.tag = 3
        view.addSubview(rightLayoutButton)

       
  
        
      
        /*
        button1.setImage(buttonImage, for: .normal)
        button1.contentMode = .scaleAspectFill
        button1.imageEdgeInsets = UIEdgeInsets.zero
        button1.contentVerticalAlignment = .fill
        button1.contentHorizontalAlignment = .fill
        button1.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
     

        
        button2.setImage(buttonImage, for: .normal)
        button2.contentMode = .scaleAspectFill
        button2.imageEdgeInsets = UIEdgeInsets.zero
        button2.contentVerticalAlignment = .fill
        button2.contentHorizontalAlignment = .fill
        button2.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
  //      smallFrame2.addSubview(button2)
        
        
   
        
        button3.setImage(buttonImage, for: .normal)
        button3.contentMode = .scaleAspectFill
        button3.imageEdgeInsets = UIEdgeInsets.zero
        button3.contentVerticalAlignment = .fill
        button3.contentHorizontalAlignment = .fill
        button3.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
  //      bigFrame.addSubview(button3)
        
        button4.setImage(buttonImage, for: .normal)
        button4.contentMode = .scaleAspectFill
        button4.imageEdgeInsets = UIEdgeInsets.zero
        button4.contentVerticalAlignment = .fill
        button4.contentHorizontalAlignment = .fill
        button4.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
      
         */
        [titleLabel , swipeLabel, rightLayoutButton, leftLayoutButton, middleLayoutButton, layoutContainer].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
      
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            
            swipeLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 162),
            swipeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            middleLayoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75),
            middleLayoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            middleLayoutButton.widthAnchor.constraint(equalToConstant: 64),
            middleLayoutButton.heightAnchor.constraint(equalToConstant: 64),

            leftLayoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75),
            leftLayoutButton.rightAnchor.constraint(equalTo: middleLayoutButton.leftAnchor, constant: -32),
            leftLayoutButton.widthAnchor.constraint(equalToConstant: 64),
            leftLayoutButton.heightAnchor.constraint(equalToConstant: 64),
    
            
            rightLayoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75),
            rightLayoutButton.leftAnchor.constraint(equalTo: middleLayoutButton.rightAnchor, constant: 32),
            rightLayoutButton.widthAnchor.constraint(equalToConstant: 64),
            rightLayoutButton.heightAnchor.constraint(equalToConstant: 64),
            
            layoutContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -220),
            layoutContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            layoutContainer.widthAnchor.constraint(equalToConstant: 320),
            layoutContainer.heightAnchor.constraint(equalToConstant: 320),
            
           
            
        ])
    }

    @objc func userDidTap(_ sender: UIButton) {
        resetLayoutButtonImages()
       
        var layoutView : UIView?
        switch sender.tag {
        case 1:
            
            leftLayoutButton.setImage(selectedLayoutImage, for: .normal)
            layoutView = setupLayout1View()
        
        case 2:
            middleLayoutButton.setImage(selectedLayoutImage, for: .normal)
            layoutView = setupLayout2View()
        case 3:
            rightLayoutButton.setImage(selectedLayoutImage, for: .normal)
            layoutView = setupLayout3View()
        default:
            fatalError("This is bad")
        }
        
        if let layoutView = layoutView {
            if !layoutContainer.subviews.isEmpty {
                layoutContainer.subviews.forEach { $0.removeFromSuperview() }
            }
            
            layoutContainer.addSubview(layoutView)
            layoutView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                layoutView.topAnchor.constraint(equalTo: layoutContainer.topAnchor),
                layoutView.rightAnchor.constraint(equalTo: layoutContainer.rightAnchor),
                layoutView.bottomAnchor.constraint(equalTo: layoutContainer.bottomAnchor),
                layoutView.leftAnchor.constraint(equalTo: layoutContainer.leftAnchor),
                
            ])
        }
    
       
        print("Layout button was tapped !")
    }
    
    func userDidSwipe() {
        //do something
    }
    
  //BIG LAYOUTS //
    func resetLayoutButtonImages() {
        if leftLayoutButton.isSelected {
            print("is selected")
        }
    }
    
    func setupLayout1View() -> UIView {
      
       
        let layoutContainer = UIView()
        layoutContainer.backgroundColor = UIColor(red: 15/255, green: 102/255, blue: 152/255, alpha: 1)
        
        let topFrame = UIImageView()
        topFrame.backgroundColor = .white
        
        let leftBottomFrame = UIImageView()
        leftBottomFrame.backgroundColor = .white
        
        let rightBottomFrame = UIImageView()
        rightBottomFrame.backgroundColor = .white
        
        
        let topImageButton = UIButton(type: .custom)
        topImageButton.setImage(plusImageForButton, for: .normal)
        topImageButton.contentMode = .scaleAspectFill
        topImageButton.imageEdgeInsets = UIEdgeInsets.zero
        topImageButton.contentVerticalAlignment = .fill
        topImageButton.contentHorizontalAlignment = .fill
        topImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
        
        let rightBottomImageButton = UIButton(type: .custom)
        rightBottomImageButton.setImage(plusImageForButton, for: .normal)
        rightBottomImageButton.contentMode = .scaleAspectFill
        rightBottomImageButton.imageEdgeInsets = UIEdgeInsets.zero
        rightBottomImageButton.contentVerticalAlignment = .fill
        rightBottomImageButton.contentHorizontalAlignment = .fill
        rightBottomImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
        
        let leftBottomImageButton = UIButton(type: .custom)
        leftBottomImageButton.setImage(plusImageForButton, for: .normal)
        leftBottomImageButton.contentMode = .scaleAspectFill
        leftBottomImageButton.imageEdgeInsets = UIEdgeInsets.zero
        leftBottomImageButton.contentVerticalAlignment = .fill
        leftBottomImageButton.contentHorizontalAlignment = .fill
        leftBottomImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
        
        layoutContainer.addSubview(topFrame)
        layoutContainer.addSubview(leftBottomFrame)
        layoutContainer.addSubview(rightBottomFrame)
        topFrame.addSubview(topImageButton)
        leftBottomFrame.addSubview(leftBottomImageButton)
        rightBottomFrame.addSubview(rightBottomImageButton)
        
        
        
        [topFrame, leftBottomFrame, rightBottomFrame, topImageButton,leftBottomImageButton,rightBottomImageButton ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        
        NSLayoutConstraint.activate([
            
            
            leftBottomFrame.bottomAnchor.constraint(equalTo: layoutContainer.bottomAnchor, constant: -10),
            leftBottomFrame.leftAnchor.constraint(equalTo: layoutContainer.leftAnchor, constant: 10),
            leftBottomFrame.heightAnchor.constraint(equalToConstant: 145),
            leftBottomFrame.widthAnchor.constraint(equalToConstant: 145),
            
            rightBottomFrame.bottomAnchor.constraint(equalTo: layoutContainer.bottomAnchor, constant: -10),
            rightBottomFrame.leftAnchor.constraint(equalTo: layoutContainer.leftAnchor, constant: 165),
            rightBottomFrame.heightAnchor.constraint(equalToConstant: 145),
            rightBottomFrame.widthAnchor.constraint(equalToConstant: 145),
            
            topFrame.topAnchor.constraint(equalTo: layoutContainer.topAnchor, constant: 10),
            topFrame.leftAnchor.constraint(equalTo: layoutContainer.leftAnchor, constant: 10),
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
        return layoutContainer
        
    }
    
    func setupLayout2View() -> UIView {
        
        
        let layoutContainer = UIView()
        layoutContainer.backgroundColor = UIColor(red: 15/255, green: 102/255, blue: 152/255, alpha: 1)
        
        let bottomFrame = UIImageView()
        bottomFrame.backgroundColor = .white
        
        let leftTopFrame = UIImageView()
        leftTopFrame.backgroundColor = .white
        
        let rightTopFrame = UIImageView()
        rightTopFrame.backgroundColor = .white
        
        
        let bottomImageButton = UIButton(type: .custom)
        bottomImageButton.setImage(plusImageForButton, for: .normal)
        bottomImageButton.contentMode = .scaleAspectFill
        bottomImageButton.imageEdgeInsets = UIEdgeInsets.zero
        bottomImageButton.contentVerticalAlignment = .fill
        bottomImageButton.contentHorizontalAlignment = .fill
        bottomImageButton.addTarget(self, action: #selector(RootViewController.pickImage), for: .touchUpInside)
        
        let rightTopImageButton = UIButton(type: .custom)
        rightTopImageButton.setImage(plusImageForButton, for: .normal)
        rightTopImageButton.contentMode = .scaleAspectFill
        rightTopImageButton.imageEdgeInsets = UIEdgeInsets.zero
        rightTopImageButton.contentVerticalAlignment = .fill
        rightTopImageButton.contentHorizontalAlignment = .fill
        rightTopImageButton.addTarget(self, action: #selector(RootViewController.pickImage), for: .touchUpInside)
        
        let leftTopImageButton = UIButton(type: .custom)
        leftTopImageButton.setImage(plusImageForButton, for: .normal)
        leftTopImageButton.contentMode = .scaleAspectFill
        leftTopImageButton.imageEdgeInsets = UIEdgeInsets.zero
        leftTopImageButton.contentVerticalAlignment = .fill
        leftTopImageButton.contentHorizontalAlignment = .fill
        leftTopImageButton.addTarget(self, action: #selector(RootViewController.pickImage), for: .touchUpInside)
        
        layoutContainer.addSubview(bottomFrame)
        layoutContainer.addSubview(leftTopFrame)
        layoutContainer.addSubview(rightTopFrame)
        bottomFrame.addSubview(bottomImageButton)
        leftTopFrame.addSubview(leftTopImageButton)
        rightTopFrame.addSubview(rightTopImageButton)
        
        
        
        [bottomFrame, leftTopFrame, rightTopFrame, bottomImageButton, leftTopImageButton, rightTopImageButton ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        
        NSLayoutConstraint.activate([
            
            
            leftTopFrame.topAnchor.constraint(equalTo: layoutContainer.topAnchor, constant: 10),
            leftTopFrame.leftAnchor.constraint(equalTo: layoutContainer.leftAnchor, constant: 10),
            leftTopFrame.heightAnchor.constraint(equalToConstant: 145),
            leftTopFrame.widthAnchor.constraint(equalToConstant: 145),
            
            rightTopFrame.topAnchor.constraint(equalTo: layoutContainer.topAnchor, constant: 10),
            rightTopFrame.leftAnchor.constraint(equalTo: leftTopFrame.leftAnchor, constant: 155),
            rightTopFrame.heightAnchor.constraint(equalToConstant: 145),
            rightTopFrame.widthAnchor.constraint(equalToConstant: 145),
            
            bottomFrame.bottomAnchor.constraint(equalTo: layoutContainer.bottomAnchor, constant: -10),
            bottomFrame.leftAnchor.constraint(equalTo: layoutContainer.leftAnchor, constant: 10),
            bottomFrame.heightAnchor.constraint(equalToConstant: 145),
            bottomFrame.widthAnchor.constraint(equalToConstant: 300),
            
            rightTopImageButton.centerXAnchor.constraint(equalTo: rightTopFrame.centerXAnchor),
            rightTopImageButton.centerYAnchor.constraint(equalTo: rightTopFrame.centerYAnchor),
            rightTopImageButton.heightAnchor.constraint(equalToConstant: 45),
            rightTopImageButton.widthAnchor.constraint(equalToConstant: 45),
            
            leftTopImageButton.centerXAnchor.constraint(equalTo: leftTopFrame.centerXAnchor),
            leftTopImageButton.centerYAnchor.constraint(equalTo: leftTopFrame.centerYAnchor),
            leftTopImageButton.heightAnchor.constraint(equalToConstant: 45),
            leftTopImageButton.widthAnchor.constraint(equalToConstant: 45),
            
            bottomImageButton.centerXAnchor.constraint(equalTo: bottomFrame.centerXAnchor),
            bottomImageButton.centerYAnchor.constraint(equalTo: bottomFrame.centerYAnchor),
            bottomImageButton.heightAnchor.constraint(equalToConstant: 45),
            bottomImageButton.widthAnchor.constraint(equalToConstant: 45),
                                        
                                        ])
        return layoutContainer
        
    }
   
    func setupLayout3View()-> UIView {
   
        let layoutContainer = UIView()
        layoutContainer.backgroundColor = UIColor(red: 15/255, green: 102/255, blue: 152/255, alpha: 1)
        
        
        let leftTopFrame = UIImageView()
        leftTopFrame.backgroundColor = .white
        
        let rightTopFrame = UIImageView()
        rightTopFrame.backgroundColor = .white
        
        let leftBottomFrame = UIImageView()
        leftBottomFrame.backgroundColor = .white
        
        let rightBottomFrame = UIImageView()
        rightBottomFrame.backgroundColor = .white
        
        let rightTopImageButton = UIButton(type: .custom)
        rightTopImageButton.setImage(plusImageForButton, for: .normal)
        rightTopImageButton.contentMode = .scaleAspectFill
        rightTopImageButton.imageEdgeInsets = UIEdgeInsets.zero
        rightTopImageButton.contentVerticalAlignment = .fill
        rightTopImageButton.contentHorizontalAlignment = .fill
        rightTopImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
        
        let leftTopImageButton = UIButton(type: .custom)
        leftTopImageButton.setImage(plusImageForButton, for: .normal)
        leftTopImageButton.contentMode = .scaleAspectFill
        leftTopImageButton.imageEdgeInsets = UIEdgeInsets.zero
        leftTopImageButton.contentVerticalAlignment = .fill
        leftTopImageButton.contentHorizontalAlignment = .fill
        leftTopImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
        
        let rightBottomImageButton = UIButton(type: .custom)
        rightBottomImageButton.setImage(plusImageForButton, for: .normal)
        rightBottomImageButton.contentMode = .scaleAspectFill
        rightBottomImageButton.imageEdgeInsets = UIEdgeInsets.zero
        rightBottomImageButton.contentVerticalAlignment = .fill
        rightBottomImageButton.contentHorizontalAlignment = .fill
        rightBottomImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
        
        let leftBottomImageButton = UIButton(type: .custom)
        leftBottomImageButton.setImage(plusImageForButton, for: .normal)
        leftBottomImageButton.contentMode = .scaleAspectFill
        leftBottomImageButton.imageEdgeInsets = UIEdgeInsets.zero
        leftBottomImageButton.contentVerticalAlignment = .fill
        leftBottomImageButton.contentHorizontalAlignment = .fill
        leftBottomImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
        
        layoutContainer.addSubview(rightBottomFrame)
        layoutContainer.addSubview(leftBottomFrame)
        layoutContainer.addSubview(leftTopFrame)
        layoutContainer.addSubview(rightTopFrame)
        
        leftBottomFrame.addSubview(leftBottomImageButton)
        rightBottomFrame.addSubview(rightBottomImageButton)
        leftTopFrame.addSubview(leftTopImageButton)
        rightTopFrame.addSubview(rightTopImageButton)
        
        [leftTopFrame, rightTopFrame, leftBottomFrame, rightBottomFrame, rightTopImageButton, leftTopImageButton, rightBottomImageButton, leftBottomImageButton].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            
            leftTopFrame.topAnchor.constraint(equalTo: layoutContainer.topAnchor, constant: 10),
            leftTopFrame.leftAnchor.constraint(equalTo: layoutContainer.leftAnchor, constant: 10),
            leftTopFrame.heightAnchor.constraint(equalToConstant: 145),
            leftTopFrame.widthAnchor.constraint(equalToConstant: 145),
            
            rightTopFrame.topAnchor.constraint(equalTo: layoutContainer.topAnchor, constant: 10),
            rightTopFrame.leftAnchor.constraint(equalTo: leftTopFrame.leftAnchor, constant: 155),
            rightTopFrame.heightAnchor.constraint(equalToConstant: 145),
            rightTopFrame.widthAnchor.constraint(equalToConstant: 145),
            
            leftBottomFrame.bottomAnchor.constraint(equalTo: layoutContainer.bottomAnchor, constant: -10),
            leftBottomFrame.leftAnchor.constraint(equalTo: layoutContainer.leftAnchor, constant: 10),
            leftBottomFrame.heightAnchor.constraint(equalToConstant: 145),
            leftBottomFrame.widthAnchor.constraint(equalToConstant: 145),
            
            rightBottomFrame.bottomAnchor.constraint(equalTo: layoutContainer.bottomAnchor, constant: -10),
            rightBottomFrame.leftAnchor.constraint(equalTo: layoutContainer.leftAnchor, constant: 165),
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
        
        
        return layoutContainer
    
    }
    
    
    
     
    @objc func pickImage(_ sender: UIButton) {
      print("the plus was clicked")
        
    }
    
     
}



