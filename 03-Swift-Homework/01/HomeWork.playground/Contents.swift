import UIKit

/**
 1. Напишите расширение для коллекций целых чисел, которое возвращает,
 сколько раз определенная цифра фигурирует в любом из его номеров.

  Код [5, 15, 55, 515].testFunc(count: "5") должен возвращать 6.
  Код [5, 15, 55, 515].testFunc(count: "1") должен возвращать 2.
  Код [55555].testFunc(count: "5") должен возвращать 5
  Код [55555].testFunc(count: "1") должен возвращать 0.
 */

extension Array where Element == Int {
    func searchCount(number: String) -> Int {
        var count = 0
        for num in self {
            let numStr = NSNumber(integerLiteral: num).stringValue
            if numStr.contains(number) {
                count += numStr.filter({ String($0) == number }).count
            }
        }
        return count
    }
}

[5, 15, 55, 515].searchCount(number: "5")
[5, 15, 55, 515].searchCount(number: "1")
[55555].searchCount(number: "5")
[55555].searchCount(number: "1")

/**
 2. Отсортировать массив по длине строк его значений

 ["a", "abc", "ab"].testSorted() должен возвращать ["abc", "ab", "a"].
 */

extension Array where Element == String {
    func testSorted() -> [String] {
        return self.sorted( by: { $0.count > $1.count })
    }
}

["a", "abc", "ab"].testSorted()

/**
 3. Создайте функцию, которая принимает массив несортированных чисел от 1 до 100,
 где ноль или более чисел могут отсутствовать, и возвращает массив отсутствующих чисел например: 

 var testArray = Array(1...100)
 testArray.remove(at: 25)
 testArray.remove(at: 20)
 testArray.remove(at: 6)

 getMissingNumbers(input: testArray) // [7, 21, 26]
 */

func getMissingNumbers(input: [Int]) -> [Int] {
    var result = [Int]()
        var diffIndex = 1
        for (index,value) in input.enumerated() {
            if value != index + diffIndex {
                result.append(value-1)
                diffIndex += 1
            }
        }
    return result
}

var testArray = Array(1...100)
testArray.remove(at: 25)
testArray.remove(at: 20)
testArray.remove(at: 6)

getMissingNumbers(input: testArray) // [7, 21, 26]

/**
 4. Поменять значения массива местами (не использовать reverse)
 Пример:
 var array = [1, 2, 3]
 array.testReverse()

 */

extension Array where Element == Int {
    func testReverse() -> [Int] {
        var result = [Int]()
        var index = self.count - 1
        while index >= 0 {
            result.append(self[index])
            index -= 1
        }
        return result
    }
}

var testArray2 = [1, 2, 3]
testArray2.testReverse()

/**
 Решите проблему сильных ссылок
 */

class Person {
  let name: String
  let email: String
var car: Car?

  init(name: String, email: String) {
    self.name = name
    self.email = email
  }

  deinit {
    print("Goodbye \(name)!")
  }
}

class Car {
  let id: Int
  let type: String
    unowned var owner: Person?

 init(id: Int, type: String) {
   self.id = id
   self.type = type
 }

 deinit {
   print("Goodbye \(type)!")
 }
}

var owner: Person? = Person(name: "Cosmin",
                            email: "cosmin@whatever.com")
var car: Car? = Car(id: 10, type: "BMW")

owner?.car = car
car?.owner = owner

owner = nil
car = nil

