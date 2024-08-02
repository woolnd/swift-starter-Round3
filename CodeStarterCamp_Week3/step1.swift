//
//  step1.swift
//  CodeStarterCamp_Week3
//
//  Created by wodnd on 8/2/24.
//

import Foundation

class Person {
    var money: Int
    
    init(money: Int) {
        self.money = money
    }
    
    func buyCoffee(coffee: Coffee, shop: CoffeeShop) {
        let price = shop.menu[coffee]
        if let price = price, self.money >= price {
            self.money -= price
            shop.receiveOrder(coffee: coffee)
            print("구매내역: \(coffee) : \(price)원.")
            print("남은 돈: \(self.money)원.")
        } else {
            print("돈이부족해서 \(coffee)를 구매가 불가능합니다.")
        }
    }
}

enum Coffee: String {
    case espresso = "Espresso", americano = "Americano", latte = "Latte", cappuccino = "Cappuccino"
}

class CoffeeShop {
    var sales: Int
    var menu: [Coffee: Int]
    var pickUpTable: [Coffee] = []
    var barista: Person

    init(sales: Int, menu: [Coffee: Int], barista: Person) {
        self.sales = sales
        self.menu = menu
        self.barista = barista
    }

    func receiveOrder(coffee: Coffee) {
        self.makeCoffee(coffee: coffee)
    }

    func makeCoffee(coffee: Coffee) {
        self.pickUpTable.append(coffee)
        let price = self.menu[coffee] ?? 0
        self.sales += price
    }
}

let misterLee = Person(money: 5000)
let missKim = Person(money: 10000)
let yagombucksMenu = [Coffee.espresso: 2000, Coffee.americano: 2500, Coffee.latte: 3000, Coffee.cappuccino: 3500]
let yagombucks = CoffeeShop(sales: 0, menu: yagombucksMenu, barista: misterLee)
