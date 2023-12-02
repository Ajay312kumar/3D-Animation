import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add tap gesture recognizer to trigger the flip animation
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        // Call the function to perform the flip animation
        flipAnimation()
    }
    
    func flipAnimation() {
        // Create a CATransform3D for the flip animation
        var transform = CATransform3DIdentity
        transform.m34 = -1.0 / 500.0 // Perspective effect
        
        // Set up the flip animation with a 60-degree rotation
        let animation = CABasicAnimation(keyPath: "transform.rotation.y")
        animation.fromValue = 0
        animation.toValue = 85 * CGFloat.pi / 180
        animation.duration = 1.0 // Animation duration
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut) // Animation timing function
      //  animation.delegate = self
        
        // Apply the animation to the layer
        imageView.layer.add(animation, forKey: "flipAnimation")
    }
    
    // MARK: - CAAnimationDelegate
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
    }
}
