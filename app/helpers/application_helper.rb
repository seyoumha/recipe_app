module ApplicationHelper
  def units
    ["cup","oz","tbsp","tsp","pound","liter","slice","count"]
  end
  
  
  def float_to_fraction(amount)
   
    if amount == amount.floor
      amount
    else
      amount = amount.rationalize
        if amount < 1
          amount
        else
          whole_number = amount.truncate
          "#{whole_number} #{amount - whole_number}"
        end
    end
  end

  def alert_class name
    case name
    when :alert
      'alert-danger'
    when :notice
      'alert-success'
    else
      "alert-unknown"
    end
  end

end
