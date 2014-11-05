#
# InfixPostfix class contains methods for infix to postfix conversion and
# postfix expression evaluation.
#
class InfixPostfix
  # converts the infix expression string to postfix expression and returns it
  def infixToPostfix(exprStr)
    puts "exprStr " + exprStr
    postfix = Array.new()
    stack = Array.new()
    infix = exprStr.split(' ')
    infix.each do |x|
      if operator?(x)
        puts "OPERATOR!!! " + x + ' ' + stack.to_s
        if stack.length() > 0
          puts "we got stuff on our stack"
          while stack.length > 0 && (stackPrecedence(stack.last) >= inputPrecedence(x))
            puts "da fuck"
            postfix.push(stack.pop)
          end
        end
        stack.push(x)
        #puts postfix
      elsif rightParen?(x)
        puts "RIGHT PAREN!!! " + x + ' ' + stack.to_s
        while (stack.last != '(')
          postfix.push(stack.pop)
        end
        stack.pop
        #puts postfix
      elsif leftParen?(x)
        puts "LEFT PAREN!!! " + x + ' ' + stack.to_s
        stack.push(x)
      else
        puts "OPERAND!!! " + x + ' ' + stack.to_s
        postfix.push(x)
      end
    end

    while stack.size > 0
      postfix.push(stack.pop)
    end

    puts postfix.to_s
  end

  # evaluate the postfix string and returns the result
  def evaluatePostfix(exprStr)

  end

  private # subsequent methods are private methods

  # returns true if the input is an operator and false otherwise
  def operator?(str)
    if (str=='*' || str=='+' || str=='-' || str=='/' || str=='^' || str=='%')
      b=true
    else
      b=false
    end
  end

  # returns true if the input is an operand and false otherwise
  def operand?(str)

  end

  # returns true if the input is a left parenthesis and false otherwise
  def leftParen?(str)
    if (str=="(")
      b=true
    else
      b=false
    end
  end

  # returns true if the input is a right parenthesis and false otherwise
  def rightParen?(str)
    if (str==")")
      b=true
    else
      b=false
    end
  end

  # returns the stack precedence of the input operator
  def stackPrecedence(operator)
    if (operator == '+' || operator == '-')
      prec = 1
    elsif (operator == '*' || operator == '/' || operator == '%')
      prec = 2
    elsif (operator == '^')
      prec = 4
    else
      prec = 5
    end
  end

  # returns the input precedence of the input operator
  def inputPrecedence(operator)
    if (operator == '+' || operator == '-')
      prec = 1
    elsif (operator == '*' || operator == '/' || operator == '%')
      prec = 2
    elsif (operator == '^')
      prec = 3
    else
      prec = -1
    end
  end

  # applies the operators to num1 and num2 and returns the result
  def applyOperator(num1, num2, operator)

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
