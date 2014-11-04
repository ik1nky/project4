#
# InfixPostfix class contains methods for infix to postfix conversion and
# postfix expression evaluation.
#
class InfixPostfix
  
  # converts the infix expression string to postfix expression and returns it
  def infixToPostfix(exprStr)
	postfix = ""
	my_array = exprStr.split(" ") #Creates array from tokenized exprStr
	my_array.each do |token| #probably doesn't work
		if isLeftParen(token)
			my_array.unshift(token)
		elsif isOperator(token)
			while #(my_array.length > 0 && inputPrecedence(token) <= stackPrecedence(token))
				postfix += postfix + my_array.shift + " "
			end
		elsif isRightParen(token)
			while #something
				postfix += postfix + my_array.shift + " "
			end
			my_array.shift	#pop
		else #isOperand = true
			postfix += postfix + token + " "
		end
	end
	while #something
		postfix += postfix + my_array.shift + " "
	end
	return postfix
  end

  # evaluate the postfix string and returns the result
  def evaluatePostfix(exprStr)
	my_array = exprStr.split(" ")
	my_array.each do |token|  #Probably doesn't work
		if isOperator(token)
			y = my_array.shift #pop the top element
			x = my_array.shift 
			out = applyOperator(x,y,token)
			my_array.unshift(out)  #Possibly need .to_s
		else
			my_array.unshift(token)
		end	
	end
	return my_array.shift
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
	case operator
	when '+','-'
		return 1
	when '*','/','%'
		return 2
	when '^'
		return 4
	else
		return 5
	end
  end

  # applies the operators to num1 and num2 and returns the result
  def applyOperator(num1, num2, operator)
	case operator
	when '+'
		return num1+num2
	when '-'
		return num1-num2
	when '*'
		return num1*num2
	when '/'
		return num1/num2
	when '%'
		return num1%num2
	when '^'
		return num1**num2
	else
		return 0
	end
  end
  
end # end InfixPostfix class
