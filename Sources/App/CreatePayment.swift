//
//  CreatePayment.swift
//  
//
//  Created by Максим on 18.01.2021.
//

import Fluent
import FluentPostgresDriver

struct CreatePayment: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("payments")
            .id()
            .field("operation_id", .string)
            .field("notification_type", .string)
            .field("datetime", .string)
            .field("sha1_hash", .string)
            .field("sender", .string)
            .field("codepro", .bool)
            .field("currency", .string)
            .field("amount", .string)
            .field("withdraw_amount", .string)
            .field("label", .string)
            .field("unaccepted", .bool)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("payments").delete()
    }
}
