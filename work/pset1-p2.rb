module LogicalOperators
  def +(formula)
    Or[self, formula]
  end

  def *(formula)
    And[self, formula]
  end

  def !@
    Not(self)
  end
end

class Variable < Struct.new(:name)
  include LogicalOperators

  def evaluate(values)
    if values.include?(@name)
      values[@name]
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
    !inner.evaluate(values)
  end
end

def get_variables(formula)
  case formula
  when Variable
    formula.name
  when Operation
    formula.flat_map do |element|
      get_variables(element)
    end
  end
end

def var(name)
  Variable.new(name)
end

formula = (var(:x) + var(:y)) * var(:z)
p formula


