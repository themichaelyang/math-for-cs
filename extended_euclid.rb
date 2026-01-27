def euclid(a, b)
  return euclid(b, a) if b > a
  return a if b == 0
  r = a % b
  euclid(b, r)
end

def ext_euclid(a, b)
  return ext_euclid(b, a) if b > a
  pulverize(a, b, 1, 0, 0, 1)
end

# x = xs * a + xt * b
# y = ys * a + yt * b
def pulverize(x, y, xs, xt, ys, yt)
  return [xs, xt] if y == 0
  r = x % y
  q = x / y
  pulverize(y, r, ys, yt, xs - q * ys, xt - q * yt)
end

class Testing
  def self.assert(actual, expected)
    @@assertions ||= 0
    @@assertions += 1

    if actual == expected
      puts "[PASS] Case #{@@assertions} passed!"
    else
      raise "[FAIL] Case #{@@assertions} failed: #{actual} != expected: #{expected}"
    end
  end
end

def test_ext_euclid(a, b)
  s, t = ext_euclid(a, b)
  gcd = euclid(a, b)
  Testing.assert(s * a + t * b, gcd)
end

Testing.assert(euclid(8, 4), 4)
Testing.assert(euclid(4, 8), 4)
Testing.assert(euclid(4, 4), 4)
Testing.assert(euclid(3, 4), 1)
Testing.assert(euclid(8, 12), 4)
Testing.assert(euclid(12, 8), 4)

test_ext_euclid(8, 4)
test_ext_euclid(12, 8)
