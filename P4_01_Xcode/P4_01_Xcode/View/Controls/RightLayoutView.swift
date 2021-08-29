

import UIKit

class RightLayoutView: UIView {
    
    public let rightTopImageButton = UIButton(type: .custom)
    public let leftTopImageButton = UIButton(type: .custom)
    public let rightBottomImageButton = UIButton(type: .custom)
    public let leftBottomImageButton = UIButton(type: .custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        
        backgroundColor = UIColor(red: 15/255, green: 102/255, blue: 152/255, alpha: 1)
        
        
        
        
        
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
        
        
        
        
        rightBottomImageButton.setImage(UIImage(named: "Plus.png"), for: .normal)
        rightBottomImageButton.backgroundColor = .white
        rightBottomImageButton.imageEdgeInsets = UIEdgeInsets(top: 45, left: 45, bottom: 45, right: 45)
        rightBottomImageButton.contentVerticalAlignment = .fill
        rightBottomImageButton.contentHorizontalAlignment = .fill
        
        
        
        
        leftBottomImageButton.setImage(UIImage(named: "Plus.png"), for: .normal)
        leftBottomImageButton.backgroundColor = .white
        leftBottomImageButton.imageEdgeInsets = UIEdgeInsets(top: 45, left: 45, bottom: 45, right: 45)
        leftBottomImageButton.contentVerticalAlignment = .fill
        leftBottomImageButton.contentHorizontalAlignment = .fill
        
        
        addSubview(leftBottomImageButton)
        addSubview(rightBottomImageButton)
        addSubview(leftTopImageButton)
        addSubview(rightTopImageButton)
        
        [rightTopImageButton, leftTopImageButton, rightBottomImageButton, leftBottomImageButton].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            
            
            rightTopImageButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            rightTopImageButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            rightTopImageButton.heightAnchor.constraint(equalToConstant: 145),
            rightTopImageButton.widthAnchor.constraint(equalToConstant: 145),
            
            leftTopImageButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            leftTopImageButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            leftTopImageButton.heightAnchor.constraint(equalToConstant: 145),
            leftTopImageButton.widthAnchor.constraint(equalToConstant: 145),
            
            rightBottomImageButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            rightBottomImageButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            rightBottomImageButton.heightAnchor.constraint(equalToConstant: 145),
            rightBottomImageButton.widthAnchor.constraint(equalToConstant: 145),
            
            leftBottomImageButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            leftBottomImageButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            leftBottomImageButton.heightAnchor.constraint(equalToConstant: 145),
            leftBottomImageButton.widthAnchor.constraint(equalToConstant: 145),
            
        ])
        
        
    }
    
}
