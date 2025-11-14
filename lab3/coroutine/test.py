def test(x):
    val = x
    for i in range(5):
        val = yield val
        print(val)
        val += 1

gen = test(1)
array = [gen.send(None)]
print(array)
while True:
    array.append(gen.send(array[-1]*10))
    print(array)