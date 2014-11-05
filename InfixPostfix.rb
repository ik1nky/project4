#
# InfixPostfix class contains methods for infix to postfix conversion and
# postfix expression evaluation.
#
class InfixPostfix
  
  # converts the infix expression string to postfix expression and returns it
  def infixToPostfix(exprStr)
	postfix = ""
	my_array = exprStr.split(' ') #Creates array from tokenized exprStr
	my_array.each do |token| 
		if leftParen?(token)
			my_array.push(token)
		elsif operator?(token)
			while (my_array.length > 0 && stackPrecedence(my_array.last) > inputPrecedence(token))
				postfix += postfix + my_array.pop + " "
			end
		elsif rightParen?(token)
			while !leftParen?(my_array.last)
				postfix += postfix + my_array.pop + " "
			end
			my_array.pop	#pop
		else #isOperand = true
			postfix += postfix + token + " "
		end
	end
	while my_array.length > 0
		postfix += postfix + my_array.pop + " "
	end
	return postfix
  end

  # evaluate the postfix string and returns the result
  def evaluatePostfix(exprStr)
	my_array = exprStr.split(" ")
	my_array.each do |token|  #Probably doesn't work
		if operator?(token)
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

ip = InfixPostfix.new()
while true do
  #ip = InfixPostfix.new()
  puts "(1) Convert Infix to Postfix Expression"
  puts "(2) Evaluate Postfix Expression"
  puts "(3) Quit"
  puts 'Enter selection (1, 2, 3): '
  selection = gets.chomp
  if selection == "1"
    puts "Enter Infix Expression: "
    puts ip.infixToPostfix(gets).to_s

    #puts "#{infix.first}"
    #puts "#{infix.last}"
  elsif selection == "2"
    puts "2!!"
  elsif selection == "3"
    exit
  else
    puts "Unknown selection: " + selection
  end
end
