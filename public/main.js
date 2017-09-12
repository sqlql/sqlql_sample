sub = new Rx.Subject();
sub.do(console.log).subscribe();
sub.onNext('Hello, world');

function hoge() {
    sub.onNext('hoge');
}
