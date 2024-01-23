import UIKit

func makeLabel(withText text: String?, font: UIFont, textColor: UIColor?, numberOfLines: Int, textAlignment: NSTextAlignment?) -> UILabel {
    let label = UILabel()
    label.text = text
    label.font = font
    label.textColor = textColor
    label.numberOfLines = numberOfLines
    if let alignment = textAlignment {
        label.textAlignment = alignment
    }
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}

func makeImageView(contentMode: UIView.ContentMode, clipsToBounds: Bool) -> UIImageView {
    let imageView = UIImageView()
    imageView.contentMode = contentMode
    imageView.clipsToBounds = clipsToBounds
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
}

func makeButton(backgroundColor: UIColor, titleFont: UIFont?, cornerRadius: CGFloat?, image: UIImage?, tintColor: UIColor?, title: String?, target: Any?, action: Selector?, for controlEvents: UIControl.Event) -> UIButton {
    let button = UIButton()
    button.backgroundColor = backgroundColor
    
    if let font = titleFont {
        button.titleLabel?.font = font
    }
    
    if let radius = cornerRadius {
        button.layer.cornerRadius = radius
        button.clipsToBounds = true
    }
    
    if let buttonImage = image {
        button.setImage(buttonImage, for: .normal)
    }
    
    if let color = tintColor {
        button.tintColor = color
    }
    
    if let buttonTitle = title {
        button.setTitle(buttonTitle, for: .normal)
    }
    
    if let targetObject = target, let buttonAction = action {
        button.addTarget(targetObject, action: buttonAction, for: controlEvents)
    }
    
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
}
