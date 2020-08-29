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
let re = travCap()
re("Egypt")
re("Egypt")
re("Egypt")
re("Egypt")
re("Egypt")
