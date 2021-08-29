//
//  RootViewController.swift
//  P4_01_Xcode
//
//  Created by Nora Lilla Matyassi on 05/08/2021.
//

import UIKit

class RootViewController: UIViewController {
    
    let titleLabel = UILabel()
    
    let labelView = UIView()
    let swipeLabel = UILabel()
    
    let layoutContainer = UIView()
    
    let layoutSelectionView = LayoutSelectionView()
    
    
    
    let layout1image = UIImage(named: "Layout 1.png")
    let layout2image = UIImage(named: "Layout 2.png")
    let layout3image = UIImage(named: "Layout 3.png")
    let selectedLayoutImage = UIImage(named: "Selected.png")
    let plusImageForButton = UIImage(named: "Plus.png")
    
    let thirstySoftRegular = UIFont(name: "ThirstySoftRegular" , size: 30)!
    let delmMedium = UIFont(name: "Delm-Medium" , size: 28)!
    
    
    var lastTappedButton: UIButton?
    
    var lastUsedTag = 0
    
    let imagePicker = UIImagePickerController()
    
    var portrait = [NSLayoutConstraint]()
    var landscape = [NSLayoutConstraint]()
    
    override func loadView() {
        super.loadView()
        starterLayout()
        
        view.backgroundColor = #colorLiteral(red: 0.6850972772, green: 0.8479481339, blue: 0.9051222205, alpha: 1)
        
        view.addSubview(layoutSelectionView)
        
        layoutContainer.backgroundColor = UIColor(red: 15/255, green: 102/255, blue: 152/255, alpha: 1)
        
        view.addSubview(layoutContainer)
        layoutContainer.sizeToFit()
        
        titleLabel.text = "Instagrid"
        titleLabel.textColor = .white
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.font = UIFontMetrics(forTextStyle: .largeTitle).scaledFont(for: thirstySoftRegular)
        view.addSubview(titleLabel)
        titleLabel.sizeToFit()
        
        
        
        swipeLabel.numberOfLines = 0
        swipeLabel.textAlignment = .center
        swipeLabel.text = "^ \nSwipe up to share"
        swipeLabel.textColor = .white
        swipeLabel.adjustsFontForContentSizeCategory = true
        swipeLabel.font = UIFontMetrics(forTextStyle: .title3).scaledFont(for: delmMedium)
        view.addSubview(swipeLabel)
        swipeLabel.sizeToFit()
        
        let swipeGestureRecognizerUp = UISwipeGestureRecognizer(target: self, action: #selector(userDidSwipe))
        swipeGestureRecognizerUp.direction = .up
        self.layoutContainer.addGestureRecognizer(swipeGestureRecognizerUp)
        
        
        
        print("is this happening?")
        layoutSelectionView.leftLayoutButton.addTarget(self, action: #selector(userDidTap), for: .touchUpInside)
        layoutSelectionView.middleLayoutButton.addTarget(self, action: #selector(userDidTap), for: .touchUpInside)
        layoutSelectionView.rightLayoutButton .addTarget(self, action: #selector(userDidTap), for: .touchUpInside)
        
        self.view.addSubview(layoutSelectionView.leftLayoutButton)
        self.view.addSubview(layoutSelectionView.middleLayoutButton)
        self.view.addSubview(layoutSelectionView.rightLayoutButton)
        
        constraints()
        NSLayoutConstraint.activate(portrait)
    }
    
    
    
    
    
    func constraints() {
        
        [titleLabel,labelView, swipeLabel, layoutSelectionView, layoutContainer, layoutSelectionView.leftLayoutButton, layoutSelectionView.middleLayoutButton, layoutSelectionView.rightLayoutButton ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        portrait = [
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            
            layoutContainer.heightAnchor.constraint(equalToConstant: 320),
            layoutContainer.widthAnchor.constraint(equalTo: layoutContainer.heightAnchor),
            layoutContainer.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            layoutContainer.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            
            swipeLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            swipeLabel.bottomAnchor.constraint(equalTo: layoutContainer.topAnchor, constant: -20),
            
            layoutSelectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            layoutSelectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            layoutSelectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            layoutSelectionView.middleLayoutButton.bottomAnchor.constraint(equalTo:layoutSelectionView.bottomAnchor),
            layoutSelectionView.middleLayoutButton.centerXAnchor.constraint(equalTo: layoutSelectionView.centerXAnchor),
            layoutSelectionView.middleLayoutButton.widthAnchor.constraint(equalToConstant: 64),
            layoutSelectionView.middleLayoutButton.heightAnchor.constraint(equalToConstant: 64),
            
            layoutSelectionView.leftLayoutButton.bottomAnchor.constraint(equalTo: layoutSelectionView.safeAreaLayoutGuide.bottomAnchor),
            layoutSelectionView.leftLayoutButton.rightAnchor.constraint(equalTo: layoutSelectionView.middleLayoutButton.leftAnchor, constant: -32),
            layoutSelectionView.leftLayoutButton.widthAnchor.constraint(equalToConstant: 64),
            layoutSelectionView.leftLayoutButton.heightAnchor.constraint(equalToConstant: 64),
            
            
            
            layoutSelectionView.rightLayoutButton.bottomAnchor.constraint(equalTo: layoutSelectionView.safeAreaLayoutGuide.bottomAnchor),
            layoutSelectionView.rightLayoutButton.leftAnchor.constraint(equalTo: layoutSelectionView.middleLayoutButton.rightAnchor, constant: 32),
            layoutSelectionView.rightLayoutButton.widthAnchor.constraint(equalToConstant: 64),
            layoutSelectionView.rightLayoutButton.heightAnchor.constraint(equalToConstant: 64),
            
            
        ]
        
        landscape = [
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            
            layoutContainer.heightAnchor.constraint(equalToConstant: 320),
            layoutContainer.widthAnchor.constraint(equalTo: layoutContainer.heightAnchor),
           // layoutContainer.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -500),
            layoutContainer.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -8),
            layoutContainer.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            
            //swipeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            swipeLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 150),
            swipeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            /*
            layoutSelectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            layoutSelectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            layoutSelectionView.rightAnchor.constraint(equalTo: view.rightAnchor),*/
            
           // layoutSelectionView.middleLayoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            layoutSelectionView.middleLayoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            layoutSelectionView.middleLayoutButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -100),
            
            layoutSelectionView.leftLayoutButton.bottomAnchor.constraint(equalTo: layoutSelectionView.middleLayoutButton.topAnchor, constant: -32),
            layoutSelectionView.leftLayoutButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -100),
            
            layoutSelectionView.rightLayoutButton.topAnchor.constraint(equalTo: layoutSelectionView.middleLayoutButton.bottomAnchor, constant: 32),
            layoutSelectionView.rightLayoutButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -100),
          //  layoutSelectionView.middleLayoutButton.widthAnchor.constraint(equalToConstant: 64),
          //  layoutSelectionView.middleLayoutButton.heightAnchor.constraint(equalToConstant: 64),
            /*
            layoutSelectionView.leftLayoutButton.bottomAnchor.constraint(equalTo: layoutSelectionView.safeAreaLayoutGuide.bottomAnchor),
            layoutSelectionView.leftLayoutButton.rightAnchor.constraint(equalTo: layoutSelectionView.middleLayoutButton.leftAnchor, constant: -32),
            layoutSelectionView.leftLayoutButton.widthAnchor.constraint(equalToConstant: 64),
            layoutSelectionView.leftLayoutButton.heightAnchor.constraint(equalToConstant: 64),
            
            
            
            layoutSelectionView.rightLayoutButton.bottomAnchor.constraint(equalTo: layoutSelectionView.safeAreaLayoutGuide.bottomAnchor),
            layoutSelectionView.rightLayoutButton.leftAnchor.constraint(equalTo: layoutSelectionView.middleLayoutButton.rightAnchor, constant: 32),
            layoutSelectionView.rightLayoutButton.widthAnchor.constraint(equalToConstant: 64),
            layoutSelectionView.rightLayoutButton.heightAnchor.constraint(equalToConstant: 64),*/
        ]
        
    }
    
    /*
     override func viewDidLayoutSubviews() {
     if UIDevice.current.orientation.isLandscape {
     print("Landscape")
     NSLayoutConstraint.deactivate(portrait!)
     NSLayoutConstraint.activate(landscape!)
     } else {
     print("Portrait")
     NSLayoutConstraint.deactivate(landscape!)
     NSLayoutConstraint.activate(portrait!)
     }
     }
     
     */
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
     //   constraints()
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            swipeLabel.text = "< \nSwipe left to share"
            NSLayoutConstraint.deactivate(portrait)
            NSLayoutConstraint.activate(landscape)
        } else {
            print("Portrait")
            
            swipeLabel.text = "^ \nSwipe up to share"
            swipeLabel.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: delmMedium)
            NSLayoutConstraint.deactivate(landscape)
            NSLayoutConstraint.activate(portrait)
        }
    }
    
    
    
    
    func starterLayout() {
        
        
        layoutSelectionView.leftLayoutButton.setImage(selectedLayoutImage, for: .normal)
        
        let layoutView = LeftLayoutView()
        layoutView.topImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
        layoutView.rightBottomImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
        layoutView.leftBottomImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
        
        
        
        layoutContainer.addSubview(layoutView)
        layoutView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            layoutView.topAnchor.constraint(equalTo: layoutContainer.topAnchor),
            layoutView.rightAnchor.constraint(equalTo: layoutContainer.rightAnchor),
            layoutView.bottomAnchor.constraint(equalTo: layoutContainer.bottomAnchor),
            layoutView.leftAnchor.constraint(equalTo: layoutContainer.leftAnchor),
            
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
            
            finalLayoutView = layoutView
            
        default:
            fatalError("This is bad")
        }
        
        if let layoutView = finalLayoutView {
            print("cast layoutView")
            if !layoutContainer.subviews.isEmpty {
                print("it got in the if statement")
                layoutContainer.subviews.forEach { $0.removeFromSuperview() }
            }else{
                
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
    /*
    // Manage swipe direction depending on screen orientation
    @objc func whichSwipe(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .up && UIScreen.main.bounds.size.height > UIScreen.main.bounds.size.width {
            CentralView.animate(withDuration: 1) {
            self.centralView.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height)
            }
            self.shareCentralView()
        } else if sender.direction == .left &&  UIScreen.main.bounds.size.height < UIScreen.main.bounds.size.width {
            CentralView.animate(withDuration: 1) {
            self.centralView.transform = CGAffineTransform(translationX: -self.view.frame.width, y: 0)
            }
            self.shareCentralView()
        }
    }
    */
    @objc func userDidSwipe(_ sender: UISwipeGestureRecognizer) {
        var frame = layoutContainer.frame
        
        if sender.direction == .up {
            frame.origin.y -= 1000.0
            UIView.animate(withDuration: 1) {
                self.layoutContainer.frame = frame
                self.shareImage()
            }
        }
    }
    
    
    func shareImage() {
        print("share image")
        if let image = convertToImage() {
            let activityApplicationsView = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            self.present(activityApplicationsView, animated: true)
            activityApplicationsView.completionWithItemsHandler = { _, _,_,_ in
                UIView.animate(withDuration: 0.2) {
                    self.loadView()
                    self.starterLayout()
                }
                
                
                
                
            }
        }
        
    }
    func convertToImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(layoutContainer.bounds.size, true, 0)
        layoutContainer.drawHierarchy(in: layoutContainer.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}


