import UIKit

final class MiddleLayoutView: UIView {
    
    public let bottomImageButton = LayoutContainerButton(type: .custom)
    public let rightTopImageButton = LayoutContainerButton(type: .custom)
    public let leftTopImageButton = LayoutContainerButton(type: .custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = UIColor(red: 15/255, green: 102/255, blue: 152/255, alpha: 1)

        addSubview(bottomImageButton)
        addSubview(leftTopImageButton)
        addSubview(rightTopImageButton)

        [bottomImageButton, leftTopImageButton, rightTopImageButton ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            rightTopImageButton.topAnchor.constraint(equalTo: topAnchor, constant: Constants.Margins.small),
            rightTopImageButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.Margins.small),
            rightTopImageButton.heightAnchor.constraint(equalTo: bottomImageButton.heightAnchor),
            rightTopImageButton.widthAnchor.constraint(equalTo: bottomImageButton.heightAnchor),
            
            leftTopImageButton.topAnchor.constraint(equalTo: topAnchor, constant: Constants.Margins.small),
            leftTopImageButton.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.Margins.small),
            leftTopImageButton.heightAnchor.constraint(equalTo: bottomImageButton.heightAnchor),
            leftTopImageButton.widthAnchor.constraint(equalTo: bottomImageButton.heightAnchor),
            
            bottomImageButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.Margins.small),
            bottomImageButton.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.Margins.small),
            bottomImageButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.Margins.small),
            bottomImageButton.topAnchor.constraint(equalTo: leftTopImageButton.bottomAnchor, constant: Constants.Margins.small)
        ])
    }
}
