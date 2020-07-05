import UIKit

class StoryVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var num : Int?
    var myIndex: IndexPath!
    let myArray = arrayClass.fillArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(myIndex)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        self.navigationController?.navigationBar.isHidden = true
        collectionView.scrollToItem(at: myIndex!, at: .left, animated: true)
//        navigationItem.compactAppearance = .none
//        collectionView
    }
    @objc func didPan(){
        print("did Swipe")
//        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        collectionView.scrollToItem(at: myIndex!, at: .left, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collectionView.scrollToItem(at: myIndex!, at: .left, animated: true)
    }
}


extension StoryVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StoryCollection
        cell.storyImage.image = myArray[indexPath.row].image
        let dismissView = UIView(frame: CGRect(x: 0, y: cell.storyImage.frame.maxY + cell.storyImage.frame.height, width: self.view.frame.width, height: self.view.frame.height/3))
        dismissView.backgroundColor = cell.backgroundColor
        cell.addSubview(dismissView)
        cell.backgroundColor = self.view.backgroundColor
        dismissView.isUserInteractionEnabled = true
        let swipeGesture = UIPanGestureRecognizer(target: self, action: #selector(didPan))
        dismissView.addGestureRecognizer(swipeGesture)
//        collectionView.addGestureRecognizer(swipeGesture)
//        cell.storyImage.isUserInteractionEnabled = true
//        cell.storyImage.addGestureRecognizer(swipeGesture)
//        cell.addGestureRecognizer(swipeGesture)
//        cell.isUserInteractionEnabled = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        self.view.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


