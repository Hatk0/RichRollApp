import UIKit

class ReusableImage: UIImageView {

    init(
        frame: CGRect = .zero,
         contentMode: UIView.ContentMode,
         clipsToBounds: Bool
    ) {
        super.init(frame: frame)
        
        self.makeImageView(contentMode: contentMode, clipsToBounds: clipsToBounds)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeImageView(contentMode: UIView.ContentMode, clipsToBounds: Bool) {
        self.contentMode = contentMode
        self.clipsToBounds = clipsToBounds
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
