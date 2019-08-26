def consolidate_cart(cart)
  c_cart = {}
  cart.map do |item|
    if c_cart[item.keys[0]]
      c_cart[item.keys[0]][:count] += 1
    else
      c_cart[item.keys[0]] = {
        count: 1,
        price: item.values[0][:price],
        clearance: item.values[0][:clearance]
      }
    end
  end
  c_cart
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    if cart.keys.include? coupon[:item]
      if cart[coupon[:item]][:count] >= coupon[:num]
        new_name = "#{coupon[:item]} W/COUPON"
        if cart[new_name]
          cart[new_name][:count] += coupon[:num]
        else
          cart[new_name] = {
            count: coupon[:num],
            price: coupon[:cost]/coupon[:num],
            clearance: cart[coupon[:item]][:clearance]
          }
        end
        cart[coupon[:item]][:count] -= coupon[:num]
      end
    end
  end
  cart
end

def apply_clearance(cart)
  cart.keys.each do |clear|
    if cart[clear][:clearance]==true
      cart[clear][:price]=0.80*cart[clear][:price].round(2)
    end
  end
    cart
end

def checkout(cart, coupons)
  # code here
end
