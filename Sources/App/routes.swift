import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    app.post("v1", "payment") { (req) -> EventLoopFuture<Payment> in
        
        let payment = try req.content.decode(Payment.self)
        print(payment)
        return payment.create(on: req.db).map { payment }
    }
    
    app.get("v1", "payments") { (req) -> EventLoopFuture<[Payment]> in
        Payment.query(on: req.db).all()
    }
    
    app.get("testing") { req -> String in
        return "Succes"
    }
}
