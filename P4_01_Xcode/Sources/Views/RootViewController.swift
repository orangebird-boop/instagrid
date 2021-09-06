import UIKit

final class RootViewController: UIViewController {
    
    //views
    let titleLabel = UILabel()
    let swipeLabel = UILabel()
    
    let layoutContainer = UIView()
    
    let layoutSelectionView = LayoutSelectionView()

    let plusImageForButton = UIImage(named: "Plus.png")

    //fonts
    let thirstySoftRegular = UIFont(name: "ThirstySoftRegular" , size: 30)!
    let delmMedium = UIFont(name: "Delm-Medium" , size: 28)!
    
    //buttons
    var lastTappedButton: LayoutContainerButton?

    let imagePicker = UIImagePickerController()

    var layoutConstraints = [NSLayoutConstraint]()
    
    private var screenSize = CGSize.zero

    private var currentOrientation = DeviceOrientation.unknown

    override func loadView() {
        super.loadView()

        setupView()

        NotificationCenter.default.addObserver(self, selector: #selector(deviceOrientationHasChanged), name: UIDevice.orientationDidChangeNotification, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func setupView() {
        // Keep track of the view's bounds
        screenSize = view.bounds.size

        view.backgroundColor = #colorLiteral(red: 0.6850972772, green: 0.8479481339, blue: 0.9051222205, alpha: 1)

        layoutSelectionView.delegate = self

        layoutContainer.backgroundColor = UIColor(red: 15/255, green: 102/255, blue: 152/255, alpha: 1)

        titleLabel.text = "Instagrid"
        titleLabel.textColor = .white
        titleLabel.font = UIFontMetrics(forTextStyle: .largeTitle).scaledFont(for: thirstySoftRegular)
        titleLabel.textAlignment = .center

        swipeLabel.numberOfLines = 0
        swipeLabel.textAlignment = .center
        swipeLabel.text = "^\nSwipe up to share"
        swipeLabel.textColor = .white
        swipeLabel.font = UIFontMetrics(forTextStyle: .title3).scaledFont(for: delmMedium)

        imagePicker.delegate = self
    }

    // these are the onstraints for portrait and landscape orientation
    func updateLayoutConstraints() {
        // Remove all constraints
        NSLayoutConstraint.deactivate(layoutConstraints)
        layoutConstraints = [NSLayoutConstraint]()

        [titleLabel, swipeLabel, layoutSelectionView, layoutContainer].forEach {
            $0.removeFromSuperview()
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        // Calculate the correct size to use based on orientation
        var width: CGFloat
        var height: CGFloat
        if currentOrientation == .landscape {
            width = max(screenSize.width, screenSize.height)
            height = min(screenSize.width, screenSize.height)
        } else {
            width = min(screenSize.width, screenSize.height)
            height = max(screenSize.width, screenSize.height)
        }

        let size = CGSize(width: width, height: height)

        // Default constraints
        layoutConstraints.append(contentsOf: [
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.Margins.small),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        // Add new constraints
        switch currentOrientation {
        case .landscape:
            layoutConstraints.append(contentsOf: [
                layoutContainer.heightAnchor.constraint(equalToConstant: size.height / 1.5),
                layoutContainer.widthAnchor.constraint(equalTo: layoutContainer.heightAnchor),
                layoutContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                layoutContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),

                swipeLabel.rightAnchor.constraint(equalTo: layoutContainer.leftAnchor, constant: -Constants.Margins.medium),
                swipeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -Constants.Margins.medium),
                swipeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),

                layoutSelectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.Margins.small),
                layoutSelectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -Constants.Margins.small),
                layoutSelectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.Margins.small),
                layoutSelectionView.widthAnchor.constraint(equalToConstant: 64)
            ])

        case .portrait:
            layoutConstraints.append(contentsOf: [
                layoutContainer.widthAnchor.constraint(equalToConstant: size.width / 1.5),
                layoutContainer.heightAnchor.constraint(equalTo: layoutContainer.widthAnchor),
                layoutContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                layoutContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),

                swipeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                swipeLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.Margins.medium),
                swipeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.Margins.medium),
                swipeLabel.bottomAnchor.constraint(equalTo: layoutContainer.topAnchor, constant: -Constants.Margins.medium),

                layoutSelectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.Margins.small),
                layoutSelectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.Margins.small),
                layoutSelectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.Margins.small),
                layoutSelectionView.heightAnchor.constraint(equalToConstant: 64)
            ])

        case .unknown:
            fatalError("Should not happen")
        }

        NSLayoutConstraint.activate(layoutConstraints)

        // Update layout selection view
        layoutSelectionView.updateLayoutConstraints(orientation: currentOrientation)
    }

    @objc
    func deviceOrientationHasChanged() {
        guard UIDevice.current.orientation != .portraitUpsideDown else {
            // Orientation not handled
            return
        }

        let newOrientation = UIDevice.current.orientation.isLandscape ? DeviceOrientation.landscape : DeviceOrientation.portrait

        // Prevent unnecessary layout updates
        guard newOrientation != currentOrientation else {
            return
        }

        // Update orientation
        currentOrientation = newOrientation

        updateLayoutConstraints()

        activateSwipe()
    }

    // enables a different swipe gesture on each orientation
    func activateSwipe() {
        switch currentOrientation {
        case .landscape:
            let swipeGestureRecognizerLeft = UISwipeGestureRecognizer(target: self, action: #selector(userDidSwipe))
            swipeGestureRecognizerLeft.direction = .left

            layoutContainer.addGestureRecognizer(swipeGestureRecognizerLeft)

            swipeLabel.text = "< \nSwipe left to share"

        case .portrait:
            let swipeGestureRecognizerUp = UISwipeGestureRecognizer(target: self, action: #selector(userDidSwipe))
            swipeGestureRecognizerUp.direction = .up

            layoutContainer.addGestureRecognizer(swipeGestureRecognizerUp)

            swipeLabel.text = "^ \nSwipe up to share"

            swipeLabel.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: delmMedium)

        case .unknown:
            fatalError("Should not happen")
        }
    }
    
    func shareImage() {
        if let image = convertToImage() {
            let activityApplicationsView = UIActivityViewController(activityItems: [image], applicationActivities: nil)

            present(activityApplicationsView, animated: true)

            activityApplicationsView.completionWithItemsHandler = { _, _, _, _ in
                UIView.animate(withDuration: 0.2) { [unowned self] in
                    updateLayoutConstraints()
                    activateSwipe()
                }
            }
        }
    }

    @objc func pickImage(_ sender: AnyObject) {
        present(imagePicker, animated: true, completion: nil)
        
        if let tappedImageButton = sender as? LayoutContainerButton {
            lastTappedButton = tappedImageButton
        }
    }

    @objc func userDidSwipe(_ sender: UISwipeGestureRecognizer) {
        var frame = layoutContainer.frame
        
        if sender.direction == .up {
            UIView.animate(withDuration: 1) {
                frame.origin.y -= 1000.0
                self.layoutContainer.frame = frame
                self.shareImage()
                
            }
        } else if sender.direction == .left {
            UIView.animate(withDuration: 1) {
                frame.origin.x -= 1000.0
                self.layoutContainer.frame = frame
                self.shareImage()
            }
        }
    }

    func convertToImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(layoutContainer.bounds.size, true, 0)

        layoutContainer.drawHierarchy(in: layoutContainer.bounds, afterScreenUpdates: true)

        let image = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return image
    }
}

