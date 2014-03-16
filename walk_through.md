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

 # hey it returned an Enumerator object, I guess it worked and our work is done here

 # let's actually try and return all the characters uppercase

 my_instance.map {|char| char.upcase} 
 
 # => NoMethodError: undefined method `each' for #<MyClass:0x007fc5322a1a80 @collection="my string">
 # woooow, what did just happen there?!
```