//
//  ViewController.swift
//  HW23
//
//  Created by Macintosh HD on 5/18/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

struct UsersResponse: Codable {
    let colors: [Color]
    
    enum CodingKeys: String, CodingKey {
        case colors = "data"
    }
}
struct Color: Codable {
    let id: Int
    let color: String
    let name: String
    let year: Int
    //let pantone_valie
    
}

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var colors = [Color]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.register(myCell.nib(), forCellWithReuseIdentifier: myCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        getData()
    }
    
    func getData(){
        let url = URL(string: "https://reqres.in/api/unknown?")!
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            guard let data = data else {return}
            do {
            let decoder = JSONDecoder()
            let usersResponse = try decoder.decode(UsersResponse.self, from: data)
            self.colors.append(contentsOf: usersResponse.colors)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            
            }catch{print(error.localizedDescription)}
            
        }.resume()
    }

}
extension ViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: myCell.identifier, for: indexPath) as! myCell
        cell.backgroundColor = colors[indexPath.row].color.hexStringToUIColor()
        cell.realColorField.text = colors[indexPath.row].name
        cell.hexColorField.text = String(colors[indexPath.row].color.dropFirst())
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.frame.width/2-20
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondPage = storyboard.instantiateViewController(withIdentifier: "secondPage") as! secondPage
        
        secondPage.backgrounColor = colors[indexPath.row].color.hexStringToUIColor()
        self.navigationController?.pushViewController(secondPage, animated: true)
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
}

extension String {
    func hexStringToUIColor() -> UIColor {
        var cString:String = self.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
