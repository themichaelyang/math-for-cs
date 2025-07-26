module LogicalOperators
  def +(formula)
    Or[self, formula]
  end

  def *(formula)
    And[self, formula]
  end

  def !@
    Not[self]
  end
end

class Variable < Struct.new(:name)
  include LogicalOperators

  def evaluate(values)
    if values.include?(name)
      values[name]
    else
      raise KeyError
    end
  end

  def inspect
    name.inspect
  end
end

class Operation < Array
  include LogicalOperators

  def evaluate
    raise NotImplementedError
  end

  def inspect
    "#{self.class.name}#{super}"
  end
end

class Unary < Operation
  def initialize(operand)
    super(operand)
  end
end

class And < Operation
  def evaluate(values)
    inner = self.map {|opr| opr.evaluate(values) }
    inner.all?
  end
end

class Or < Operation
  def evaluate(values)
    inner = self.map {|opr| opr.evaluate(values) }
    inner.any?
  end
end

class Not < Unary
  def evaluate(values)
    !self.first.evaluate(values)
  end
end

def get_variables(formula)
  case formula
  when Variable
    formula.name
  when Operation
    formula.flat_map do |element|
      get_variables(element)
    end.uniq
  end
end

def var(name)
  Variable.new(name)
end

def permute_variables(variables)
  current = variables.pop
  rest = variables

  if current.nil?
    [{}]
  else
    permute_variables(rest).flat_map do |permutation|
      [
        permutation.merge({current => true}),
        permutation.merge({current => false})
      ]
    end
  end
end

def permute_formula(formula)
  variables = get_variables(formula)
  permutations = permute_variables(variables)
  permutations.map do |perm|
    [perm, formula.evaluate(perm)]
  end.to_h
end

def truth_table(permutations)
  variables = permutations.first.first.keys

  rows = permutations.map do |perm|
    labeled_inputs, output = perm
    
    variables.map {|var| labeled_inputs[var]} + [output]
  end

  [variables + ['out']] + rows
end

def display_table(table)
  header = table.first.map do |col|
    col.to_s.ljust(5)
  end.join(" | ")

  row_content = table[1..-1]
  rows = row_content.map do |row|
    row.map {|entry| entry.to_s.ljust(5)}.join(" | ")
  end

  [header] + [[["-" * 5] * table.first.length].join("-+-")] + rows
end

P, Q, R = var(:P), var(:Q), var(:R)

a_left = !(P + (Q * R))
a_right = !P * (!Q + !R)
puts "Problem 2a: #{permute_formula(a_left) == permute_formula(a_right)}"

puts display_table(truth_table(permute_formula(a_left)))
puts
puts display_table(truth_table(permute_formula(a_right)))
puts

b_left = !(P * (Q + R))
b_right = !P + (!Q + !R)
puts "Problem 2b: #{permute_formula(b_left) == permute_formula(b_right)}"

puts display_table(truth_table(permute_formula(b_left)))
puts
puts display_table(truth_table(permute_formula(b_right)))