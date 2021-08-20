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
    
    let layoutContainer = UIView()
    
    let layoutSelectionView = LayoutSelectionView()
    
    let layout1image = UIImage(named: "Layout 1.png")
    let layout2image = UIImage(named: "Layout 2.png")
    let layout3image = UIImage(named: "Layout 3.png")
    let selectedLayoutImage = UIImage(named: "Selected.png")
    let plusImageForButton = UIImage(named: "Plus.png")
    
    
    var lastTappedButton: UIButton?
    
    var lastUsedTag = 0
    
    let imagePicker = UIImagePickerController()
    
    override func loadView() {
        super.loadView()
    
        
        view.backgroundColor = #colorLiteral(red: 0.6850972772, green: 0.8479481339, blue: 0.9051222205, alpha: 1)
        
        view.addSubview(layoutSelectionView)
        
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
        
        layoutSelectionView.leftLayoutButton.addTarget(self, action: #selector(userDidTap), for: .touchUpInside)
        layoutSelectionView.middleLayoutButton.addTarget(self, action: #selector(userDidTap), for: .touchUpInside)
        layoutSelectionView.rightLayoutButton.addTarget(self, action: #selector(userDidTap), for: .touchUpInside)
        
        [titleLabel , swipeLabel, layoutSelectionView, layoutContainer, layoutSelectionView.leftLayoutButton, layoutSelectionView.middleLayoutButton, layoutSelectionView.rightLayoutButton ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            swipeLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 162),
            swipeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            layoutContainer.heightAnchor.constraint(equalToConstant: 320),
            layoutContainer.widthAnchor.constraint(equalToConstant: 320),
            layoutContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            layoutContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            layoutSelectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 25),
            layoutSelectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            layoutSelectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
            
            
            
            
        ])
    }
    
    @objc func userDidTap(_ sender: UIButton) {
        
        resetLayoutButtonImages()
        
        print(sender.tag)
        
        var finalLayoutView : UIView?
        
        switch sender.tag {
        case 1:
            print("case 1")
            
            layoutSelectionView.leftLayoutButton.setImage(selectedLayoutImage, for: .normal)
            
            let layoutView = LeftLayoutView()
            layoutView.topImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
            layoutView.rightBottomImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
            layoutView.leftBottomImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
            
            finalLayoutView = layoutView
            
        case 2:
            layoutSelectionView.middleLayoutButton.setImage(selectedLayoutImage, for: .normal)
            let layoutView = MiddleLayoutView()
            
            layoutView.leftTopImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
            layoutView.rightTopImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
            layoutView.bottomImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
            
            finalLayoutView = layoutView
            
        case 3:
            layoutSelectionView.rightLayoutButton.setImage(selectedLayoutImage, for: .normal)
            let layoutView = RightLayoutView()
            
            layoutView.rightTopImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
            layoutView.leftTopImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
            layoutView.rightBottomImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
            layoutView.leftBottomImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
            
        default:
            fatalError("This is bad")
        }
        
        if let layoutView = finalLayoutView {
            print("cast layoutView")
            if !layoutContainer.subviews.isEmpty {
                print("it got in the if statement")
                layoutContainer.subviews.forEach { $0.removeFromSuperview() }
            }else{
                print("it failed")
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
    
    func createSwipe() {
        let swipeLeft = UISwipeGestureRecognizer()
        swipeLeft.addTarget(self, action: #selector(userDidSwipe))
        swipeLeft.direction = .left
        
    }
    
    @objc func userDidSwipe() {
        print("save image")
    }
    
    //BIG LAYOUTS //
    func resetLayoutButtonImages() {
        layoutSelectionView.leftLayoutButton.setImage(layout1image, for: .normal)
        layoutSelectionView.middleLayoutButton.setImage(layout2image, for: .normal)
        layoutSelectionView.rightLayoutButton.setImage(layout3image, for: .normal)
    }
    
    
    
    
    
    
    @objc func pickImage(_ sender: AnyObject) {
        print( "the plus was clicked")
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
        
        if let tappedImageButton = sender as? UIButton {
            lastTappedButton = tappedImageButton
        }
        
        
    }
    
    
    
    
}

extension RootViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else{
            return
        }
        
        if let lastTappedButton = lastTappedButton {
            print("the image is saved")
            lastTappedButton.setImage(selectedImage, for: .normal)
            lastTappedButton.contentMode = .scaleAspectFill
            lastTappedButton.imageEdgeInsets = UIEdgeInsets.zero
            lastTappedButton.contentVerticalAlignment = .fill
            lastTappedButton.contentHorizontalAlignment = .fill
            
            self.lastTappedButton = nil
            
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}

