module Chapter_3.BookStore where

type CustomerID = Int
type ReviewBody = String
type BookRecord = (BookInfo, BookReview)
type CardHolder = String
type CardNumber = String
type Address    = [String] 

data BookInfo = Book Int String [String]
  deriving (Show)

data MagazineInfo = Magazine Int String [String]
  deriving (Show)

data BookReview = BookReview BookInfo CustomerID ReviewBody

data Customer = Customer {
    customerID :: CustomerID
  , customerName :: String
  , cusomerAddress :: Address
} deriving (Show)

data BillingInfo = CreditCard CardNumber CardHolder Address
                 | CashOrDelivery
                 | Invoice CustomerID
                   deriving (Show)

bookID :: BookInfo -> Int
bookID (Book bid _ _) = bid

bookTitle :: BookInfo -> String
bookTitle (Book _ title _) = title

bookAuthors :: BookInfo -> [String]
bookAuthors (Book _ _ authors) = authors

myInfo :: BookInfo
myInfo = Book 78901235072455 "Algebra of Programming"
         ["Richard Bird", "Oehe de Moor"]

customer :: Customer
customer = Customer 231123 "JS Sweet" ["123 Street", "Town", "State"]

customer1 :: Customer
customer1 = Customer {
    customerID = 123
  , cusomerAddress = []
  , customerName = "Me"
}