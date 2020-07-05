

import UIKit

class HeaderCell: UITableViewCell{

    let myArray = arrayClass.fillArray()
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var otherCollectionView: UICollectionView!
    
    
    public static let identifier = "HeaderCell"
    var didSelectItemAction: ((IndexPath) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(StoryCell.self, forCellWithReuseIdentifier: StoryCell.identifier)
        
        otherCollectionView.delegate = self
        otherCollectionView.dataSource = self
        
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}

extension HeaderCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == self.collectionView){
            return myArray.count
        }
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView == self.collectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCell.identifier, for: indexPath) as! StoryCell
            cell.userLabel.text = myArray[indexPath.row].name
            cell.imageView.image = myArray[indexPath.row].image
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! otherCell
            cell.num.text = "\(indexPath.row + 1)"
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if(collectionView == self.collectionView){
            return .init(width: 172/2, height: collectionView.frame.height)
        }
        else{
            return .init(width: collectionView.frame.width, height: collectionView.frame.height)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if(collectionView == otherCollectionView){
            return 0
        }
        else{
            return 20
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if(collectionView == self.collectionView){
            return .init(top: 0, left: 30, bottom: 0, right: 172/2)
        }
        else{
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        didSelectItemAction?(indexPath)
        
        if(collectionView == self.collectionView){
            didSelectItemAction?(indexPath)
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        if(collectionView == otherCollectionView){
//            return 0
//        }
//        else{
//            return 0
//        }
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        if(collectionView == otherCollectionView){
//            return 0
//        }
//        else{
//            return 20
//        }
//    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath.row)
//        ViewController().performSegue(withIdentifier: "story", sender: self)
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(identifier: "story")
//        self.performsegue
//        self.view
//        ViewController().present(vc, animated: true, completion: nil)
//        vc.present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
//        self.superview?.addSubview(vc.view)
//        ViewController().showStory()
//    }
}


class StoryCell: UICollectionViewCell {

    let myArray = arrayClass.fillArray()
    var imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "Durant")
        iv.layer.masksToBounds = false
        iv.layer.cornerRadius = 85/2
        iv.layer.borderWidth = 2.5
        let a = CALayer()
        a.frame = CGRect.init(x: 0, y: 0, width: 85, height: 85)
        a.borderColor = UIColor.white.cgColor
        a.borderWidth = 5
        a.cornerRadius = 85/2
        iv.layer.addSublayer(a)
       
//        let gradient = CAGradientLayer()
//        gradient.frame =  CGRect(origin: CGPoint.zero, size: iv.frame.size)
//        gradient.colors = [UIColor.blue.cgColor, UIColor.green.cgColor]
        
//        iv.setGradientBorder(width: 20, colors: [UIColor.red, UIColor.blue], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 20, y: 20))
//        setGradientBorder(width: 200, colors: [UIColor.red])
//
//        let shape = CAShapeLayer()
//        shape.lineWidth = 200
//        shape.path = UIBezierPath(rect: iv.bounds).cgPath
//        shape.strokeColor = UIColor.black.cgColor
//        shape.fillColor = UIColor.clear.cgColor
//        gradient.mask = shape
//
//        iv.layer.addSublayer(gradient)
        let layer = CAShapeLayer()
        let bounds = CGRect(x: 3.5, y: 3.5, width: 78, height: 78)
        layer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 39, height: 39)).cgPath
        layer.strokeColor = UIColor.systemPink.cgColor
        layer.fillColor = nil
        layer.lineDashPattern = [8, 6]
        iv.layer.addSublayer(layer)
        
        layer.lineDashPattern?.reduce(0) { $0 - $1.intValue } ?? 0
        
        let animation = CABasicAnimation(keyPath: "lineDashPhase")
        animation.fromValue = 0
        animation.toValue = layer.lineDashPattern?.reduce(0) { $0 - $1.intValue } ?? 0
        animation.duration = 0.7
        animation.repeatCount = .infinity
        layer.add(animation, forKey: "line")
        
        iv.layer.borderColor = UIColor.init(red: 0, green: 204, blue: 131, alpha: 1).cgColor // red.cgColor
        iv.clipsToBounds = true
        return iv
    }()
    
    var userLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = Font.SourceSansProRegular?.withSize(15)
        l.textColor = Colors.DarkGray
        
        l.text = "Full Name" //self.myArray[indexPath.row].name //"Full Name"
        return l
    }()
    
//    override class func awakeFromNib() {
//        super.awakeFromNib()
//        DispatchQueue.main.async {
//            coll
//        }
//    }
    
    public static let identifier = "StoryCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    private func setupLayout() {
        addSubview(imageView)
        addSubview(userLabel)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 85),
            imageView.heightAnchor.constraint(equalToConstant: 85),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            userLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}

class otherCell: UICollectionViewCell {
    @IBOutlet weak var rotatedLabel: UILabel!
    @IBOutlet weak var num: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        rotatedLabel.transform = CGAffineTransform(rotationAngle: 3.14/2)
//        rotatedLabel.removeConstraint()
//        rotatedLabel.translatesAutoresizingMaskIntoConstraints = false
        rotatedLabel.frame = CGRect(x: 20, y: contentView.frame.height/2 - 60, width: 20, height: 120)
    }
    @IBAction func leftButton(_ sender: UIButton) {
        print("-")
    }
    @IBAction func rightButton(_ sender: UIButton) {
        print("+")
    }
}
