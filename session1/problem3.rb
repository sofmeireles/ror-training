#this was my first approach (ugly)
def two_sum1(nums, target)
    scope = Array.new(nums)
    while scope.length > 0
        num = scope.first
        scope.shift
        scope.each do |number| 
            if number+num == target 
                first_index = nums.index(num)
                if number==num
                    nums.delete_at(first_index)
                    second_index = nums.index(number) + 1
                else
                    second_index = nums.index(number)
                end
                return [first_index, second_index]
            end
        end
    end
end

#second approach
def two_sum2(nums, target)
    num_indices = {}
    nums.each_with_index do |num, i|
        needed_number = target - num
        if num_indices.has_key?(needed_number)
            return [nums.index(needed_number), i]
        else
            num_indices[num] = i
        end
    end
    nil
end

#se nao existirem numeros repetidos
def two_sum3(nums, target)
    nums.each_with_index do |num, i|
        needed_number = target - num
        return [nums.index(needed_number), i] if nums.index(needed_number)
    end
    nil
end

puts "#{two_sum2([4,2,1,0],4)}"