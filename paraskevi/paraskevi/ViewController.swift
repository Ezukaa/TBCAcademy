

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var responseGot = [[Property]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Shemovida")
        parseJson()
//        tableView.dataSource = self
//        tableView.register(myCell.nib(), forCellReuseIdentifier: myCell.indentifier)
    }
    
    

    func parseJson(){
        let url = URL(string: "https://run.mocky.io/v3/12f8dc9f-0ef0-42ca-9b21-b50a7ef57d1b")!
        URLSession.shared.dataTask(with: url){(data,res,err) in
            guard let data = data else {return}
            do{
                let decoder = JSONDecoder()
                let houseResponse = try decoder.decode(HouseResponse.self,from: data)
                
                
                print(houseResponse.properties.count)
                
                for (_,item) in houseResponse.properties.enumerated() {

                        if let unWrapped = item.address.city{
                            if !self.doesItHave(unWrapped: unWrapped, currArrItem: item) {
                                self.responseGot.append([item])
                            }
                    }
                }
            }catch {print("EEE")}
        }.resume()
    }
    
    func doesItHave(unWrapped:String, currArrItem:Property)->Bool{
        for index in 0..<self.responseGot.count{
            if unWrapped == self.responseGot[index][0].address.city!{
                self.responseGot[index].append(currArrItem)
                return true
            }
        }
        return false
    }


}

//extension ViewController:UITableViewDataSource{
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return self.responseGot.count
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.responseGot[section].count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: myCell.indentifier, for: indexPath) as! myCell
//        
//        //cell.currCity.text = self.responseGot[indexPath.section][indexPath.row].address.city
//        
//        return cell
//    }
//    
//    
//}
