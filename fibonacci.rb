def fib(n)
  return 0 if n == 0
  return 1 if n == 1
  fib(n - 1) + fib(n - 2)
end

def fib_iter(n)
  arr = [n]
  acc = 0
  loop do
    num = arr.pop

    if num == 0
    elsif num == 1
      acc += 1
    else
      arr.push num - 1, num - 2
    end

    break if arr.empty?
  end
  acc
end

p fib_iter(0) == 0
p fib_iter(1) == 1
p fib_iter(9) == 34
p fib_iter(12) == 144
