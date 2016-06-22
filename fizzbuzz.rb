def fizzbuzz(start,lastnum)
  loop do
    if (start%15) ==0
      puts "FizzBuzz"
    elsif (start % 3) ==0
      puts "Fizz"
    elsif (start % 5) ==0
      puts "Buzz"
    end
    start += 1
  break if (start > lastnum)
  end
end
fizzbuzz(5,100)

=begin
var fizzbuzz = function() {
    for (x = 1; x<21; x++){
        if (x % 15){
            console.log("FizzBuzz");
            }
        else if (x % 3===0){
            console.log("Fizz");
            }
        else if (x % 5 ===0){
            console.log("Buzz");
            }
        else{
            console.log(x);
        }
    }
}
fizzbuzz();
=end
