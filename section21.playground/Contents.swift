import Foundation

var pizzaInInches: Int = 12 {
    willSet {
        //right before it changes
        print(pizzaInInches)
        print(newValue)
    }
    didSet {
        //right after it changes
        if pizzaInInches >= 18 {
            print("Invalid size specified")
            pizzaInInches = 18
        }
    }
}


pizzaInInches = 20

var numberOfPeople: Int = 6
let slicesPerPerson: Int = 5


var numberOfSlices: Int {
    get {
        return  pizzaInInches - 4
    }
    
    set {
        print("numberOfSlices has a new value \(newValue)") //newValue is predefined in the setter
    }
}
print(numberOfSlices)
numberOfSlices = 12


var numberOfPizza: Int {
    get {
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFedPerPizza
    }
    set {
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicesPerPerson
    }
}

print(numberOfPizza)
