#Include Enumerable in your class

###Description:

Sometimes you may wind up with a class in ruby that acts kinda like a container (like an array or hash) and you would wish to have all those nice methods that arrays have like `#map ` or `#select` or even `#inject`. These are some nice methods and you could totaly rewrite on your own methods to simulate the same behavior (this is a great way to learn how enumerable methods actually work), but after a while it get's anoying to have to reinvent the wheel everytime you need something like `select` and `map`. The good part is that those methods are separated in a module called Enumerable. Mixing in the module in your class is not exactly having `include Enumerable` kind of thing. It needs a bit more setup before all those methods are going to work properly. 

In this tutorial I will try to walk you through the steps of mixing in the Enumerable module into your class.


