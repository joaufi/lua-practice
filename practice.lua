local function new_section()
  print("\n----- ----  ---   --    -\n")
end


weekdays = {"Sunday", "Monday", "Tuesday", "Wednesday",
            "Thursday", "Friday", "Saturday"}

-- Print each weekday
i = 1
while weekdays[i] do
    print(weekdays[i])
    i = i + 1
end

print("\n")

for i, weekday in ipairs(weekdays) do
  print(i .. " " .. weekday)
end

new_section()

-- variable scope practice

function my_func(a, b)
    -- 'a' and 'b' are local to this function and available through its scope

    do
        local x = 1
    end
    
    boo = "~breakdance fever~"

    print(x) --> nil. 'x' is not available outside the do-end scope
    print(foo) --> nil. 'foo' is declared after 'my_func'
    print(foo_global) --> "value 2"
end

local foo = "value 1"
foo_global = "value 2"

print(boo)
print(foo) --> "value 1". 'foo' is available in the topmost scope after declaration.
my_func(1, 2)
print(boo)

new_section()

-- function practice

function create_counter(x)
    -- 'x' is a local variable in 'create_counter'
    print(x)
    return function()
        x = x + 1
        return x
    end
end

count1 = create_counter(10)
count2 = create_counter(20)
print(count1()) --> 11
print(count2()) --> 21
print(count1()) --> 12
print(count2() .. count2(2))
print(x)

new_section()

-- coroutines

-- This is our coroutine
local function sequence(self)
    coroutine.yield(120)
    coroutine.yield(320)
    coroutine.yield(510)
    coroutine.yield(240)
    return 440 -- return the final value
end

co = coroutine.create(sequence)

local function update()
  print(coroutine.resume(co))
end

update()
update()
update()
update()
update()
update() -- interesting, returns a value of "cannot resume dead coroutine"
update()

new_section()

-- table practice

print(os.time())
local t = os.time()
local table = {}
for i=1,20 do
  table[i] = i
end
table["a"] = "something"
for k, v in pairs(table) do
  print(k, v)
end
other_table = {
  1,
  2,
  3,
  a = "b",
  5,
  6,
}
for k, v in pairs(other_table) do
  print(k, v)
end

print(os.time())
print((os.time() - t) * 1000)

-- DEBUG:SCRIPT: 0.40388