// MARK: - LayoutSelectionViewDelegate

extension RootViewController: LayoutSelectionViewDelegate {

    func userDidTapOnLayoutButton(index: Int) {
        var finalLayoutView: UIView?

        switch index {
        case 1:
            let layoutView = LeftLayoutView()

            layoutView.topImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
            layoutView.rightBottomImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
            layoutView.leftBottomImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)

            finalLayoutView = layoutView

        case 2:
            let layoutView = MiddleLayoutView()

            layoutView.leftTopImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
            layoutView.rightTopImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
            layoutView.bottomImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)

            finalLayoutView = layoutView

        case 3:
            let layoutView = RightLayoutView()

            layoutView.rightTopImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
            layoutView.leftTopImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
            layoutView.rightBottomImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
            layoutView.leftBottomImageButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)

            finalLayoutView = layoutView

        default:
            fatalError("This is bad")
        }

        if let layoutView = finalLayoutView {
            if !layoutContainer.subviews.isEmpty {
                layoutContainer.subviews.forEach { $0.removeFromSuperview() }
            }

            layoutContainer.addSubview(layoutView)
            layoutView.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                layoutView.topAnchor.constraint(equalTo: layoutContainer.topAnchor),
                layoutView.rightAnchor.constraint(equalTo: layoutContainer.rightAnchor),
                layoutView.bottomAnchor.constraint(equalTo: layoutContainer.bottomAnchor),
                layoutView.leftAnchor.constraint(equalTo: layoutContainer.leftAnchor)
            ])
        }
    }
}


// MARK: - UIImagePickerControllerDelegate

extension RootViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        
        if let lastTappedButton = lastTappedButton {
            lastTappedButton.updateImage(image: selectedImage)

            self.lastTappedButton = nil
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}
