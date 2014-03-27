class Array

  def my_each_with_index
    self.length.times do |index|    # times method yields an index starting from 0 and being incremented after each iteration
      yield self[index], index
    end
  end

  def my_each
    self.length.times do |index|    # times method yields an index starting from 0 and being incremented after each iteration
      yield self[index]
    end
    self    #each usually return self
  end

  def my_map
    container = []
    my_each{|element| container << (yield element)}
    container
  end


  def my_select
    container = []
    my_each do |element| 
      current = yield element
      container << element if current
    end
    container
  end

  def my_reduce(*args)
    if args.empty?
      cumulator = self[0]
    else
      given = true
      cumulator = args[0]
    end

    my_each_with_index do |element, index| 
      if given
        cumulator = yield cumulator, self[index]
      elsif index != 0 
        cumulator = yield cumulator, self[index]
      end
    end

    return cumulator
  end

end



# [1,2,3].my_each{|integer| puts"Integer is : #{integer}"}
p [1,2,3].my_map{|element| element*2}
p [1,2,3].my_select{|element| element%2 == 0}

p [1,2,3].my_reduce("something")

p [1,2,3].my_reduce(){|cumulator, n| cumulator + n }