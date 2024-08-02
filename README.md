코드 스타터 캠프 3주차 미션을 위한 저장소입니다.

1. step1
“Round3 첫번째 스텝 "타입과 인스턴스의 관계” \
기능구현 설명입니다.

## 순서도
<img width="352" alt="image" src="https://github.com/user-attachments/assets/098868d9-d781-4ab6-948f-2bb76b240861">


## 기능구현
### Person 클래스
- 돈을 프로퍼티로 초기화 합니다. 
- buyCoffee함수에 파라미터로 열거형 커피메뉴와 클래스인 커피숍을 설정합니다.
- Person클래스 내에 있는 돈으로 메뉴를 할수 있는 지 없는지 판별해줍니다.
- 구매가 가능하면 커피숍의 receiveOrder함수를 실행하게 하며 이는 커피를 만들어주는 함수로 연결하여 줍니다.
```swift
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
```
### Coffee 열거형
- 커피메뉴를 열거형으로 정의해줍니다.
```swift
enum Coffee: String {
    case espresso = "Espresso", americano = "Americano", latte = "Latte", cappuccino = "Cappuccino"
}
```
### CoffeeShop 클래스
- 판매가, 메뉴, 픽업상황, 바리스타를 초기화 해줍니다.
- 주문함수가 실행이 될 시 makeCoffee함수가 실행이되어 커피를 제작하며 픽업상황테이블에 추가되고 판매가에 가격이 추가됩니다.
```swift
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
```
