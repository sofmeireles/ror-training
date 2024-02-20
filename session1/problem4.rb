#first approach with O(n²)...
def prob4_1(nums)
    answer = []
    aux_array = Hash.new {|h,k| h[k]= Array.new(nums)}

    nums.each_with_index do |num, i|
        aux_array[i].delete_at(i) 
    end

    aux_array.each do |i, num|
        answer.push(num.inject(:*))
    end
    answer
end


#second approach with O(n²)...
def prob4_2(nums)
    answer = []
    aux_array = {}
    array_size = nums.size() 

    nums.each_with_index do |num, i|
        left = nums[0...(i)]
        right = nums[(i+1)..array_size]
        aux_array[i] = left + right
    end

    aux_array.each do |i, num|
        answer.push(num.inject(:*))
    end
    answer
end

#third approach with help from gpt and artur de coimbra :)
def prob4(nums)
    n = nums.size
    left = Array.new(n, 1)
    right = Array.new(n, 1)

    for i in 1...n
        left[i] = nums[i - 1] * left[i - 1]
    end

    for i in (n - 2).downto(0)
        right[i] = nums[i + 1] * right[i + 1]
    end

    result = []
    for i in 0...n
        result[i] = left[i] * right[i]
    end

    result
end



puts "#{prob4([-1,1,0,-3,3])}"