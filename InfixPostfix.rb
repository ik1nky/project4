#
# InfixPostfix class contains methods for infix to postfix conversion and
# postfix expression evaluation.
#
class InfixPostfix
  
  # converts the infix expression string to postfix expression and returns it
  def infixToPostfix(exprStr)
	my_array = exprStr.split(" ") #Creates array from tokenized exprStr
	
  end

  # evaluate the postfix string and returns the result
  def evaluatePostfix(exprStr)

  end

  private # subsequent methods are private methods

  # returns true if the input is an operator and false otherwise
  def operator?(str)
  	case str
	when '+','-','*','/','%','^','('
		return true
	else
		return false
	end 
  end

  # returns true if the input is an operand and false otherwise
  def operand?(str)
	return false
  end

  # returns true if the input is a left parenthesis and false otherwise
  def leftParen?(str)
	case str
	when '('
		return true
	else
		return false
	end
  end

  # returns true if the input is a right parenthesis and false otherwise
  def rightParen?(str)
	case str
	when ')'
		return true
	else
		return false
	end
  end

  # returns the stack precedence of the input operator
  def stackPrecedence(operator)
	case operator
	when '+','-'
		return 1
	when '*','/','%'
		return 2
	when '^'
		return 3
	else
		return -1
	end
  end

  # returns the input precedence of the input operator
  def inputPrecedence(operator)

  end

  # applies the operators to num1 and num2 and returns the result
  def applyOperator(num1, num2, operator)

  end
  
end # end InfixPostfix class
