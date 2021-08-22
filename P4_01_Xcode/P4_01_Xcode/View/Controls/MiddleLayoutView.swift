

import UIKit

class MiddleLayoutView: UIView {
    
    public let bottomImageButton = UIButton(type: .custom)
    public let rightTopImageButton = UIButton(type: .custom)
    public let leftTopImageButton = UIButton(type: .custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = UIColor(red: 15/255, green: 102/255, blue: 152/255, alpha: 1)
        
        
        
        bottomImageButton.setImage(UIImage(named: "Plus.png"), for: .normal)
        bottomImageButton.backgroundColor = .white
        bottomImageButton.imageEdgeInsets = UIEdgeInsets(top: 45, left: 180, bottom: 45, right: 180)
        bottomImageButton.contentVerticalAlignment = .fill
        bottomImageButton.contentHorizontalAlignment = .fill
       
        
        rightTopImageButton.setImage(UIImage(named: "Plus.png"), for: .normal)
        rightTopImageButton.backgroundColor = .white
        rightTopImageButton.imageEdgeInsets = UIEdgeInsets(top: 45, left: 45, bottom: 45, right: 45)
        rightTopImageButton.contentVerticalAlignment = .fill
        rightTopImageButton.contentHorizontalAlignment = .fill
        
        leftTopImageButton.setImage(UIImage(named: "Plus.png"), for: .normal)
        leftTopImageButton.backgroundColor = .white
        leftTopImageButton.imageEdgeInsets = UIEdgeInsets(top: 45, left: 45, bottom: 45, right: 45)
        leftTopImageButton.contentVerticalAlignment = .fill
        leftTopImageButton.contentHorizontalAlignment = .fill
        
        
        addSubview(bottomImageButton)
        addSubview(leftTopImageButton)
        addSubview(rightTopImageButton)
        
        
        [bottomImageButton, leftTopImageButton, rightTopImageButton ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
          
            rightTopImageButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            rightTopImageButton.leftAnchor.constraint(equalTo: leftTopImageButton.leftAnchor, constant: 155),
            rightTopImageButton.heightAnchor.constraint(equalToConstant: 145),
            rightTopImageButton.widthAnchor.constraint(equalToConstant: 145),
            
            leftTopImageButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            leftTopImageButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            leftTopImageButton.heightAnchor.constraint(equalToConstant: 145),
            leftTopImageButton.widthAnchor.constraint(equalToConstant: 145),
            
            bottomImageButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            bottomImageButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            bottomImageButton.heightAnchor.constraint(equalToConstant: 145),
            bottomImageButton.widthAnchor.constraint(equalToConstant: 300),
            
        ])
        
    }
    
}
