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

//let relay = BehaviorRelay(value: [String]())
//
//var value = relay.value
//
//value.append("Item 1")
//value.append("Item 3")
//relay.accept(value)
//
//relay.asObservable()
//    .subscribe {
//        print ($0)
//    }
//
//relay.accept(relay.value + ["Item 2"])

    //MARK: - TakeUntil

//let subject = PublishSubject<String>()
//let trigger = PublishSubject<String>()
//
//subject.take(until: trigger)
//    .subscribe(onNext: {
//        print ($0)
//    }).disposed(by: disposeBag)
//
//subject.onNext("1")
//subject.onNext("2")
//
//trigger.onNext("X")
//
//subject.onNext("3")


    //MARK: - TakeWhile
//
//Observable.of(2,4,3,6,8,9,10)
//    .take(while: {
//        return $0 % 2 == 0
//    }).subscribe(onNext: {
//        print ($0)
//    }).disposed(by: disposeBag)

    //MARK: - Take
//
//Observable.of(1,2,3,5,9)
//    .take(4)
//    .subscribe(onNext: {
//        print ($0)
//    }).disposed(by: disposeBag)

    //MARK: - SkipUntil
//let subject = PublishSubject<Int>()
//let trigger = PublishSubject<String>()
//
//subject.skip(until: trigger)
//    .subscribe(onNext: {
//        print ($0)
//    }).disposed(by: disposeBag)
//
//subject.onNext(8)
//subject.onNext(3)
//subject.onNext(5)
//
//trigger.onNext("X")
//
//subject.onNext(5)
//subject.onNext(3)
//subject.onNext(8)

    //MARK: - SkipWhile

//Observable.of(2,2,4,4,6,7,8,9,0,1,2,5)
//    .skip(while: {
//        return $0 % 2 == 0
//    }).subscribe(onNext: {
//        print ($0)
//    }).disposed(by: disposeBag)

    //MARK: - Skip

//Observable.of(1,2,3,3,4,5,6)
//    .skip(3)
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)

    //MARK: - Filter
//
//Observable.of(1,2,3,4,5,6,7)
//    .filter { $0 % 2 == 0}
//    .subscribe(onNext: {
//        print ($0)
//    }).disposed(by: disposeBag)

    //MARK: - Element At

//Observable.of(1,2,3,4,5,6,7,8,9)
//    .element(at: 4)
//    .subscribe(onNext: {
//        print ($0)
//    }).disposed(by: disposeBag)
//
//let subject = PublishSubject<String>()
//
//subject.element(at: 2)
//    .subscribe(onNext: { _ in
//        print ("You are out!")
//    }).disposed(by: disposeBag)
//
//subject.onNext("X")
//subject.onNext("Y")
//subject.onNext("K")

    //MARK: - Ignore
//let strikes = PublishSubject<String>()
//
//strikes
//    .ignoreElements()
//    .subscribe { _ in
//        print ("Subscription is called")
//    }.disposed(by: disposeBag)
//
//strikes.onNext("A")
//strikes.onNext("B")
//strikes.onNext("C")
//strikes.onNext("D")
//
//strikes.onCompleted()

    //MARK: - Array To
//
//Observable.of(1,2,3,4,5)
//    .toArray()
//    .subscribe {
//        print ($0)
//    }.disposed(by: disposeBag)

    //MARK: - Map
//
//Observable.of(1,2,3,4,5,6)
//    .map {
//        return $0 * 2
//    }.subscribe(onNext: {
//        print ($0)
//    }).disposed(by: disposeBag)

    //MARK: - Flat Map
//struct Student {
//    var score: BehaviorRelay<Int>
//}
//
//let john = Student(score: BehaviorRelay(value: 90))
//let mike = Student(score: BehaviorRelay(value: 80))
//let tom = Student(score: BehaviorRelay(value: 70))
//
//let student = PublishSubject<Student>()
//
//student.asObservable()
//    .flatMap { $0.score.asObservable() }
//    .subscribe(onNext: {
//        print ($0)
//    }).disposed(by: disposeBag)
//
//student.onNext(john)
//john.score.accept(50)
//john.score.accept(69)
//student.onNext(mike)
//mike.score.accept(40)
//student.onNext(tom)

    //MARK: - Flat Map Latest

//struct Student {
//    var score: BehaviorRelay<Int>
//}
//
//let john = Student(score: BehaviorRelay(value: 90))
//let mike = Student(score: BehaviorRelay(value: 80))
//let tom = Student(score: BehaviorRelay(value: 70))
//
//let student = PublishSubject<Student>()
//
//student.asObservable()
//    .flatMapLatest { $0.score.asObservable() }
//    .subscribe(onNext: {
//        print ($0)
//    }).disposed(by: disposeBag)
//
//student.onNext(john)
//john.score.accept(50)
//john.score.accept(69)
//student.onNext(mike)
//mike.score.accept(40)
//student.onNext(tom)




