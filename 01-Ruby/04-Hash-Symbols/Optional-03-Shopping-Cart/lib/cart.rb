# This file contains methods related to your shopping cart.
# You should complete it according to the instructions in the TODO comments

def add_to_cart(cart, product)
  # TODO: you get a cart and a product. Add the product to the cart!
  cart << product
end

def cart_to_s(cart)
  # TODO: you get a cart, return a coma-separated String list of the contained products
  cart.join(', ')
end

def cart_total_price(cart, store_items)
  # TODO: you get a cart and the store items with their prices. Return the total
  # price of the shopping cart
  sum = 0
  cart.each { |x| sum += store_items[x.to_sym] if store_items[x.to_sym]!= nil}
  sum
end
