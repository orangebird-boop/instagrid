import UIKit

protocol LayoutSelectionViewDelegate: AnyObject {
    func userDidTapOnLayoutButton(index: Int)
}

final class LayoutSelectionView: UIView {

    private static let LayoutSelectionViewButtonSize: CGFloat = 64

    public let firstLayoutButton = UIButton(type: .custom)
    public let secondLayoutButton = UIButton(type: .custom)
    public let thirdLayoutButton = UIButton(type: .custom)

    public weak var delegate: LayoutSelectionViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        let selectedLayoutImage = UIImage(named: "Selected.png")

        firstLayoutButton.contentMode = .scaleAspectFill
        firstLayoutButton.imageEdgeInsets = UIEdgeInsets.zero
        firstLayoutButton.contentVerticalAlignment = .fill
        firstLayoutButton.contentHorizontalAlignment = .fill
        firstLayoutButton.setImage(UIImage(named: "Layout 1.png"), for: .normal)
        firstLayoutButton.setImage(selectedLayoutImage, for: .selected)
        firstLayoutButton.tag = 1

        secondLayoutButton.contentMode = .scaleAspectFill
        secondLayoutButton.imageEdgeInsets = UIEdgeInsets.zero
        secondLayoutButton.contentVerticalAlignment = .fill
        secondLayoutButton.contentHorizontalAlignment = .fill
        secondLayoutButton.setImage(UIImage(named: "Layout 2.png"), for: .normal)
        secondLayoutButton.setImage(selectedLayoutImage, for: .selected)
        secondLayoutButton.tag = 2

        thirdLayoutButton.contentMode = .scaleAspectFill
        thirdLayoutButton.imageEdgeInsets = UIEdgeInsets.zero
        thirdLayoutButton.contentVerticalAlignment = .fill
        thirdLayoutButton.contentHorizontalAlignment = .fill
        thirdLayoutButton.setImage(UIImage(named: "Layout 3.png"), for: .normal)
        thirdLayoutButton.setImage(selectedLayoutImage, for: .selected)
        thirdLayoutButton.tag = 3

        firstLayoutButton.addTarget(self, action: #selector(userDidTap), for: .touchUpInside)
        secondLayoutButton.addTarget(self, action: #selector(userDidTap), for: .touchUpInside)
        thirdLayoutButton .addTarget(self, action: #selector(userDidTap), for: .touchUpInside)
    }

    func updateLayoutConstraints(orientation: DeviceOrientation) {
        // Reset layout constraints
        [firstLayoutButton, secondLayoutButton, thirdLayoutButton].forEach {
            $0.removeFromSuperview()
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        var layoutConstraints = [
            firstLayoutButton.widthAnchor.constraint(equalToConstant: Self.LayoutSelectionViewButtonSize),
            firstLayoutButton.heightAnchor.constraint(equalToConstant: Self.LayoutSelectionViewButtonSize),

            secondLayoutButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            secondLayoutButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            secondLayoutButton.widthAnchor.constraint(equalToConstant: Self.LayoutSelectionViewButtonSize),
            secondLayoutButton.heightAnchor.constraint(equalToConstant: Self.LayoutSelectionViewButtonSize),

            thirdLayoutButton.widthAnchor.constraint(equalToConstant: Self.LayoutSelectionViewButtonSize),
            thirdLayoutButton.heightAnchor.constraint(equalToConstant: Self.LayoutSelectionViewButtonSize),
        ]

        switch orientation {
        case .landscape:
            layoutConstraints.append(contentsOf: [
                firstLayoutButton.centerXAnchor.constraint(equalTo: secondLayoutButton.centerXAnchor),
                firstLayoutButton.bottomAnchor.constraint(equalTo: secondLayoutButton.topAnchor, constant: -24),

                thirdLayoutButton.centerXAnchor.constraint(equalTo: secondLayoutButton.centerXAnchor),
                thirdLayoutButton.topAnchor.constraint(equalTo: secondLayoutButton.bottomAnchor, constant: 24),
            ])

        case .portrait:
            layoutConstraints.append(contentsOf: [
                firstLayoutButton.centerYAnchor.constraint(equalTo: secondLayoutButton.centerYAnchor),
                firstLayoutButton.rightAnchor.constraint(equalTo: secondLayoutButton.leftAnchor, constant: -24),

                thirdLayoutButton.centerYAnchor.constraint(equalTo: secondLayoutButton.centerYAnchor),
                thirdLayoutButton.leftAnchor.constraint(equalTo: secondLayoutButton.rightAnchor, constant: 24),
            ])

        case .unknown:
            fatalError("Should not happen")
        }

        NSLayoutConstraint.activate(layoutConstraints)
    }

    @objc func userDidTap(_ sender: UIButton) {
        resetLayoutSelection()

        sender.isSelected = true

        delegate?.userDidTapOnLayoutButton(index: sender.tag)
    }

    public func resetLayoutSelection() {
        [firstLayoutButton, secondLayoutButton, thirdLayoutButton].forEach { $0.isSelected = false }
    }
}
