module RomanNumeralizer

  def self.execute(arguments)
    cli_arg_needed = arguments.empty?
    print_usage_and_exit if cli_arg_needed

    number_to_convert = arguments[0].to_i
    print_usage_and_exit if !convertible?(number_to_convert)

    puts "#{number_to_convert} -> #{to_numerals(number_to_convert)}"
  end

  private

  def self.convertible?(number_to_convert)
    number_to_convert >= 1
  end

  def self.to_numerals(number_to_convert)
    case number_to_convert
    when 1..3
      "I" * number_to_convert  
    when 4,9
      modifier = 1
      "#{to_numerals(modifier)}#{to_numerals(number_to_convert + modifier)}"
    when 5
      "V"
    when 6..8
      "V#{to_numerals(number_to_convert - 5)}"
    when 10
      "X"
    end
  end

  def self.print_usage_and_exit
    puts "Usage: 'ruby roman-numerals/roman_numeralizer.rb NUMBER' where NUMBER is a positive integer"
    exit
  end

end

RomanNumeralizer.execute(ARGV)
