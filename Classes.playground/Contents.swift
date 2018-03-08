//: Playground - noun: a place where people can play

import UIKit
// Classes
class FastCar {
    
    var topSpeed : Int
    
    init(topSpeed: Int){
        self.topSpeed = topSpeed
    }
    
    func GetTopSpeed() -> Int{
        return self.topSpeed
    }
    
}

var myCar = FastCar(topSpeed : 210)
myCar.GetTopSpeed()

var ferrari = FastCar(topSpeed: 220)
ferrari.GetTopSpeed()


// Inheritance
class Car{
    let numWheels: Int
    
    init(numWheels: Int) {
        self.numWheels = numWheels
    }
}

class FamilyCar: Car{
    let numberOfDoors = 5
}

class BMW:FamilyCar{
    var size = "Gigantic"
}

var myFamilyCar = FamilyCar(numWheels: 6)
myFamilyCar.numWheels

//Arrays
var cijferlijst: [Int] = [3,7,8]
var klassenlijst = [String]()

cijferlijst.append(4)
klassenlijst.append("Dylan")

cijferlijst += [5,6]
klassenlijst += ["Jantje", "Pietje"]

print(cijferlijst.count)
print(klassenlijst.count)

print(cijferlijst[3])

//function


func CheckCount(message: String, passedCount: Int) -> String
{
    var count: Int = passedCount
    
    while count < 10 {
        print(message)
        count += 1
    }
    return "Done!"
}


CheckCount(message: "Not yet", passedCount : 0)




















