# require include benchmark gem (require for measure(), include for anything else)
# https://github.com/ruby/benchmark
require 'benchmark'
include 'benchmark'

test_array = [{name: "Ralph", occupation: "Web Developer"}, {name: "Julie", occupation: "Therapist"}, {name: "Jennifer", occupation: "Doctor"}, {name: "Jack", occupation: "Server"}, {name: "Brian", occupation: "Chef"}]


def test_function1(arr)
  puts arr.map{|v| v[:occupation]}
  return arr.map{|v| v[:occupation]}
end

def test_function2(arr)
  puts arr.map{|v| v[:occupation]}
  return arr.map{|v| v.fetch(:occupation)}
end



# Measure how long it takes to run test_function1
Benchmark.measure{test_function(test_array)}



# Measure how long it takes to run test_function1 AND test_function2 (good for comparison)
Benchmark.bm do |benchmark|
  # first method for comparison
  benchmark.report("selector") do  # label
    10000.times do  # perform 10000 iterations
      test_function1(test_array)  # method to test
    end
  end

  # second method for comparison
  benchmark.report("fetch") do
    10000.times do
      test_function2(test_array)  # method to test
    end
  end
end