class CashRegister
    attr_accessor :total
    attr_accessor :discount
    attr_accessor :quantity
    attr_accessor :title
    attr_accessor :items
    attr_accessor :last_item
    def initialize(discount=0)
        @total=0.00
        @discount=discount
        @items=[]
    end
    def add_item(title,price=0.00,quantity=1)
        self.total += price * quantity
        @quantity=quantity
        @title=title
        i=quantity
        while i >0
            @items.push(@title)
            i-=1
        end
        @last_item=price*quantity
            
    end
    def apply_discount
        if @discount==0
            "There is no discount to apply."
        else
            @total = @total - (@total / 100 * @discount)
            "After the discount, the total comes to $#{Integer(@total)}."
        end
    end
    def items
        @items
    end
    def void_last_transaction
        puts @items.length
        puts @last_item
        if @total - @last_item  == 0
            @total = 0.0
        else 
           @total= @total - @last_item 
           @items.pop
        end
    end


end
