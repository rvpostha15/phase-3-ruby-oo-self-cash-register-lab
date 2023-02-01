require 'pry'
class CashRegister
    #class body
    attr_accessor :discount, :total, :title, :price, :quantity, :items, :new_item

    def initialize(discount = 0)
        self.total = 0
        self.discount = discount
        self.items = []
    end

    def add_item(title, price, quantity = 1)
        self.new_item = price * quantity
        self.total += self.new_item
        quantity.times { self.items << title }
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else 
            percent = (100 - discount.to_f) / 100
            self.total = (self.total * percent).to_i
            "After the discount, the total comes to $#{self.total}."
        end
    end
    def void_last_transaction
        self.total -= self.new_item
    end
end

now = CashRegister.new(discount = 20)
now.total = 1000
# binding.pry