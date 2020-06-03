// am problemis gadawkvetis bevri xerxi arsebobs. mtavari problema ari is rom clasis sheqmnis dros ukve tviton classhi axali mimtitebeli enicheba da ukve 2 mimtiteblis gamo clasis deiniti ar xdeba. weak arc shi ar agiqmeba amitom 2 mimtiteblis nacvlad arc 1s agiqvams. erti clasi ro ishleba rcheba meore magram meris mimtitebeli nilia radgan clasi agar arsebobs. aseve gaachnia weaks romels chavuwert radgan tu person classhi weak var job iqneboda jer "Deallocation Job" daiwereboda radgan pirveli eg clasi waishleboda. aseve nilze gatoleba sachiro araa radgan viewDidLoad is datovebis dros mainc xdeba dealocacia.



import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SHEMOVIDA")
        
        
        var sandro: Person?
        var developer: Job?
        
        sandro = Person()
        developer = Job()
        
        sandro?.job = developer
        developer?.person = sandro
        
//        sandro = nil
//        developer = nil
    }
}

class Job {
      weak var person: Person?
    
    deinit {
        print("Deallocating Job")
    }
}

class Person {
     var job: Job?
    
    deinit {
        print("Deallocating Person")
    }
}


