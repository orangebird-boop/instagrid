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

        let bottomFrame = UIImageView()
        bottomFrame.backgroundColor = .white

        let leftTopFrame = UIImageView()
        leftTopFrame.backgroundColor = .white

        let rightTopFrame = UIImageView()
        rightTopFrame.backgroundColor = .white

        bottomImageButton.setImage(UIImage(named: "Plus.png"), for: .normal)
        bottomImageButton.contentMode = .scaleAspectFill
        bottomImageButton.imageEdgeInsets = UIEdgeInsets.zero
        bottomImageButton.contentVerticalAlignment = .fill
        bottomImageButton.contentHorizontalAlignment = .fill

        rightTopImageButton.setImage(UIImage(named: "Plus.png"), for: .normal)
        rightTopImageButton.contentMode = .scaleAspectFill
        rightTopImageButton.imageEdgeInsets = UIEdgeInsets.zero
        rightTopImageButton.contentVerticalAlignment = .fill
        rightTopImageButton.contentHorizontalAlignment = .fill

        leftTopImageButton.setImage(UIImage(named: "Plus.png"), for: .normal)
        leftTopImageButton.contentMode = .scaleAspectFill
        leftTopImageButton.imageEdgeInsets = UIEdgeInsets.zero
        leftTopImageButton.contentVerticalAlignment = .fill
        leftTopImageButton.contentHorizontalAlignment = .fill

        addSubview(bottomFrame)
        addSubview(leftTopFrame)
        addSubview(rightTopFrame)
        addSubview(bottomImageButton)
        addSubview(leftTopImageButton)
        addSubview(rightTopImageButton)

        [bottomFrame, leftTopFrame, rightTopFrame, bottomImageButton, leftTopImageButton, rightTopImageButton ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            leftTopFrame.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            leftTopFrame.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            leftTopFrame.heightAnchor.constraint(equalToConstant: 145),
            leftTopFrame.widthAnchor.constraint(equalToConstant: 145),

            rightTopFrame.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            rightTopFrame.leftAnchor.constraint(equalTo: leftTopFrame.leftAnchor, constant: 155),
            rightTopFrame.heightAnchor.constraint(equalToConstant: 145),
            rightTopFrame.widthAnchor.constraint(equalToConstant: 145),

            bottomFrame.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            bottomFrame.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            bottomFrame.heightAnchor.constraint(equalToConstant: 145),
            bottomFrame.widthAnchor.constraint(equalToConstant: 300),

            rightTopImageButton.centerXAnchor.constraint(equalTo: rightTopFrame.centerXAnchor),
            rightTopImageButton.centerYAnchor.constraint(equalTo: rightTopFrame.centerYAnchor),
            rightTopImageButton.heightAnchor.constraint(equalToConstant: 45),
            rightTopImageButton.widthAnchor.constraint(equalToConstant: 45),

            leftTopImageButton.centerXAnchor.constraint(equalTo: leftTopFrame.centerXAnchor),
            leftTopImageButton.centerYAnchor.constraint(equalTo: leftTopFrame.centerYAnchor),
            leftTopImageButton.heightAnchor.constraint(equalToConstant: 45),
            leftTopImageButton.widthAnchor.constraint(equalToConstant: 45),

            bottomImageButton.centerXAnchor.constraint(equalTo: bottomFrame.centerXAnchor),
            bottomImageButton.centerYAnchor.constraint(equalTo: bottomFrame.centerYAnchor),
            bottomImageButton.heightAnchor.constraint(equalToConstant: 45),
            bottomImageButton.widthAnchor.constraint(equalToConstant: 45),

        ])
    }
}
