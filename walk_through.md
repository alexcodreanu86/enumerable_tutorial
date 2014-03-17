### Short walkthrough:

Let's say that I have a class like `MyClass` and for this purpose it stores a bunch of characters into a container, in this case it is a string: 

```ruby
class MyClass
  include Enumerable
  attr_reader :collection
  def initialize(collection)
    @collection = collection
  end
end
 
 # let's say I want an instance of MyClass
 my_instance = MyClass.new("my string")   # => #<MyClass:0x007fc5322a1a80 @collection="my string">

 # let's try and call map on it
 my_instance.map # => #<Enumerator: #<MyClass:0x007fc5322a1a80 @collection="my string">:map>

 # hey it returned an Enumerator object, I guess it worked and our work here is done 

 # let's actually try and return all the characters uppercased

 my_instance.map {|char| char.upcase} 
 
 # => NoMethodError: undefined method `each' for #<MyClass:0x007fc5322a1a80 @collection="my string">
 # woooow, what did just happen there?!
```

So that didn't work out exactly as expected ... `undefined method 'each'`, what is that all about right?
Well the thing is that all the methods in enumerable use each to proccess perform their actions. But the enumerable doesn't have a method each and neither does our mighty class `MyClass`. So... The enumerable methods are expecting the class that mixes the module in to have a each class, and the rest of the methods will use that method to perform their duties. So let's see what does the `#each` method do in case of an array. In case of an array, the method iterates through the array and yields the element to a block. In the case of a hash the each method yields a key value pair to the block. In our, since our `@collection` is a container of characters we would want our each to return each character to the block. So let's try and implement that into our example: 

```ruby 

class MyClass
  include Enumerable
  attr_reader :collection
  
  def initialize(collection)
    @collection = collection
  end

  def each
    collection.length.times do |index|    # times method yields an index starting from 0 and being incremented after each iteration
      yield @collection[index]
    end
    self    #each usually return self
  end
end

# let's create my_instance again
my_instance = MyClass.new("my string")

my_instance.map {|char| char.upcase}   # => ["M", "Y", " ", "S", "T", "R", "I", "N", "G"]

# hey chekk this out it, worked :-)

my_instance.select{|char| char < "n"}  # => ["m", " ", "i", "g"]

my_instance.max  # => "y"
```
One little detail here to notice is that `#each` return `self` after yielding each element to the block.
As you can see many `Enumerable` methods return by default an array of elements. 
I hope this tutorial was helpful and if you have any questions, or suggestions on how to make this tutorial better please feel free to contact me: alex@alex.com.