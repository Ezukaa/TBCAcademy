import UIKit

class ViewController: UIViewController {
    

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SHemovida")
        let path = UIBezierPath(arcCenter: view.center, radius: 100, startAngle: -.pi/2, endAngle: .pi*2-(.pi/2), clockwise: true)
        
        let circleLayout = CAShapeLayer()
        circleLayout.path = path.cgPath
        
        circleLayout.fillColor = UIColor.red.cgColor
        circleLayout.strokeColor = UIColor.green.cgColor
        circleLayout.lineWidth = 10
        circleLayout.lineCap = .round
        circleLayout.strokeStart = 0
        self.view.layer.addSublayer(circleLayout)
        
        let anim = CABasicAnimation(keyPath: "strokeStart")
        anim.duration = 1
        anim.toValue = 1.1
        anim.fillMode = .forwards
        anim.isRemovedOnCompletion = false
        circleLayout.add(anim, forKey: "")
    }
    
    
}

