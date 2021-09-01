import UIKit

final class RightLayoutView: UIView {

    public let rightTopImageButton = LayoutContainerButton(type: .custom)
    public let leftTopImageButton = LayoutContainerButton(type: .custom)
    public let rightBottomImageButton = LayoutContainerButton(type: .custom)
    public let leftBottomImageButton = LayoutContainerButton(type: .custom)

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        backgroundColor = UIColor(red: 15/255, green: 102/255, blue: 152/255, alpha: 1)

        addSubview(leftBottomImageButton)
        addSubview(rightBottomImageButton)
        addSubview(leftTopImageButton)
        addSubview(rightTopImageButton)

        [rightTopImageButton, leftTopImageButton, rightBottomImageButton, leftBottomImageButton].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            rightTopImageButton.topAnchor.constraint(equalTo: topAnchor, constant: Constants.Margins.small),
            rightTopImageButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.Margins.small),
            rightTopImageButton.heightAnchor.constraint(equalTo: leftTopImageButton.heightAnchor),
            rightTopImageButton.widthAnchor.constraint(equalTo: leftTopImageButton.heightAnchor),
            rightTopImageButton.bottomAnchor.constraint(equalTo: rightBottomImageButton.topAnchor, constant: -Constants.Margins.small),

            leftTopImageButton.topAnchor.constraint(equalTo: topAnchor, constant: Constants.Margins.small),
            leftTopImageButton.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.Margins.small),
            leftTopImageButton.heightAnchor.constraint(equalTo: rightBottomImageButton.heightAnchor),
            leftTopImageButton.widthAnchor.constraint(equalTo: rightBottomImageButton.heightAnchor),

            rightBottomImageButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.Margins.small),
            rightBottomImageButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.Margins.small),
            rightBottomImageButton.heightAnchor.constraint(equalTo: leftBottomImageButton.heightAnchor),
            rightBottomImageButton.widthAnchor.constraint(equalTo: leftBottomImageButton.heightAnchor),

            leftBottomImageButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.Margins.small),
            leftBottomImageButton.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.Margins.small),
            leftBottomImageButton.heightAnchor.constraint(equalTo: rightTopImageButton.heightAnchor),
            leftBottomImageButton.widthAnchor.constraint(equalTo: rightTopImageButton.heightAnchor)
        ])
    }
}
