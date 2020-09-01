//######## Day 6 ########
// Creating Basic Closures
let driving = {
    print("I'm driving in my car")
}
driving()

// Accepting Parameters in a Closure
let drive = {(place: String) in
    print("I'm going to \(place)")
}
drive("Egypt")

// Returning Values from a Closure
let drivingWithReturn = {(place: String) -> String in
    return "I'm going to \(place)"
}
let msg = drivingWithReturn("Andrew")
print(msg)

// Closures as parameters
func travel(action: () -> Void){
    print("I'm getting ready to go")
    action()
    print("I arrived!")
}

travel(action: driving)

// Trailing Closure Syntax
travel {
    print("I am driving in trailing clouser")
}

//######## Day 7 ########
// Using closures as parameters when they accept parameters
func travelParam (action: (String) -> Void){
    print("I'm getting ready to go")
    action("London")
    print("I arrived!")
}

travelParam{(place: String) in
    print("I'm going to \(place)")
}

// Using closures as parameters when they return values
func travelRetu (action: (String, String) -> String){
    print("I'm getting ready to go")
    let desc = action("Return ", "To London")
    print(desc)
    print("I arrived!")
}

travelRetu{ (place: String, to: String) -> String in
        return "I'm going to \(place)"
}

// Shorthand parameter names
travelRetu{
     "I'm going to \($0) from \($1)"
}

// Closures with multipe parameters
func newTravel (action: (String, Int) -> String){
    let desc = action("London", 68)
    print(desc)
}
newTravel{
    "I'm going to \($0) at speed \($1)"
}

//Returning Closures from Functions

func trav () -> (String) -> Void{
return{
    print("I am going to \($0)")

    }
}
let result = trav()
result("Egypt 1")

//let res2 = trav()("Egypt 2")

// Capturing Values
func travCap () -> (String) -> Void{
    var coutner = 1
    return{
        print("\(coutner). I am going to \($0)")
        coutner += 1
    }
}
//let re = travCap()
//re("Egypt")
//re("Egypt")
//re("Egypt")
//re("Egypt")
//re("Egypt")

//######## Day 8 ########
// Creating your own struct
struct Sport{
    var name: String
}
var tennis = Sport(name: "Tennis")
print(tennis.name)
tennis.name = "Football"

// Computed Property
struct Sport2{
    var name: String
    var isOlympic: Bool
    var olympicStatus: String{
        if isOlympic{
            return "Olyimpic sport"
        }else{
            return "Not Olyimpic sport"
        }
    }
}

let chess = Sport2(name: "Chess", isOlympic: true)
print(chess.olympicStatus)

// Property observer
struct Progress{
    var task: String
    var amount: Int{
        willSet{
            print("\(task) is going to start change its amount")
        }
        didSet{
            print("\(task) is done by \(amount)%")
        }
    }
}
var task1 = Progress(task: "Loading", amount: 0)
task1.amount = 30
task1.amount = 80
task1.amount = 100

//Methods
struct City{
    var population: Int
    
    func collectTaxes() -> Int{
        return population * 1000
    }
}
let giza = City(population: 8740)
print(giza.collectTaxes())

//Mutating Methods
struct Person{
    var name: String
    
    mutating func makeAnonymous(){
        name = "Yeahh!!"
    }
}
var p1 = Person(name: "Andrew")
p1.makeAnonymous()

//let p2 = Person(name: "Andrew")
//p2.makeAnonymous()

//Properties and methods of strings
let myName = "Andrew Maher Daker"
print(myName.count)
print(myName.sorted())

//Properties and methods of arrays
var toys = ["Woody"]
print(toys.count)
toys.append("Buzz")
toys.index(of: "Buzz")

//######## Day 9 ########
// Initializers
struct User{
    var username: String
    init(){
        username = "Anonymous"
        print("New User has been Created!")
    }
}
var us1 =  User()
us1.username = "Andrew"

//Referring to the current instance
struct Person2{
    var name: String
    init(name: String){
        print("\(name) is bored!")
        self.name = name
    }
}
var per1 = Person2(name: "Andrew")

//Lazy properties
struct FamilyTree{
    init(){
        print("Creating family tree")
    }
}
struct Person3{
    var name: String
    lazy var familyTree = FamilyTree()

    init(name: String){
        self.name = name
    }
}
var per3 = Person3(name: "Andrew")
per3.familyTree

//Static properties and methods
struct Student{
    static var classSize = 0
    var name: String
    
    init(name: String){
        self.name = name
        Student.classSize += 1
    }
}
let ed = Student(name: "Ed")
let taylor = Student(name: "Taylor")
print(Student.classSize)

// Access Control
struct Person4{
    private var id: Int
    init(id: Int){
        self.id = id
    }
    
    func getSocialSec()->String{
        return "My Social Security is \(id)"
    }
}
let per4 = Person4(id: 12345)
print(per4.getSocialSec())

//######## Day 10 ########
//Creating your own classes
class Dog{
    var name: String
    var breed: String
    
    init(name: String, breed:String){
        self.name = name
        self.breed = breed
    }
    
    func makeNoide(){
        print("Woof!")
    }
}
let poppy = Dog(name: "Poppy", breed: "Poddle")

//Class inheritance
class Poddle: Dog{
    init(name: String){
        super.init(name: name, breed: "Poddle")
    }
    
    //Overriding methods
    override func makeNoide() {
        print("Yip!")
    }
}
let podle = Poddle(name: "Poppy")
podle.makeNoide()

//Final classes
final class Cat{
    var name: String
    
    init(name: String){
        self.name = name
    }
    
    func makeNoide() {
        print("Meawo!")
    }
}

//Copying objects
class Singer{
    var name = "Andrew"
}
var sing = Singer()
print(sing.name)

var sing2 = sing
sing2.name = "Taylor"
print(sing.name)

//Deinitializers
class Person5{
    var name = "Andrew"
    init(){
        print("My name is \(name)")
    }
    deinit{
        print("\(name) not available")
    }
}
for _ in 1...3{
    let p = Person5()
}

//Mutability
let and = Person5()
and.name = "Andrew Maher"
print(and.name)

