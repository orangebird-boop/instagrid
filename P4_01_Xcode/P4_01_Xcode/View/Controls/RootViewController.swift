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
    
    
    override func loadView() {
        super.loadView()
      //  setupLayout1View()
        
       // view.addSubview(layoutSelectionView)
        
        
        view.backgroundColor = #colorLiteral(red: 0.6850972772, green: 0.8479481339, blue: 0.9051222205, alpha: 1)
       
      
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

        layoutImage.backgroundColor = UIColor(red: 15/255, green: 102/255, blue: 152/255, alpha: 1)
        view.addSubview(layoutImage)
        
        
        
        smallFrame1.backgroundColor = .white
        //   smallFrame1.addSubview(button1)
        smallFrame2.backgroundColor = .white
        //     layoutImage.addSubview(smallFrame2)
        smallFrame3.backgroundColor = .white
        smallFrame4.backgroundColor = .white
        bigFrame.backgroundColor = .white
        //     layoutImage.addSubview(bigFrame)
        
       // layoutImage.addSubview(smallFrame1)
        
        button1.setImage(buttonImage, for: .normal)
        button1.contentMode = .scaleAspectFill
        button1.imageEdgeInsets = UIEdgeInsets.zero
        button1.contentVerticalAlignment = .fill
        button1.contentHorizontalAlignment = .fill
        button1.addTarget(self, action: #selector(loadImage), for: .touchUpInside)
     

        
        button2.setImage(buttonImage, for: .normal)
        button2.contentMode = .scaleAspectFill
        button2.imageEdgeInsets = UIEdgeInsets.zero
        button2.contentVerticalAlignment = .fill
        button2.contentHorizontalAlignment = .fill
        button2.addTarget(self, action: #selector(loadImage), for: .touchUpInside)
  //      smallFrame2.addSubview(button2)
        
        
   
        
        button3.setImage(buttonImage, for: .normal)
        button3.contentMode = .scaleAspectFill
        button3.imageEdgeInsets = UIEdgeInsets.zero
        button3.contentVerticalAlignment = .fill
        button3.contentHorizontalAlignment = .fill
        button3.addTarget(self, action: #selector(loadImage), for: .touchUpInside)
  //      bigFrame.addSubview(button3)
        
        button4.setImage(buttonImage, for: .normal)
        button4.contentMode = .scaleAspectFill
        button4.imageEdgeInsets = UIEdgeInsets.zero
        button4.contentVerticalAlignment = .fill
        button4.contentHorizontalAlignment = .fill
        button4.addTarget(self, action: #selector(loadImage), for: .touchUpInside)
      
        
        [titleLabel , swipeLabel, rightLayoutButton, leftLayoutButton, middleLayoutButton, layoutImage].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            /*
            layoutSelectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            layoutSelectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            layoutSelectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            */
            
            swipeLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 162),
            swipeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            middleLayoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            middleLayoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            middleLayoutButton.widthAnchor.constraint(equalToConstant: 64),
            middleLayoutButton.heightAnchor.constraint(equalToConstant: 64),

            leftLayoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            leftLayoutButton.rightAnchor.constraint(equalTo: middleLayoutButton.leftAnchor, constant: -32),
            leftLayoutButton.widthAnchor.constraint(equalToConstant: 64),
            leftLayoutButton.heightAnchor.constraint(equalToConstant: 64),
        

            
            rightLayoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            rightLayoutButton.leftAnchor.constraint(equalTo: middleLayoutButton.rightAnchor, constant: 32),
            rightLayoutButton.widthAnchor.constraint(equalToConstant: 64),
            rightLayoutButton.heightAnchor.constraint(equalToConstant: 64),
            
            layoutImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -165),
            layoutImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            layoutImage.widthAnchor.constraint(equalToConstant: 320),
            layoutImage.heightAnchor.constraint(equalToConstant: 320),
            
           
            
        ])
    }

    @objc func userDidTap(_ sender: UIButton) {
        
        chosenLayout = sender
        
            if chosenLayout.tag == 1 {
                layoutImage.removeFromSuperview()
                leftLayoutButton.setImage(selectedLayoutImage, for: .normal)
                setupLayout1View()
                middleLayoutButton.setImage(layout2image, for: .normal)
                rightLayoutButton.setImage(layout3image, for: .normal)
            }else if chosenLayout.tag == 2 {
                
                middleLayoutButton.setImage(selectedLayoutImage, for: .normal)
                setupLayout2View()
                rightLayoutButton.setImage(layout3image, for: .normal)
                leftLayoutButton.setImage(layout1image, for: .normal)
            }else if chosenLayout.tag == 3 {
                
                rightLayoutButton.setImage(selectedLayoutImage, for: .normal)
                setupLayout3View()
                middleLayoutButton.setImage(layout2image, for: .normal)
                leftLayoutButton.setImage(layout1image, for: .normal)
            }
       
        
        /*
        
        activatedButton.append(chosenLayout)
        chosenLayout.setImage(selectedLayoutImage, for: .normal)
        if activatedButton.count < 2 {
            activatedButton.removeAll()
        }
 */
        print("Layout button was tapped !")
    }
    
    func userDidSwipe() {
        //do something
    }
    
  //BIG LAYOUTS //
    
    func setupLayout1View() {
      
        /*
        
        smallFrame1.backgroundColor = .white
        
        
        button1.setImage(buttonImage, for: .normal)
        button1.contentMode = .scaleAspectFill
        button1.imageEdgeInsets = UIEdgeInsets.zero
        button1.contentVerticalAlignment = .fill
        button1.contentHorizontalAlignment = .fill
        button1.addTarget(self, action: #selector(loadImage), for: .touchUpInside)
        
        
       
        
        smallFrame2.backgroundColor = .white
       
        
        button2.setImage(buttonImage, for: .normal)
        button2.contentMode = .scaleAspectFill
        button2.imageEdgeInsets = UIEdgeInsets.zero
        button2.contentVerticalAlignment = .fill
        button2.contentHorizontalAlignment = .fill
        
        
        bigFrame.backgroundColor = .white
        
        
        button3.setImage(buttonImage, for: .normal)
        button3.contentMode = .scaleAspectFill
        button3.imageEdgeInsets = UIEdgeInsets.zero
        button3.contentVerticalAlignment = .fill
        button3.contentHorizontalAlignment = .fill
        
         */
        layoutImage = UIView()
        layoutImage.addSubview(smallFrame1)
        smallFrame1.addSubview(button1)
        layoutImage.addSubview(smallFrame2)
        smallFrame2.addSubview(button2)
        layoutImage.addSubview(bigFrame)
        bigFrame.addSubview(button3)
        
        [ layoutImage, smallFrame1, smallFrame2, bigFrame, button1, button2, button3].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        
        NSLayoutConstraint.activate([
            
            
            smallFrame1.bottomAnchor.constraint(equalTo: layoutImage.bottomAnchor, constant: -10),
            smallFrame1.leftAnchor.constraint(equalTo: layoutImage.leftAnchor, constant: 10),
            smallFrame1.heightAnchor.constraint(equalToConstant: 145),
            smallFrame1.widthAnchor.constraint(equalToConstant: 145),
            
            smallFrame2.bottomAnchor.constraint(equalTo: layoutImage.bottomAnchor, constant: -10),
            smallFrame2.leftAnchor.constraint(equalTo: layoutImage.leftAnchor, constant: 165),
            smallFrame2.heightAnchor.constraint(equalToConstant: 145),
            smallFrame2.widthAnchor.constraint(equalToConstant: 145),
            
            bigFrame.topAnchor.constraint(equalTo: layoutImage.topAnchor, constant: 10),
            bigFrame.leftAnchor.constraint(equalTo: layoutImage.leftAnchor, constant: 10),
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
        
        smallFrame1.addSubview(button1)
        smallFrame2.addSubview(button2)
        bigFrame.addSubview(button3)
        
        layoutImage.addSubview(smallFrame1)
        layoutImage.addSubview(smallFrame2)
        layoutImage.addSubview(bigFrame)
        
        [smallFrame1, smallFrame2, bigFrame, button1, button2, button3].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
           
            
            smallFrame1.topAnchor.constraint(equalTo: layoutImage.topAnchor, constant: 10),
            smallFrame1.leftAnchor.constraint(equalTo: layoutImage.leftAnchor, constant: 10),
            smallFrame1.heightAnchor.constraint(equalToConstant: 145),
            smallFrame1.widthAnchor.constraint(equalToConstant: 145),
            
            smallFrame2.topAnchor.constraint(equalTo: layoutImage.topAnchor, constant: 10),
            smallFrame2.leftAnchor.constraint(equalTo: layoutImage.leftAnchor, constant: 165),
            smallFrame2.heightAnchor.constraint(equalToConstant: 145),
            smallFrame2.widthAnchor.constraint(equalToConstant: 145),
            
            bigFrame.bottomAnchor.constraint(equalTo: layoutImage.bottomAnchor, constant: -10),
            bigFrame.leftAnchor.constraint(equalTo: layoutImage.leftAnchor, constant: 10),
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
    
    func setupLayout3View() {
   
        layoutImage.addSubview(smallFrame1)
        layoutImage.addSubview(smallFrame2)
        layoutImage.addSubview(smallFrame3)
        layoutImage.addSubview(smallFrame4)
        
        smallFrame1.addSubview(button1)
        smallFrame2.addSubview(button2)
        smallFrame3.addSubview(button3)
        smallFrame4.addSubview(button4)
        
        [ smallFrame1, smallFrame2, smallFrame3, smallFrame4, button1, button2, button3, button4 ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            
            smallFrame1.topAnchor.constraint(equalTo: layoutImage.topAnchor, constant: 10),
            smallFrame1.leftAnchor.constraint(equalTo: layoutImage.leftAnchor, constant: 10),
            smallFrame1.heightAnchor.constraint(equalToConstant: 145),
            smallFrame1.widthAnchor.constraint(equalToConstant: 145),
            
            smallFrame2.topAnchor.constraint(equalTo: layoutImage.topAnchor, constant: 10),
            smallFrame2.leftAnchor.constraint(equalTo: layoutImage.leftAnchor, constant: 165),
            smallFrame2.heightAnchor.constraint(equalToConstant: 145),
            smallFrame2.widthAnchor.constraint(equalToConstant: 145),
            
            smallFrame3.bottomAnchor.constraint(equalTo: layoutImage.bottomAnchor, constant: -10),
            smallFrame3.leftAnchor.constraint(equalTo: layoutImage.leftAnchor, constant: 10),
            smallFrame3.heightAnchor.constraint(equalToConstant: 145),
            smallFrame3.widthAnchor.constraint(equalToConstant: 145),
            
            smallFrame4.bottomAnchor.constraint(equalTo: layoutImage.bottomAnchor, constant: -10),
            smallFrame4.leftAnchor.constraint(equalTo: layoutImage.leftAnchor, constant: 165),
            smallFrame4.heightAnchor.constraint(equalToConstant: 145),
            smallFrame4.widthAnchor.constraint(equalToConstant: 145),
            
            button1.centerXAnchor.constraint(equalTo: smallFrame1.centerXAnchor),
            button1.centerYAnchor.constraint(equalTo: smallFrame1.centerYAnchor),
            button1.heightAnchor.constraint(equalToConstant: 45),
            button1.widthAnchor.constraint(equalToConstant: 45),
            
            button2.centerXAnchor.constraint(equalTo: smallFrame2.centerXAnchor),
            button2.centerYAnchor.constraint(equalTo: smallFrame2.centerYAnchor),
            button2.heightAnchor.constraint(equalToConstant: 45),
            button2.widthAnchor.constraint(equalToConstant: 45),
            
            button3.centerXAnchor.constraint(equalTo: smallFrame3.centerXAnchor),
            button3.centerYAnchor.constraint(equalTo: smallFrame3.centerYAnchor),
            button3.heightAnchor.constraint(equalToConstant: 45),
            button3.widthAnchor.constraint(equalToConstant: 45),
            
            button4.centerXAnchor.constraint(equalTo: smallFrame4.centerXAnchor),
            button4.centerYAnchor.constraint(equalTo: smallFrame4.centerYAnchor),
            button4.heightAnchor.constraint(equalToConstant: 45),
            button4.widthAnchor.constraint(equalToConstant: 45),
                                        
                                        ])
    
    }
    
    @objc func loadImage() {
        
    }
}




