import UIKit

class ViewController: UIViewController, CAAnimationDelegate {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        verticalRotation()
        //xAxis()
    }
    
    func leftRotation() {
        let animation = createRotationAnimation(withRotation: 90)
        imageView.layer.add(animation, forKey: "leftRotation")
    }
    
    func xAxis() {
        let animation = createRotationAnimation(withRotation: 90)
        imageView.layer.add(animation, forKey: "xAxis")
    }
    
    
    func rightRotation() {
        let animation = createRotationAnimation(withRotation: -90)
        animation.delegate = self // Set the delegate
        imageView.layer.add(animation, forKey: "rightRotation")
    }
    
    func createRotationAnimation(withRotation rotation: CGFloat) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "transform")
        var transform = CATransform3DIdentity
        transform.m34 = -0.002
        animation.toValue = CATransform3DRotate(transform, rotation * .pi / 700, 0, 1, 0)
        animation.duration = 2.0
        return animation
    }
    
    func createVerticalAnimation(withRotation rotation: CGFloat) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "transform")
        var transform = CATransform3DIdentity
        transform.m34 = -0.002
        animation.toValue = CATransform3DRotate(transform, rotation * .pi / 700, 1, 0, 0) // Rotate around x-axis
        animation.duration = 2.0
        return animation
    }

    
    func verticalRotation() {
        let animation = createVerticalAnimation(withRotation: 90)
        imageView.layer.add(animation, forKey: "verticalRotation")
    }
}
