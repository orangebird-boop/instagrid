//
//  RootViewController.swift
//  P4_01_Xcode
//
//  Created by Nora Lilla Matyassi on 05/08/2021.
//

import UIKit

class RootViewController: UIViewController {

    let titleLabel = UILabel()
    let layoutSelectionView = LayoutSelectionView()
    let swipeLabel = UILabel()
    
    
    override func loadView() {
        super.loadView()

        view.backgroundColor = #colorLiteral(red: 0.6850972772, green: 0.8479481339, blue: 0.9051222205, alpha: 1)
            

        titleLabel.text = "Instagrid"
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "ThirstySoftRegular" , size: 30)
        view.addSubview(titleLabel)
        
        

        layoutSelectionView.rightLayoutButton.addTarget(self, action: #selector(userDidTap), for: .touchUpInside)
        view.addSubview(layoutSelectionView)
        
        swipeLabel.text = "Swipe up to share"
        swipeLabel.textColor = .white
        swipeLabel.font = UIFont(name: "Delm-Medium" , size: 26)
        view.addSubview(swipeLabel)

        [titleLabel, layoutSelectionView, swipeLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            layoutSelectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            layoutSelectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            layoutSelectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            swipeLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 162),
            swipeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            
        ])
    }

    @objc
    func userDidTap() {
        
        print("Button was tapped !")
    }
    
    func userDidSwipe() {
        //do something
    }
}
