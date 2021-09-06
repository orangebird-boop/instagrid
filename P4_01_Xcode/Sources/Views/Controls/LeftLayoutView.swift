import UIKit

final class LeftLayoutView: UIView {

    public let topImageButton = LayoutContainerButton(type: .custom)
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
        let layoutContainer = UIView()
        layoutContainer.backgroundColor = UIColor(red: 15/255, green: 102/255, blue: 152/255, alpha: 1)

        addSubview(topImageButton)
        addSubview(leftBottomImageButton)
        addSubview(rightBottomImageButton)

        [topImageButton,leftBottomImageButton,rightBottomImageButton ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            rightBottomImageButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.Margins.small),
            rightBottomImageButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.Margins.small),
            rightBottomImageButton.heightAnchor.constraint(equalTo: topImageButton.heightAnchor),
            rightBottomImageButton.widthAnchor.constraint(equalTo: topImageButton.heightAnchor),

            leftBottomImageButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.Margins.small),
            leftBottomImageButton.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.Margins.small),
            leftBottomImageButton.heightAnchor.constraint(equalTo: topImageButton.heightAnchor),
            leftBottomImageButton.widthAnchor.constraint(equalTo: topImageButton.heightAnchor),

            topImageButton.topAnchor.constraint(equalTo: topAnchor, constant: Constants.Margins.small),
            topImageButton.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.Margins.small),
            topImageButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.Margins.small),
            topImageButton.bottomAnchor.constraint(equalTo: leftBottomImageButton.topAnchor, constant: -Constants.Margins.small)
        ])
    }
}
