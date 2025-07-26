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

formula = (var(:x) + var(:y)) * var(:z)

def permute_formula(formula)
  variables = get_variables(formula)
  permutations = permute_variables(variables)
  permutations.map do |perm|
    [perm, formula.evaluate(perm)]
  end.to_h
end

P, Q, R = var(:P), var(:Q), var(:R)

p permute_formula(!(P + (Q * R))) == permute_formula(!P * (!Q + !R))
p permute_formula(!(P * (Q + R))) == permute_formula(!P + (!Q + !R))
