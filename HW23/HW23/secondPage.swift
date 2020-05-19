
struct Joke:Codable {
    let icon_url:String
    let value:String
}

import UIKit

class secondPage: UIViewController {
    var backgrounColor:UIColor?
    var jokes :Joke?

    @IBOutlet weak var imageField: UIImageView!
    @IBOutlet weak var textField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgrounColor
        getJoke()
        
    }
    

    func getJoke(){
        let url = URL(string: "https://api.chucknorris.io/jokes/random?category=dev")!
        
        URLSession.shared.dataTask(with: url){(data,req,err) in
            guard let data = data else{return}
            do{
                let decoder = JSONDecoder()
                let userResponse = try decoder.decode(Joke.self, from: data)
                self.jokes = userResponse
                print(self.jokes?.value ?? "NO JOKE" )
                
                
                self.jokes!.icon_url.downloadImage { (image) in
                    DispatchQueue.main.async {
                        self.textField.text = self.jokes?.value ?? "No Joke"
                        self.imageField.image = image
                    }
                }
            }catch{print(error.localizedDescription)}
            
        }.resume()
        
        
    }

}
extension String {
    func downloadImage(completion: @escaping (UIImage?) -> ()) {
        guard let url = URL(string: self) else {return}
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else {return}
            completion(UIImage(data: data))
            }.resume()
    }
}
