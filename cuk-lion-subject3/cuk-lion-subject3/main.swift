//
//  main.swift
//  cuk-lion-subject3
//
//  Created by 김희은 on 2023/03/29.
//

import Foundation

enum Coffee {
    case americano, cafeLatte
    case iceTea, vanillaLatte
    case brunchSet
}


struct Person {
    var name: String
    var money: Int

    mutating func buySomething(amount: Int) {
        let balance = self.money - amount

        if balance >= 0 {
            self.money -= amount
            print("\(name)고객님의 주문이 완료되었습니다.")
            print("고객님의 남은 잔고는 \(money)입니다.")
        }
        // 잔액부족
        else {
            print("\(name)고객님, 잔액이 \(balance)원만큼 부족합니다.")
            print("돈을 더 벌어오세요!")
        }
    }
}

struct CoffeeShop{
    var sales: Int = 0
    var barista: Person
    var pickUpTable: Bool
    
    var menu: [Coffee: Int] = [.americano: 3500, .cafeLatte: 4000, .vanillaLatte: 4500, .brunchSet: 10500]
    
    
    mutating func order(coffee: Coffee) {
        print("===== 안녕하세요. 메뉴를 고르시면 말씀해주세요. =====\n")
        
        if(self.welcomeCustomers(coffee: coffee)) {
            self.makeCoffee()
            self.serveCoffee()
        }
        print("=========== 감사합니다. 안녕히가세요. ===========\n")
        pickUpTable = false
    }
    
    
    // 고객 주문 받기
    mutating func welcomeCustomers(coffee: Coffee) -> Bool {
        print("\(barista.name)입니다. 주문도와드리겠습니다.")
        print("\(coffee)주문받았습니다.")
        
        // 주문 불가능한 메뉴일 경우 예외처리
        guard let payment = self.menu[coffee] else {
            print("죄송합니다. 해당 메뉴는 저희 매장에 존재하지 않습니다.")
            return false
        }
        
        print("가격은 \(payment)원입니다.")
        self.sales += payment
        
        return true
    }
    
    
    func makeCoffee(){
        print("음료 제조 중입니다")
    }
    

    mutating func cleanPickUpTable() {
        print("픽업대를 정리하는 중입니다. 잠시만 기다려주세요.")
        self.pickUpTable = false
    }
    
    
    mutating func serveCoffee() {
        if (pickUpTable) {
            print("죄송합니다. 픽업대 정리 후 제공해드리겠습니다.")
            
            // 픽업대 청소 후 다시 제공
            self.cleanPickUpTable()
            self.serveCoffee()
        }
        else {
            print("\n주문하신 음료를 픽업대에서 가져가 주세요.")
            self.pickUpTable = true
        }
    }
}

var misterLee: Person = Person(name: "misterLee", money: 10000)
var misterKim: Person = Person(name: "misterKim", money: 2000)
var mustabucks: CoffeeShop = CoffeeShop(sales: 100000, barista: misterLee, pickUpTable: true)
