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

enum Planet: Int{
    case mercury = 1
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 3)

