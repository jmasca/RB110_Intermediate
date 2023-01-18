<h1 align="center">Practice Problems: Methods and More Methods</h1>

<br>

---

<h3 align="center">Practice Problem 1</h3>

---

What is the return value of the `#select` method below?

Why?

```ruby
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
```

The return value of `#select` will be: `[1, 2, 3]`

- The block will take its last executed line and return it to the `#select` method.

- The `#select` method will then test this line for "truthiness."

- Since `'hi'` is going to return a truthy value every time, all elements will pass as truthy.

- The elements that pass as truthy will then be selected and added to a new array.

- In this case, all elements are passing as truthy, so all elements will be selected and added to the new array.

- Therefore, the return value, the new array, will contain all elements from the original array `[1, 2, 3]`.

<br>

---

<h3 align="center">Practice Problem 2</h3>

---

How does `#count` treat the block's return value?

How can we find out?

```ruby
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
```

To find out how `#count` treats the block's return value, we should look at the Ruby Documentation.

- We can look at `Enumerable#count` or `Array#count`.

- What the documentation says:
  
  > With a block given, calls the block with each element and returns the number of elements for which the block returns a truthy value.
  
  - So, if the block returns a truthy value, it will be counted by the `#count` method.
  
  - After all iterations, the total truthy count will be returned. `=> 2` (in our example above).

- Therefore, `#count` considers the *truthiness* of the block's return value.

<br>

---

<h3 align="center">Practice Problem 3</h3>

---

What is the return value of `#reject` in the following code?

Why?

```ruby
[1, 2, 3].reject do |num|
  puts num
end
```

The return value of `#reject` will be: `[1, 2, 3]`

- In the Ruby Documentation for `Array#reject` it says:
  
  > Returns a new Array whose elements are all those from `self` for which the block returns `false` or `nil`.

- So, if the block returns `false` or `nil` for the current element, the element is added to a new array.
  
  - `#puts` is always going to return `nil`.
  
  - Therefore, every iteration of the block will return `nil` and the element will be added to a new array.
  
  - The return value will be every element from the original collection `[1, 2, 3]`.

<br>

---

<h3 align="center">Practice Problem 4</h3>

---

What is the return value of `#each_with_object` in the following code?

Why?

```ruby
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
```

The return value of `#each_with_object` will be: `{"a"=>"ant", "b"=>"bear", "c"=>"cat"}`

- Ruby Documentation says:
  
  > Calls the block once for each element, passing both the element and the given object.

- So, each element is going to be passed to the block and be represented by `value`.
  
  - We've also passed an empty Hash to the block as `hash`.
  
  - We're going to assign the current value (the current element) to `hash`.
    
    - The key to the element will be the first letter of the current value / current element.
      
      - `[value[0]]` on the first iteration would be `'ant'[0]`, which is `"a"`.
    
    - Therefore, the key `'a'` will be assigned the value `'ant'`. {"a"=>"ant"}
  
  - This continues through every element in the original collection.

- Then, it'll return the new object that's been created `{"a"=>"ant", "b"=>"bear", "c"=>"cat"}`.

<br>

---

<h3 align="center">Practice Problem 5</h3>

---

What does `#shift` do in the following code?

How can we find out?

```ruby
hash = { a: 'ant', b: 'bear' }
hash.shift
```

To understand what `#shift` does to the code we can look at the Ruby Documentation.

- What the documentation says:
  
  > Removes the first hash entry and returns a 2-element Array containing the removed key and value.

- So, the first entry will be removed from the hash:
  
  - `a: 'ant'`
  
  - Then, a 2-element Array containing the removed key and value will be created / returned.
  
  - `[:a, 'ant']`

- This is a destructive method, which means the original collection will be mutated.
  
  - `hash` is now `{:b=>"bear"}`

<br>

---

<h3 align="center">Practice Problem 6</h3>

---

What is the return value of the following statement?

Why?

```ruby
['ant', 'bear', 'caterpillar'].pop.size
```

The return value will be: `11`

- This is an example of method chaining.
  
  - The first method, `#pop`, is going to remove the last/trailing element from the array.
    
    - Note: There are no arguments passed to `#pop` in this scenario.
  
  - Thus, the return value from `#pop` will be `"caterpillar"`.
  
  - The method chained to `#pop` is `#size`.
    
    - Therefore, `#size` will be called on `"caterpillar"`.
      
      - `#size` will return the count of characters of the string its called on, `"caterpillar"`.
      
      - `11` will be returned.

