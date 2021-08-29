

import UIKit

class LayoutSelectionView: UIView {
    
    let layout1image = UIImage(named: "Layout 1.png")
    let layout2image = UIImage(named: "Layout 2.png")
    let layout3image = UIImage(named: "Layout 3.png")
    
    
    public let leftLayoutButton = UIButton(type: .custom)
    public let middleLayoutButton = UIButton(type: .custom)
    public let rightLayoutButton = UIButton(type: .custom)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //rightLayoutButton.addTarget(self, action: #selector(userDidTap), for: .touchUpInside)
    
    func setupView() {
        print("Paul is here")
        
        
        
        leftLayoutButton.contentMode = .scaleAspectFill
        leftLayoutButton.imageEdgeInsets = UIEdgeInsets.zero
        leftLayoutButton.contentVerticalAlignment = .fill
        leftLayoutButton.contentHorizontalAlignment = .fill
        leftLayoutButton.setImage(layout1image, for: .normal)
        leftLayoutButton.tag = 1
        
        
        
        middleLayoutButton.contentMode = .scaleAspectFill
        middleLayoutButton.imageEdgeInsets = UIEdgeInsets.zero
        middleLayoutButton.contentVerticalAlignment = .fill
        middleLayoutButton.contentHorizontalAlignment = .fill
        middleLayoutButton.setImage(layout2image, for: .normal)
        middleLayoutButton.tag = 2
        
        
        
        rightLayoutButton.contentMode = .scaleAspectFill
        rightLayoutButton.imageEdgeInsets = UIEdgeInsets.zero
        rightLayoutButton.contentVerticalAlignment = .fill
        rightLayoutButton.contentHorizontalAlignment = .fill
        rightLayoutButton.setImage(layout3image, for: .normal)
        rightLayoutButton.tag = 3

        
        addSubview(leftLayoutButton)
        addSubview(middleLayoutButton)
        addSubview(rightLayoutButton)
        
        
        
        [leftLayoutButton, middleLayoutButton, rightLayoutButton, ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            
          
            middleLayoutButton.widthAnchor.constraint(equalToConstant: 64),
            middleLayoutButton.heightAnchor.constraint(equalToConstant: 64),
            
            leftLayoutButton.widthAnchor.constraint(equalToConstant: 64),
            leftLayoutButton.heightAnchor.constraint(equalToConstant: 64),

            rightLayoutButton.widthAnchor.constraint(equalToConstant: 64),
            rightLayoutButton.heightAnchor.constraint(equalToConstant: 64),
                  
            
        ])

    }

}

