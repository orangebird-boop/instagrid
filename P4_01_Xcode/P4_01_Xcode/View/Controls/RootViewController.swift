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
    
    override func loadView() {
        super.loadView()

        view.backgroundColor = .systemTeal

        titleLabel.text = "Instagrid"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        view.addSubview(titleLabel)

        layoutSelectionView.rightLayoutButton.addTarget(self, action: #selector(userDidTap), for: .touchUpInside)
        view.addSubview(layoutSelectionView)

        [titleLabel, layoutSelectionView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            layoutSelectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            layoutSelectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            layoutSelectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

    @objc
    func userDidTap() {
        print("Button was tapped !")
    }
}
