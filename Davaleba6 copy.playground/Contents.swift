//struct CompanyProperty{
//    var name:String
//    var year:Int
//    var headQuarters:String
//    var founders:[String]
//}
//
//protocol CompanyProtocol{
//    var properties : CompanyProperty {get set}
//}
//
//class Company : CompanyProtocol{
//    var properties : CompanyProperty
//    init (properties : CompanyProperty){
//        self.properties = properties
//    }
//}
//class Apple : Company{
//
//}
//class Google : Company{
//
//}
//class Facebook : Company{
//}


protocol CompanyProtocol{
    var name:String {get set}
    var year:Int {get set}
    var headQuarters:String {get set}
    var founders:[String] {get set}
}

class Company:CompanyProtocol{
    var name:String
    var year:Int
    var headQuarters:String
    var founders:[String]
    init(name:String,year:Int,headQuarters:String,founders:[String]) {
        self.name = name
        self.year = year
        self.headQuarters = headQuarters
        self.founders = founders
    }
}
class Apple:Company{
    init() {
        super.init(name:"Apple", year:1976, headQuarters: "Cupertino, California", founders:["Steve Jobs", "Ronald Wayne", "Steve Wozniak"])
    }
}
class Google:Company{
    init(){
        super.init(name:"Google", year:1988, headQuarters: "Mountain View, California", founders:["Larry Page", "Sergey Brin"])
    }
}
class Facebook:Company{
    init() {
        super.init(name:"Facebook", year:2004, headQuarters: "Menlo Park, California", founders:["Mark Zuckerberg"])
    }
}

var apple = Apple()
var google = Google()
var fb = Facebook()

apple.year






