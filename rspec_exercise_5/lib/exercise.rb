require "byebug"

# def zip(*arr)
#     zipped = Array.new(arr.first.length) { Array.new }
    
#     arr.each_with_index do |subarr, idx1| # 0, 0, 0 >> grabs ele
#         subarr.each_with_index do |ele, idx2| # 0, 1, 2 >> grabs subarr 
#             zipped[idx2] << ele
#         end
#     end

#     zipped
# end

def zip(*arr)
    zipped = Array.new(arr.first.length) { Array.new }

    arr_length = arr.length
    subarr_length = arr.first.length
    
    idx1 = 0
    while idx1 < arr_length # 0, 0, 0 >> ele

        idx2 = 0 
        while idx2 < subarr_length # 0, 1, 2 >> subarr 

            zipped[idx2] << arr[idx1][idx2]

            idx2 += 1
        end

        idx1 += 1
    end

    zipped
end

def prizz_proc(arr, prc1, prc2)
    arr.select { |ele| (prc1.call(ele) && !prc2.call(ele)) || (!prc1.call(ele) && prc2.call(ele))}
end

def zany_zip(*arr)
    sorted = arr.sort_by { |ele| ele.length}
    longest_subarr = sorted.last.length # 3
    arr_length = arr.length # 3

    zany_zipped = Array.new(longest_subarr) { Array.new(arr_length, nil) }

    arr.each_with_index do |subarr, idx1| # 0, 0, 0
        subarr.each_with_index do |ele, idx2| # 0, 1, 2
            zany_zipped[idx2][idx1] = ele
        end
    end

    zany_zipped
end

array_1 = ['a', 'b', 'c'] 
array_2 = [1, 2, 3] 
array_3 = [11, 13, 15, 17] 

# debugger
zany_zip(array_3, array_2, array_1)

def maximum
end