#Extendig Strig class to alow ruby-string-calculate
#
# Source: https://github.com/theodorton/ruby-string-calculate
#

class String
  def calculate
    [:+, :-, :*, :/].each do |op|
      factors = self.split(op.to_s)
      return factors.map(&:calculate).inject(op) if factors.size > 1
    end
    to_f # No calculation needed
  end
  alias calc calculate
end
