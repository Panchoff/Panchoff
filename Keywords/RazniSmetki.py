def remove_dollar_sign_from_price(price):
    return price[1:]

def calculate_total(subtotal, quantity, shipping):
    total = float(subtotal)*float(quantity) + float(shipping)
    return total
