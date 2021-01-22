//
//  Payment.swift
//  
//
//  Created by Максим on 18.01.2021.
//

import Fluent
import Vapor

final class Payment: Model, Content {
    static let schema = "payments"

    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "operation_id")
    var operation_id : String
    
    @Field(key: "notification_type")
    var notification_type : String
    
    @Field(key: "datetime")
    var datetime: String
    
    @Field(key: "sha1_hash")
    var sha1_hash: String
    
    @Field(key: "sender")
    var sender: Int
    
    @Field(key: "codepro")
    var codepro: Bool
    
    @Field(key: "currency")
    var currency: String
    
    @Field(key: "amount")
    var amount: String
    
    @Field(key: "withdraw_amount")
    var withdraw_amount: String?
    
    @Field(key: "label")
    var label: String
    
    @Field(key: "unaccepted")
    var unaccepted: Bool


    init() { }

    init(id: UUID? = nil,
         operationId: String,
         notificationType: String,
         datetime: String,
         sha1Hash: String,
         sender: Int,
         codepro: Bool,
         currency: String,
         amount: String,
         withdrawAmount: String?,
         label: String,
         unaccepted: Bool) {
        
        self.id = id
        self.operation_id = operationId
        self.notification_type = notificationType
        self.datetime = datetime
        self.sha1_hash = sha1Hash
        self.sender = sender
        self.codepro = codepro
        self.currency = currency
        self.amount = amount
        self.withdraw_amount = withdrawAmount
        self.label = label
        self.unaccepted = unaccepted
    }
    
}

//operation_id = 441361714955017004 !
//notification_type = card-incoming  !
//datetime = 2013-12-26T08:28:34Z  !
//sha1_hash = ac13833bd6ba9eff1fa9e4bed76f3d6ebb57f6c0
//sender =
//codepro = false
//currency = 643
//amount = 98.00
//withdraw_amount = 100.00
//label = ML23045

//notification_type    string    Для переводов из кошелька — p2p-incoming. Для переводов с произвольной карты — card-incoming.

//operation_id    string    Идентификатор операции в истории счета получателя.

//amount    amount    Сумма, которая зачислена на счет получателя.

//withdraw_amount    amount    Сумма, которая списана со счета отправителя.

//currency    string    Код валюты — всегда 643 (рубль РФ согласно ISO 4217).

//datetime    datetime    Дата и время совершения перевода.

//sender    string    Для переводов из кошелька — номер кошелька отправителя. Для переводов с произвольной карты — параметр содержит пустую строку.

//codepro    boolean    Для переводов из кошелька — перевод защищен кодом протекции. Для переводов с произвольной карты — всегда false.

//label    string    Метка платежа. Если ее нет, параметр содержит пустую строку.

//sha1_hash    string    SHA-1 hash параметров уведомления.

//unaccepted    boolean    Перевод еще не зачислен. Получателю нужно освободить место в кошельке или использовать код протекции (если codepro=true).

//label: "",
//unaccepted: false,
//sha1_hash: "fdcc7ff313b9452938e90dddc2a50d654e765cb3",
//sender: "41001000040",
//currency: "643",
//amount: "441.10",
//codepro: false,
//notification_type: "p2p-incoming",
//withdraw_amount: nil,
//datetime: "2021-01-22T09:29:22Z",
//operation_id: "test-notification"
