//
//  ViewController.swift
//  Lecture49
//
//  Created by Nika Kirkitadze on 6/25/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var ipath : IndexPath?
    let myArray = arrayClass.fillArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate  = self

        navigationController?.navigationBar.isHidden = false
//        var didSelectItemAction: ((IndexPath, UIImage) -> Void)?
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "story") as! StoryVC
        vc.myIndex = ipath
//        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
//    func showStory(){
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(identifier: "story") as! StoryVC
//
//        show(vc, sender: true)
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.identifier, for: indexPath) as! HeaderCell
//
////            cell.collectionView.
//            return cell
            let productsCell = cell
            
            
            productsCell.didSelectItemAction = { [weak self] indexPath1 in
                self?.ipath = indexPath1
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "story") as! StoryVC
                vc.myIndex = indexPath1
                vc.modalTransitionStyle = .flipHorizontal
                self?.navigationController?.pushViewController(vc, animated: true)
//                self?.performSegue(withIdentifier: "story", sender: self)
            }
            
            return productsCell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NormalCell.identifier, for: indexPath) as! NormalCell
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 622
        }
        
        return 150
    }
}
