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

  def evaluate(binding)
    if binding.include?(name)
      binding[name]
    else
      raise KeyError.new("no such variable")
    end
  end

  def inspect
    name.inspect
  end
end

class TrueClass
  def evaluate(_binding); true; end
end

class FalseClass
  def evaluate(_binding); false; end
end

class Operation < Array
  include LogicalOperators

  def evaluate_inner(binding)
    self.map {|opr| opr.evaluate(binding) }
  end

  def evaluate
    raise NotImplementedError
  end

  def inspect
    "#{self.class.name}#{super}"
  end
end

class Unary < Operation
  def initialize(inner)
    super(inner)
  end
end

class Binary < Operation
  def initialize(left, right)
    super(left, right)
  end
end

class And < Operation
  def evaluate(binding)
    evaluate_inner(binding).all?
  end
end

class Or < Operation
  def evaluate(binding)
    evaluate_inner(binding).any?
  end
end

class Not < Unary
  def evaluate(binding)
    !(evaluate_inner(binding).first)
  end
end

class Nand < Operation
  def evaluate(binding)
    !(evaluate_inner(binding).all?)
  end
end

class Implies < Binary
  def evaluate(binding)
    left, right = evaluate_inner(binding)
    !(left && !right)
  end
end

def get_variables(formula)
  case formula
  when Variable
    formula.name
  when Operation
    formula.flat_map do |element|
      get_variables(element)
    end.uniq.compact
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

def permutation_table(permutations)
  variables = permutations.first.first.keys

  rows = permutations.map do |perm|
    labeled_inputs, output = perm
    
    variables.map {|var| labeled_inputs[var]} + [output]
  end

  [variables + ['out']] + rows
end

def format_table(table)
  header = table.first.map do |col|
    col.to_s.ljust(5)
  end.join(" | ")

  row_content = table[1..-1]
  rows = row_content.map do |row|
    row.map {|entry| entry.to_s.ljust(5)}.join(" | ")
  end

  [[header] + [[["-" * 5] * table.first.length].join("-+-")] + rows].join("\n")
end

def truth_table(formula)
  format_table(permutation_table(permute_formula(formula)))
end

P, Q, R = var(:P), var(:Q), var(:R)

def problem_2
  a_left = !(P + (Q * R))
  a_right = !P * (!Q + !R)
  puts "Problem 2a: #{permute_formula(a_left) == permute_formula(a_right)}"

  puts truth_table(a_left) + "\n\n"
  puts truth_table(a_right) + "\n\n"

  b_left = !(P * (Q + R))
  b_right = !P + (!Q + !R)
  puts "Problem 2b: #{permute_formula(b_left) == permute_formula(b_right)}"

  puts truth_table(b_left) + "\n\n"
  puts truth_table(b_right) + "\n\n"
end

A, B = var(:A), var(:B)

def problem_3
  # NAND(...) is NOT(AND(...)), so NOT(NOT(AND(...))) = AND(...)
  puts "Problem 3a, i): #{permute_formula(A * B) == permute_formula(!Nand[A, B])}"

  # NAND is only False when both are True, so NOTing each side means both sides to be False to be False.
  puts "Problem 3a, ii): #{permute_formula(A + B) == permute_formula(Nand[!A, !B])}"

  # Similar observation used for Implies, but Implies is only False when RHS is False, so we NOT it.
  puts "Problem 3a, iii): #{permute_formula(Implies[A, B]) == permute_formula(Nand[A, !B])}"
  # puts truth_table(Implies[A, B])

  puts "Problem 3b: #{permute_formula(!A) == permute_formula(Nand[A, A])}"

  # Force NAND inputs to be different and therefore True: Nand[A, !A] = true 
  # => Nand[A, Nand[A, A]] = true
  puts "Problem 3c, i): #{permute_formula(A + true) == permute_formula(Nand[A, Nand[A, A]])}"

  # Then we can construct NAND(True, True) = False using the above:
  puts "Problem 3c, ii): #{permute_formula(A * false) == permute_formula(Nand[Nand[A, Nand[A, A]], Nand[A, Nand[A, A]]])}"
end

problem_2
problem_3