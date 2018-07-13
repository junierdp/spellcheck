//: Playground - noun: a place where people can play

import Foundation
import XCTest

class SpellCheck {
    func find(word: String, dictionary: [String]) -> [String] {
        var result: [String] = []
        let lenght: Int = word.count
        
        for value in dictionary {
            if value == word{
                return []
            }
            let valueLenght = value.count
            if valueLenght < lenght - 1 || valueLenght > lenght + 1 {
                continue
            }
            var counter: Int = 0
            
            for (index, char) in value.enumerated() {
                if counter == lenght {
                    break
                }
                let i = word.index(word.startIndex, offsetBy: index)
                if word[i] != char {
                    break
                }
                counter += 1
            }
            
            if (counter >= lenght - 1 && counter <= lenght + 1) {
                result.append(value)
            }
        }
        return result
    }
}

class TestSpellCheck: XCTestCase {
    var spellCheck: SpellCheck?
    override func setUp() {
        super.setUp()
        self.spellCheck = SpellCheck()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSpellCheck1() {
        // Arrange
        let dictionary: [String] = ["polo", "lao", "casa", "asdf"]
        let word: String = "lao"
        let expected: [String] = []
        
        // Act
        let result: [String] = self.spellCheck!.find(word: word, dictionary: dictionary)
        
        // Assert
        XCTAssertEqual(result, expected)
    }
    
    func testSpellCheck2() {
        // Arrange
        let dictionary: [String] = ["polo", "pold", "polac", "palacio"]
        let word: String = "pola"
        let expected: [String] = ["polo", "pold", "polac"]
        
        // Act
        let result: [String] = self.spellCheck!.find(word: word, dictionary: dictionary)
        
        // Assert
        XCTAssertEqual(result, expected)
    }
    
    func testSpellCheck3() {
        // Arrange
        let dictionary: [String] = ["marea", "mar", "mares", "martex"]
        let word: String = "martes"
        let expected: [String] = ["martex"]
        
        // Act
        let result: [String] = self.spellCheck!.find(word: word, dictionary: dictionary)
        
        // Assert
        XCTAssertEqual(result, expected)
    }
    
    func testSpellCheck4() {
        // Arrange
        let dictionary: [String] = ["milano", "milanesa", "misterio", "milanas", "milasa"]
        let word: String = "milan"
        let expected: [String] = ["milano", "milasa"]
        
        // Act
        let result: [String] = self.spellCheck!.find(word: word, dictionary: dictionary)
        
        // Assert
        XCTAssertEqual(result, expected)
    }
}

TestSpellCheck.defaultTestSuite.run()
