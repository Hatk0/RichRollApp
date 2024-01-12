import UIKit

extension DetailViewController {
    
    func enableSwipeToDismiss() {
        let swipeGesture = UIPanGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        self.view.addGestureRecognizer(swipeGesture)
    }
    
    @objc private func handleSwipe(_ gesture: UIPanGestureRecognizer) {
        guard let view = gesture.view else { return }
        
        let translation = gesture.translation(in: view)
        let verticalMovement = translation.y / view.bounds.height
        let progress = max(0, min(1, verticalMovement))
        
        switch gesture.state {
        case .changed:
            view.alpha = 1 - progress
            view.transform = CGAffineTransform(translationX: 0, y: translation.y)
            
        case .ended:
            if progress > 0.5 {
                dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3) {
                    view.alpha = 1
                    view.transform = .identity
                }
            }
            
        default:
            break
        }
    }
}
