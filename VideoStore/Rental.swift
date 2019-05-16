public class Rental {
  
    public var movie: Movie
    public var daysRented: Int
  
    public init(movie: Movie, daysRented: Int) {
        self.movie = movie
        self.daysRented = daysRented
    }
  
}