- Note: `#pop` is a destructive method and will mutate the array its called on, `["ant", "bear"]`.

<br>

---

<h3 align="center">Practice Problem 7</h3>

---

What is the **block**'s return value in the following code?

How is it determined?

Also, what is the return value of `#any?` in this code and what does it output?

```ruby
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
```

The return value of the block will be a **boolean** value:

- `#odd?` returns `true` if the integer its called on is an odd number, and `false` otherwise.
  
  - Therefore, only a **boolean** value can be returned by the block.

The return value of `#any?` will be: `true`

- To determine this return value we can look at the Ruby Documentation for `Array#any?` which says:
  
  > calls the block with each element in `self`.
  > 
  > returns `true` if the block returns any truthy value.
  
  - This means, if ***any*** of the iterations return `true`, then `#any?` will return `true`.

- We know that the value of the last expression will be what's returned by a block. So, `num.odd?`:
  
  - `#odd?` would return `true` twice, on `1` and `3`.
  
  - `true` would thus be returned to `#any?`
  
  - However, after the first iteration on `1`, as soon as `true` is returned to `#any?`, it short-circuits.
    
    - Short-circuiting is the stoppage of execution as soon as the truth value has been determined.
    
    - `#any?` only needs one iteration to return `true` in order to become `true`.
    
    - Therefore, `#any?` will be returned a `true` and then it'll return a `true`, itself.

The output will be:

```shellsession
1
```

- The output will only show `1` since the block stopped iterating after `#any?` was found to be `true`.

<br>

---

<h3 align="center">Practice Problem 8</h3>

---

How does `#take` work?

Is it destructive?

How can we find out?

```ruby
arr = [1, 2, 3, 4, 5]
arr.take(2)
```

To find out how `#take` works and whether it's destructive, we use the Ruby Documentation for `Array#take`.

The documentation says:

- `Array#take`
  
  - This method takes one argument, `n`.
  
  - `n` represents a non-negative integer.
  
  - a new Array is created containing the first `n` elements of the collection it's called on.
  
  - The new Array is returned.
  
  - Does not modify self.
    
    - This means `#take` is a *non-destructive* method.
    
    - The original collection will remain untouched / unmodified.
      
      - This can also be verified in irb.

<br>

---

<h3 align="center">Practice Problem 9</h3>

---

What is the return value of `#map` in the following code?

Why?

```ruby
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```

The return value of `#map` will be: `[nil, "bear"]`

- To understand why, we need to start by looking at the documentation for `Enumerable#map`:
  
  - `#map` will return an array of objects.
  
  - The array will consist of the objects returned by the block.
    
    - Each iteration will add something to the new array.

- Knowing what we know about `Enumerable#map` now, we can understand the return value:
  
  - After the first iteration, the `if` evaluates to `false` and `value` is never reached.
    
    - When an `if` is `false` in this way, the `if` returns `nil`.
      
      - `nil` is then the first element added to the new array.
  
  - After the second / last iteration, the `if` evaluates to `true`.
    
    - `value` is the last expression executed, so `value` is returned from the block.
      
      - In this case, `value` represented `"bear"`.
      
      - `"bear"` is added as the second element of the new array.
  
  - Now that all iterations have completed, the new array is returned, `[nil, "bear"]`.

<br>

---

<h3 align="center">Practice Problem 10</h3>

---

What is the return value of the following code?

Why?

```ruby
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
```

The return value will be: `[1, nil, nil]`

- `puts` will always return `nil`.

- `#map` will always add something to a new array.
  
  - When the `if` executes, `nil` will be returned from the block and added to the new array.
  
  - When the `else` executes, `num` will be returned from the block and added to the new array.
    
    - iteration 1: `if` is `false`, `else` is executed, and `1` is returned / added to the new array.
    
    - iteration 2, 3: `if` is `true`, `if` is executed, and `nil` is returned / added to the new array.
  
  - The result of these 3 iterations is the return value `[1, nil, nil]`.

<br>

---

#### Key Things to Think About

- How does the method treat the block's return value?

- What is the return value of the method?

- How can you use the Ruby docs to learn more about a method?

- Is the method destructive
