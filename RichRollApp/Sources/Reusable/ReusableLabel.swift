import UIKit

class ReusableLabel: UILabel {
    
    init(frame: CGRect = .zero, text: String = "", font: UIFont, textColor: UIColor? = nil, numberOfLines: Int = 0, textAlignment: NSTextAlignment? = nil) {
        super.init(frame: frame)
        
        self.makeLabel(text: text, font: font, textColor: textColor, numberOfLines: numberOfLines, textAlignment: textAlignment)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeLabel(text: String?, font: UIFont, textColor: UIColor?, numberOfLines: Int, textAlignment: NSTextAlignment?) {
        self.text = text
        self.font = font
        self.textColor = textColor
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment ?? .natural
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
