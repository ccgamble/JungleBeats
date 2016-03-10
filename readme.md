### Jungle Beat

#### Description
This project uses linked lists to make a drum machine. A linked list models a collection of data as a series of "nodes" which link to one another in a chain. This was my first project, and it allowed me to get more familiar with Ruby while also learning about linked lists. 

#### Base Expectation
```ruby
require "./lib/jungle_beat"
> jb = JungleBeat.new("deep dep dep deep")
> jb.play
=> 4 # also plays the sounds
> jb.append("deep bop bop deep")
=> 4
> jb.all
=> "deep dep dep deep deep bop bop deep"
> jb.prepend("tee tee tee tee")
=> 4 # number of beats inserted
> jb.all
=> "tee tee tee tee deep dep dep deep deep bop bop deep"
> jb.include?("dep")
=> true
> jb.pop(4)
=> "deep bop bop deep"
> jb.all
=> "tee tee tee tee deep dep dep deep"
> jb.count
=> 8
> jb.insert(4, "boop bop bop boop")
=> "tee tee tee tee boop bop bop boop deep dep dep deep"
> jb.find(8, 2)
=> "deep dep"
```
#### Learning goals
- Practice breaking a program into logical components
- Distinguishing between classes and instances of those classes
- Understanding how linked lists work to store and find data
- Testing components in isolation and in combination
