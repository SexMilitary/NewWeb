import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    app.post("payment") { (req) -> EventLoopFuture<Payment> in
        
        let payment = try req.content.decode(Payment.self)
        print(payment)
        return payment.create(on: req.db).map { payment }
    }
    
    app.get("payments") { (req) -> EventLoopFuture<[Payment]> in
        Payment.query(on: req.db).all()
    }
    
}
