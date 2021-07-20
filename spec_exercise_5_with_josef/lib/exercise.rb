require "byebug"

def zip(*arr)
    
    # Compare all arrs and make sure that the length are the same
    # if false, return false
    # if true, return arr and transpose

    # zipped = Array.new(arr.length) { Array.new(3, nil) }


    #     [][]    => 

    # arr.length = 2
    # arr.first.length = 3
    
    zipped = Array.new(*arr.first.length) { Array.new([]) }

    arr.each_with_index do |sub_arr, i| # 0
        sub_arr.each_with_index do |ele, i2| #0
            zipped[i2] << ele
        end 

    end

    zipped

end

# def zip(*arrays)
#     debugger
#     length = arrays.first.length #                              #
#     (0...length).map do |i| # creates [idx0] [idx1] [idx2]
#         arrays.map { |array| array[i] }  #shovel in idx0, next index then shoveling into [idx1]
#     debugger
#     end
# end


# check if each arr comes out true for exacty one of the procs
# use .select
# if yes, create a new art with that

def prizz_proc(arr, prc1, prc2)
    arr.select { |ele| !(prc1.call(ele) && prc2.call(ele)) && (prc1.call(ele) || prc2.call(ele)) }
end





def zany_zip(*arr)

    # sorted = arr.sort_by(&:length)

    # arr_max_length = sorted[-1].length
   
#     arr.each do |sub_arr|   #iterating thru subA
#         sub_arr.each_with_index do |ele, idx|   #if less than max length, add nil on end
#             if idx < arr_max_length
#                 sub_arr << nil
#             else 
#                 sub_arr
#         end
        
#     end


#    sub_arr.transpose
   

    # two_arr = Array.new(arr_max_length) { Array.new(arr.length, nil) }        #gives us subA

    # arr.each_with_index do |sub_arr, i| # 0
    #     sub_arr.each_with_index do |ele, i2| #0
    #         two_arr[i2][i] = ele
    #     end
    # end

    # two_arr


    sorted = arr.sort_by(&:length)

    arr_max_length = sorted[-1].length
   

    two_arr = Array.new(arr_max_length){ Array.new(arr.length, nil) }  #gives us subA

    arr.each_with_index do |sub_arr, i| # 0
        sub_arr.each_with_index do |ele, i2| #1
            two_arr[i2][i] = ele
        end
    end
    two_arr

end






# def zany_zip(*arrs)
#     two_arr = Array.new(arr_max_length) { Array.new(arr.length, nil) }

#     arr.each_with_index do |sub_arr, i| 
#         sub_arr.each_with_index do |ele, i2|
#             two_arr[i2][i].unshift(ele)
#         end
#     end

#     two_arr
# end

# array_1 = ['a', 'b', 'c'] 
# array_2 = [1, 2, 3] 
# array_3 = [11, 13, 15, 17] }
# array_4 = ['v', 'w', 'x', 'y', 'z']


def compress(str)
    
    i = 0
    new_str = ""

    while i < str.length
        if str[i] == str[i + 1]
            new_str += str[i] + num_char(str, i).to_s
            i += num_char(str, i)
        else 
            new_str += str[i]
            i += 1   
        end
    end

    new_str

end


def num_char(word, i)

    count = 1

    while word[i] == word[i + count] #&& ((i - 1) < word.length)
        count += 1
    end

    count

    
end


p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"
