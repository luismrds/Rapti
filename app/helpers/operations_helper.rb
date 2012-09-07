module OperationsHelper

Infinity = 1

# Para una operacion, dada una fecha. Calcula recursivamente su valor. 
#   toma cada operando y lo calcula recursivamente hasta que obtiene valores
#   en ambos operandos y ejecuta la operacion. 

  def calculateOperationValue(dateid)
    firstOperand = RawDatum.find(self.firstoperand)
    secondOperand = RawDatum.find(self.secondoperand)
    firstDatum = RawDataScore.find_by_scoredate_id_and_rawdata_id(dateid, firstOperand.id)
    secondDatum = RawDataScore.find_by_scoredate_id_and_rawdata_id(dateid, secondOperand.id)


    if !firstOperand.operation_id && !secondOperand.operation_id
        formula = firstDatum.value.to_s + self.operator + secondDatum.value.to_s
        puts self.name + " : " + formula 
        return eval(formula)
    end        
    if !firstOperand.operation_id && secondOperand.operation_id
        operacion2 = Operation.find(secondOperand.operation_id)
        formula = firstDatum.value.to_s + self.operator + operacion2.calculateOperationValue(dateid).to_s
        puts self.name + " : " + formula
        return eval(formula)
    end        
    if firstOperand.operation_id && !secondOperand.operation_id
        operation1 = Operation.find(firstOperand.operation_id)            
        formula = operation1.calculateOperationValue(dateid).to_s + self.operator + secondDatum.value.to_s
        puts self.name + " : " + formula 
        return eval(formula)
    end        
    if firstOperand.operation_id && secondOperand.operation_id
        operation1 = Operation.find(firstOperand.operation_id)
        operacion2 = Operation.find(secondOperand.operation_id)
        formula = operation1.calculateOperationValue(dateid).to_s + self.operator + operacion2.calculateOperationValue(dateid).to_s
        puts self.name + " : " + formula
        return eval(formula)
    end

  end

end
