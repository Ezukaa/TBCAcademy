//
//  ViewController.swift
//  HW28(Animation)
//
//  Created by Macintosh HD on 5/27/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    let images = [#imageLiteral(resourceName: "indiana-jones"),#imageLiteral(resourceName: "walter-white"),#imageLiteral(resourceName: "ninja-head"),#imageLiteral(resourceName: "super-mario")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(myCell.nib(), forCellReuseIdentifier: myCell.ID)
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    func createImage(image:UIImage){
        let imageView = UIImageView(frame: CGRect(x: (view.frame.width / 2) - 50 , y: view.frame.height, width: 100, height: 100))
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        
        self.view.addSubview(imageView)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: [], animations: {
            imageView.frame.origin.y -= 200
            
        }) { (end) in
            UIView.transition(with: imageView, duration: 2, options: .transitionFlipFromBottom, animations: {}, completion: nil)
            
            UIView.animate(withDuration: 1, animations: {
                imageView.alpha = 0
            }){(end) in
                imageView.removeFromSuperview()
            }
        }
        
        
    }


}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myCell.ID, for: indexPath) as! myCell
        cell.imageView?.image = images[indexPath.row]
        
        return cell
    }
}
extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.createImage(image: images[indexPath.row])
    }
}

