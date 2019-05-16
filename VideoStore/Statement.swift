public class Statement {
  
  private var customer: Customer
  
  required init(customer: Customer) {
    self.customer = customer
  }
  
  public func generate() -> String {
    var totalAmount: Double = 0
    var frequentRenterPoints: Int = 0;
    
    var result = "Rental Record for " + customer.name + "\n";
    
    for rental in customer.rentals {
      var thisAmount: Double = 0;
      
      switch rental.movie.priceCode {
      case Movie.REGULAR:
        let regularMovie = RegularMovie(title: rental.movie.title, priceCode: Movie.REGULAR)
        thisAmount += regularMovie.calculateAmount(rental)
      case Movie.NEW_RELEASE:
        let newMovie = NewMovie(title: rental.movie.title, priceCode: Movie.NEW_RELEASE)
        thisAmount += newMovie.calculateAmount(rental)
      case Movie.CHILDRENS:
        let childrensMovie = ChildrensMovie(title: rental.movie.title, priceCode: Movie.CHILDRENS)
        thisAmount += childrensMovie.calculateAmount(rental)
      default:
        break
      }
      
      frequentRenterPoints+=1;
      
      if rental.movie.priceCode == Movie.NEW_RELEASE
        && rental.daysRented > 1 {
        frequentRenterPoints+=1;
      }
      
      result += "\t" + rental.movie.title + "\t"
        + String(thisAmount) + "\n";
      totalAmount += thisAmount;
    }
    
    result += "You owed " + String(totalAmount) + "\n";
    result += "You earned " + String(frequentRenterPoints) + " frequent renter points\n";
    
    return result;
  }

}
