import XCTest
@testable import VideoStore

class VideoStoreTests: XCTestCase {

    private var customer: Customer?

    override func setUp() {
        customer = Customer(name: "Fred")
    }

    func testSingleNewReleaseStatement() {
        customer?.addRental(rental: Rental(movie: Movie(title: "The Cell", priceCode: Movie.NEW_RELEASE), daysRented: 3))
        XCTAssertEqual("Rental Record for Fred\n\tThe Cell\t9.0\nYou owed 9.0\nYou earned 2 frequent renter points\n", customer?.statement())
    }
    
    func testDualNewReleaseStatement() {
        customer?.addRental(rental: Rental(movie: Movie(title: "The Cell", priceCode: Movie.NEW_RELEASE), daysRented: 3))
        customer?.addRental(rental: Rental(movie: Movie(title: "The Tigger com.example.videostore.Movie", priceCode: Movie.NEW_RELEASE), daysRented: 3))
        XCTAssertEqual("Rental Record for Fred\n\tThe Cell\t9.0\n\tThe Tigger com.example.videostore.Movie\t9.0\nYou owed 18.0\nYou earned 4 frequent renter points\n", customer?.statement())
    }
    
    func testSingleChildrensStatement() {
        customer?.addRental(rental: Rental(movie: Movie(title: "The Tigger com.example.videostore.Movie", priceCode: Movie.CHILDRENS), daysRented: 3))
        XCTAssertEqual("Rental Record for Fred\n\tThe Tigger com.example.videostore.Movie\t1.5\nYou owed 1.5\nYou earned 1 frequent renter points\n", customer?.statement())
    }
    
    func testMultipleRegularStatement() {
        customer?.addRental(rental: Rental(movie: Movie(title: "Plan 9 from Outer Space", priceCode: Movie.REGULAR), daysRented: 1))
        customer?.addRental(rental: Rental(movie: Movie(title: "8 1/2", priceCode: Movie.REGULAR), daysRented: 2))
        customer?.addRental(rental: Rental(movie: Movie(title: "Eraserhead", priceCode: Movie.REGULAR), daysRented: 3))
    
        XCTAssertEqual("Rental Record for Fred\n\tPlan 9 from Outer Space\t2.0\n\t8 1/2\t2.0\n\tEraserhead\t3.5\nYou owed 7.5\nYou earned 3 frequent renter points\n", customer?.statement())
    }
    
}
