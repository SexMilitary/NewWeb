import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {

    app.databases.use(.postgres(hostname: "localhost",
                                username: "postgress",
                                password: "13017613",
                                database: "maindb"),
                      as: .psql)
    
    app.migrations.add(CreatePayment())
    
    try app.autoMigrate().wait()
    
    try routes(app)
}
