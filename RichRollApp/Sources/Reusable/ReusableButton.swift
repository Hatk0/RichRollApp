import UIKit

class ReusableButton: UIButton {

    init(frame: CGRect = .zero, backgroundColor: UIColor, titleFont: UIFont? = nil, cornerRadius: CGFloat? = nil, image: UIImage? = nil, tintColor: UIColor? = nil, title: String? = nil, target: Any? = nil, action: Selector? = nil, controlEvents: UIControl.Event = .touchUpInside) {
        super.init(frame: frame)
        
        self.makeButton(backgroundColor: backgroundColor, titleFont: titleFont, cornerRadius: cornerRadius, image: image, tintColor: tintColor, title: title, target: target, action: action, controlEvents: controlEvents)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeButton(backgroundColor: UIColor, titleFont: UIFont?, cornerRadius: CGFloat?, image: UIImage?, tintColor: UIColor?, title: String?, target: Any?, action: Selector?, controlEvents: UIControl.Event) {
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = titleFont
        self.layer.cornerRadius = cornerRadius ?? 0
        self.clipsToBounds = true
        self.setImage(image, for: .normal)
        self.tintColor = tintColor
        self.setTitle(title, for: .normal)
        
        if let action = action {
            self.addTarget(target, action: action, for: controlEvents)
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
