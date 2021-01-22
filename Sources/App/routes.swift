import Fluent
import Vapor
import FluentPostgresDriver

func routes(_ app: Application) throws {
    
    app.post("v1", "payment") { (req) -> EventLoopFuture<Payment> in
        
        let payment = try req.content.decode(Payment.self)
        print(payment, req.content)
        return payment.create(on: req.db).map { payment }
    }
    
    app.get("v1", "payments") { (req) -> EventLoopFuture<[Payment]> in
        Payment.query(on: req.db).all()
    }
    
    app.get("testing") { req -> String in
        return "Succes"
    }
    
    app.get("v1","payments","search") { req -> EventLoopFuture<[Payment]> in
    
        guard let searchTerm =
           req.query[String.self, at: "label"] else {
           throw Abort(.badRequest)
         }
        
        return Payment.query(on: req.db)
            .filter(\.$label == searchTerm)
            .all()
    }
    
}
