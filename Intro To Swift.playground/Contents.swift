//: Playground - noun: a place where people can play

import UIKit

// Variables and Strings
var str = "Hello, playground"
var age = 22
var population = 8_000_000
var distance = 3.8
var isLoaded = true

// ########## Day 1 ##########
// Multi line string
var str1 = """
This goes
over multiple
lines
"""
var str2 = """
this goes \
over mutiple \
lines
"""

// String interpolation
var str3 = "Your distance was \(distance)"

// Constants
let taylor = "Swift"

// Explicit typing
let album: String = "Reputation"
let isReleased: Bool = false
let rate: Double = 4.5
let price: Int = 50

// ########## Day 2 ##########
// Arrays
let john = "John Lennon"
let andrew = "Andrew Maher"
let george = "George Harrison"

let beatles = [john, andrew, george]
beatles[0]

let x_axis: [Int] = [2, 4, 8, 16]
x_axis[3]

// Sets
let colors = Set(["red", "green", "blue"])

// Tuples
var name = (first: "Taylor", last: "Swift")
name.0
name.last

// Dictionaries
let heights: [String : Double] = [
    "Taylor": 1.78,
    "Ed Sheeran": 1.73
]

heights["Ed Sheeran"]

heights["Andrew", default:0]

// Empty Collections
var teams = [String : String]()
teams["Paul"] = "red"

var results = [Int]()

var words = Set<String>()

// Enums
enum Result{
    case success
    case failure
}
let result = Result.success

enum Activity{
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}
let activity = Activity.talking(topic: "Swift")
print(activity)

enum Planet: Int{
    case mercury = 1
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 3)
//print(earth?.rawValue)

// ########## Day 3 ##########
// Operators

let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let deff = firstScore - secondScore

let mult = firstScore * secondScore
let div = firstScore / secondScore

let rem = firstScore % secondScore

// Overloading
let fakers = "Fakers gonna "
let action = fakers + "Fake"

let fh = ["John", "Paul"]
let sh = ["George", "Ringo"]
let beatles2 = fh + sh

// Compound operators

var score = 95
score -= 5

var quote = "Andrew "
quote += "Maher"

// Comparison operators

let fs = 6
let ss = 4

fs == ss
fs != ss

fs < ss
fs >= ss

"Andrew" <= "Maher"

// Conditions
let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2{
    print("Lucky Aces!")
} else if firstCard + secondCard == 21{
    print("Blackjack!")
}else{
    print("Regular Cards")
}

// Combine Conditions
let age1 = 11
let age2 = 21

if age1 > 18 && age2 > 18{
    print("Both are over 18")
}

if age1 > 18 || age2 > 18{
    print("At least one is over 18")
}

// Ternary operators
let fc = 11
let sc = 10
let res = fc == sc ? "Cards are same" : "Cards are differents"

// Switch Statments
let weather = "sunny"
switch weather{
case "rain":
    print("Bring umbrella")
case "sunny":
    print("Wear sunglasses")
    fallthrough
default:
    print("Enjoy your day!")
}

// Range operators
let score1 = 85

switch score1{
case 0..<50:
    print("You failed!")
case 50...85:
    print("You did OK")
default:
    print("You did great")
}

// ########## Day 4 ##########
// For Loops
let count = 1...10

for number in count{
    print("Number is \(number)")
}

let albums = ["Red", "1989", "Andrew"]
for album in albums{
    print(album)
}

for _ in 1...5{
    print("play")
}

// While Loops
var number = 1
while number <= 20{
    //print(number)
    number += 1
}

// Repeat Loops
var num2 = 1
repeat{
    print(num2)
    num2 += 1
}while num2 <= 20

// Exiting loop
var countDown = 10
while countDown >= 0{
    if countDown == 4{
        print("I am bored")
        break
    }
    countDown -= 1
}

// Exiting nested loop
outerLoop: for i in 1...10{
    for j in 1...10{
        let product = i * j
        print("\(i) * \(j) is \(product)")
        if product == 50{
            break outerLoop
        }
    }
}

// Skipping item
for i in 1...10{
    if i % 2 == 1{
        continue
    }
    print(i)
}

// Infinite loops

// ########## Day 5 ##########
// Writing functions
func printHelp(){
    let message = "This is my first function"
    print(message)
}
printHelp()

// Passing parameters
func sumNum(x: Int, y: Int){
    print(x+y)
}
sumNum(x: 2, y: 5)

// Returning Values
func getSquare(x: Int)->Int{
    return x*x
}
print(getSquare(x: 2))

//Parameter labels
func sayHello(to name: String){
    print("Say hello to \(name)")
}
sayHello(to: "Andrew")

//Omitting parameter labels
func greet(_ person: String){
    print("Hello, \(person)")
}
greet("Taylor")

//Default parameters
func defaultGreet(_ person: String, nicely: Bool = true){
    if nicely == true{
        print("Hello, \(person)")
    }else{
        print("Oh no, it's \(person) again...")
    }
}
defaultGreet("Andrew")
defaultGreet("Andrew", nicely: false)

// Variadic functions
func squareAll(numbers: Int...){
    for number in numbers{
    print("\(number) square is \(number * number)")
    }
}
squareAll(numbers: 1,2,3,4,5)

// Writing throwing functions
enum PasswordError: Error{
    case obvious
}
func checkPassword(_ password: String) throws -> Bool{
    if password == "password"{
        throw PasswordError.obvious
    }
    return true
}
do{
    try checkPassword("password")
    print("That password is good!")
}catch{
    print("You can't use this password")
}

// inout Prameters
func doubleInPlace(number: inout Int){
    number *= 2
}
var myNum = 10
doubleInPlace(number: &myNum)
print(myNum)





