import UIKit

final class LayoutContainerButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white

        resetImage()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func resetImage() {
        setImage(UIImage(named: "Plus.png"), for: .normal)
        contentMode = .center
        imageView?.contentMode = .scaleAspectFit
        imageView?.layer.transform = CATransform3DMakeScale(2, 2, 2)
    }

    func updateImage(image: UIImage?) {
        setImage(image, for: .normal)

        contentMode = .scaleAspectFill
        imageEdgeInsets = UIEdgeInsets.zero
        imageView?.contentMode = .scaleAspectFill
        contentVerticalAlignment = .fill
        contentHorizontalAlignment = .fill
        imageView?.layer.transform = CATransform3DMakeScale(1, 1, 1)
    }
}
