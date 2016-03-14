//: # Reference And Value Types
//:
//: 2D Point Example

//: NOTE: some code portions would raise compilation errors because we are trying to assign new values to immutable instances.
//: Such code has been commented out to allow the playground to run. The related compilation error messages have been added to the comments
//: to help the reader understand what code would fail. It is possible to re-enable such code in order to verify that the compiler
//: doesn't allow its execution.

// Reference Type

class PointClass {
    var x: Int = 0
    var y: Int = 0

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func toString() -> String {
        return "x=\(x), y=\(y)"
    }
}

// Assignment
var pointA = PointClass(x: 1, y: 3)
var pointB = pointA
print(pointA.toString())
print(pointB.toString())

pointB.y = 4
print(pointA.toString())
print(pointB.toString())

// Parameter Passing
func evaluate(point: PointClass) {
    point.x = -1
    point.y = -1
}

evaluate(pointB)
print(pointB.toString())

// Value Type

struct PointStruct {
    var x: Int = 0
    var y: Int = 0

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func toString() -> String {
        return "x=\(x), y=\(y)"
    }
}

// Assignment
var pointC = PointStruct(x: 1, y: 3)
var pointD = pointC
print(pointC.toString())
print(pointD.toString())

pointD.y = 4
print(pointC.toString())
print(pointD.toString())

// Parameter Passing
// Cannot assign to property: 'point' is a 'let' constant
func evaluate(point: PointStruct) {
//    point.x = -1
//    point.y = -1
}

// Immutability (let)

// Immutable Reference Type

let point1 = PointClass(x: 2, y: 5)
point1.x = 0
// Cannot assign to value: 'point1' is a 'let' constant
//point1 = PointClass(x: 0, y: 0)


// Immutable Value Type

let point2 = PointStruct(x: 2, y: 5)
// Cannot assign to value: 'point2' is a 'let' constant
//point2.x = 0
//point2 = PointStruct(x: 0, y: 0)
