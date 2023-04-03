# 타입
---
## struct, class, enum

struct | class | enum
:---:|:---:|:---:
`struct` | `class` | `enum`
값 타입 | 참조타입 | 값 타입
swift 대부분이 struct로 쓰임 | apple framework 대부분의 큰 뼈대는 클래스로 구성 | 유사한 종류의 여러 값을 유의미한 이름으로 한 곳에 모아서 정리해두는 용도
Method, Property | Method, Property | case
단일 상속 (다중상속 허용 X) | - | -



<br><br>

## Type Property & type Method

Type method와 type property는 Swift에서 class, struct, enum 등의 타입 자체에 속하는 메소드와 프로퍼티로,
인스턴스를 생성하지 않고도 타입 자체에 접근하여 호출할 수 있는 메소드와 프로퍼티이다
<br>
### Type Property/Method를 사용하는 이유
1. 타입 프로퍼티/메소드는 인스턴스마다 고유한 값을 갖지 않고, 모든 인스턴스가 공유해야 하는 값을 클래스 또는 구조체 수준에서 관리하기 위해 사용한다
2. 타입 프로퍼티의 경우 인스턴스마다 값을 저장할 필요 없이 클래스나 구조체 수준에서 값이 공유되기 때문에 메모리 절약이 가능하다
3. 타입 메소드는 클래스나 구조체 자체에서 호출되기 때문에, 인스턴스를 생성하지 않고도 사용할 수 있다는 장점을 지닌다

<br>

Type Property | Type Method
:--: | :--:
`static var _` | `static func _() {}`: 상속 시 **재정의 불가** 타입 메서드 <br> `class func _() { }`: 상속 시 **재정의 가능** 타입 메서드
instance가 아닌 type자체에 속하는 Property |instance가 아닌 type자체에 속하는 Method

* **instance에서는 사용할 수 없으며, type명, Property명으로 사용된다**

<br><br>
### static func 과 final class func

static func | class func | final class func
:--: | :--: | :--:
 타입 메서드를 정의할 때 사용되는 키워드, <br>정적호출 | 클래스에서 호출할 수 있는 타입 메서드를 정의하는 키워드 | 클래스 메서드를 정의할 때 사용되는 키워드로, 해당 메서드가 서브클래스에서 오버라이드될 수 없음을 나타냄
타입 메서드에서 사용됨 | 타입 메서드에서 사용됨 | 클래스에서만 사용할 수 있음
서브클래스에서 오버라이드할 수 없음 | 클래스 계층 구조를 가진 경우 하위클래스에서 오버라이드/상속이 가능 | 서브클래스에서 오버라이드할 수 없음


<br><br>

## rawValue(원시값)

```
enum Fruit: Int {
	case grape = 0
	case mango 
}
let apple : Fruit? = Fruit(rawValue: 0)
```
* mango는 자동으로 값이 1로 지정된다

* apple이 Fruit에 없는 것처럼, 초기화 값이 case에 없을 경우가 있기 때문에 rawValue를 통해 초기화해주어야 한다


<br><br>

## mutating func
* 값 타입(Value Type)에서 인스턴스 자체의 값을 변경하는 메소드를 정의할 때 사용된다

* Swift에서는 값 타입(Value Type)의 인스턴스 메소드는 **얕은 복사**를 하기 때문에 해당 인스턴스의 내부 상태를 변경할 수 없다

* 값 타입에서 인스턴스 자체의 값을 변경하려면 mutating 키워드를 사용하여 해당 메소드가 값을 변경할 수 있음을 나타내야 한다

<br><br><br>
