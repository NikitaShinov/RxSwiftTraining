import UIKit
import RxSwift
import RxCocoa

let disposeBag = DisposeBag()

    //MARK: - PublishSubject

//let subject = PublishSubject<String>()

//subject.onNext("issue 1")
//
//subject.subscribe { event in
//    print (event)
//}
//
//subject.onNext("issue 2")
//subject.onNext("issue 3")
//
//subject.dispose()
//subject.onCompleted()
//
//subject.onNext("issue 4")

    //MARK: - BehaviorSubject

//let subject = BehaviorSubject(value: "initial value")
//
//subject.onNext("last issue")
//
//subject.subscribe { event in
//    print (event)
//}
//
//subject.onNext("issue 1")

    //MARK: - ReplaySubject

//let subject = ReplaySubject<String>.create(bufferSize: 2)
//
//subject.onNext("Issue 1")
//subject.onNext("Issue 2")
//subject.onNext("Issue 3")
//
//subject.subscribe {
//    print ($0)
//}
//
//subject.onNext("Issue 4")
//subject.onNext("Issue 5")
//subject.onNext("Issue 6")
//
//print ("-----------------")
//
//subject.subscribe {
//    print ($0)
//}

    //MARK: - BehaviorRelay

let relay = BehaviorRelay(value: [String]())

var value = relay.value

value.append("Item 1")
value.append("Item 3")
relay.accept(value)

relay.asObservable()
    .subscribe {
        print ($0)
    }

relay.accept(relay.value + ["Item 2"])
