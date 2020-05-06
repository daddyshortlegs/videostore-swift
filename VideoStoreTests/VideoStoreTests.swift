import XCTest
@testable import VideoStore

class VideoStoreTests: XCTestCase {

    private var customer: Customer?
    private var statement: Statement?


    override func setUp() {
      customer = Customer(name: "Fred")
      statement = Statement(customer: customer!)
    }

    func testSingleNewReleaseStatement() {
        customer?.addRental(rental: NewMovie(title: "The Cell", daysRented: 3))
      
      XCTAssertEqual("Rental Record for Fred\n\tThe Cell\t9.0\nYou owed 9.0\nYou earned 2 frequent renter points\n", statement?.generate())
    }
    
    func testDualNewReleaseStatement() {
        customer?.addRental(rental: NewMovie(title: "The Cell", daysRented: 3))
        customer?.addRental(rental: NewMovie(title: "The Tigger com.example.videostore.Movie", daysRented: 3))
        XCTAssertEqual("Rental Record for Fred\n\tThe Cell\t9.0\n\tThe Tigger com.example.videostore.Movie\t9.0\nYou owed 18.0\nYou earned 4 frequent renter points\n", statement?.generate())
    }
    
    func testSingleChildrensStatement() {
        customer?.addRental(rental: ChildrensMovie(title: "The Tigger com.example.videostore.Movie", daysRented: 3))
        XCTAssertEqual("Rental Record for Fred\n\tThe Tigger com.example.videostore.Movie\t1.5\nYou owed 1.5\nYou earned 1 frequent renter points\n", statement?.generate())
    }
    
    func testMultipleRegularStatement() {
        customer?.addRental(rental: RegularMovie(title: "Plan 9 from Outer Space", daysRented: 1))
        customer?.addRental(rental: RegularMovie(title: "8 1/2", daysRented: 2))
        customer?.addRental(rental: RegularMovie(title: "Eraserhead", daysRented: 3))
    
        XCTAssertEqual("Rental Record for Fred\n\tPlan 9 from Outer Space\t2.0\n\t8 1/2\t2.0\n\tEraserhead\t3.5\nYou owed 7.5\nYou earned 3 frequent renter points\n", statement?.generate())
    }
  
  func testChildrensMoviesOver3Days() {
    let movie = ChildrensMovie(title: "Spongebob", daysRented: 4)
    customer?.addRental(rental: movie)
    
    XCTAssertEqual("Rental Record for Fred\n\tSpongebob\t3.0\nYou owed 3.0\nYou earned 1 frequent renter points\n", statement?.generate())
  }
    
}
