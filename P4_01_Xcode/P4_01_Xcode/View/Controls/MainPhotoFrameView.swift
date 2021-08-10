//
//  MainPhotoFrameView.swift
//  P4_01_Xcode
//
//  Created by Nora Lilla Matyassi on 10/08/2021.
//



/*
 let imageName = "yourImage.png"
 let image = UIImage(named: imageName)
 let imageView = UIImageView(image: image!)

 Finally you'll need to give imageView a frame and add it your view for it to be visible:

 imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
 view.addSubview(imageView)

 */
import UIKit

class MainPhotoFrameView: UIView {
    
    let mainLayoutImage = UIImageView()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        mainLayoutImage.backgroundColor = .white
        mainLayoutImage.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        addSubview(mainLayoutImage)
        
        [mainLayoutImage].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            mainLayoutImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            mainLayoutImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainLayoutImage.widthAnchor.constraint(equalToConstant: 200),
            mainLayoutImage.heightAnchor.constraint(equalToConstant: 200),
                                        
                                        ])
        
    }

}
