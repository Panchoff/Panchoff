*** Keywords ***
Basket Total Price Is Correct
    ${subtotal_basket}=  Get Text  ${subtotal_basket_page}
    ${subtotal_substring}=  remove_dollar_sign_from_price  ${subtotal_basket}
    ${shipping_basket}=  Get Text  ${shipping_basket_page}
    ${shipping_substring}=  remove_dollar_sign_from_price  ${shipping_basket}
    ${quantity}=  Get Value  ${qty_basket}
    ${total_basket}=  Get Text  ${total_basket_page}
    ${total_substring}=  remove_dollar_sign_from_price  ${total_basket}
    ${price_calculated}=  calculate_total  ${subtotal_substring}  ${quantity}  ${shipping_substring}
    Should Be Equal As Numbers  ${price_calculated}  ${total_substring}

I Finish The Checkout
    Location Should Be  ${ORDER_URL}
    Click Element  ${proceed_to_checkout_order_page}
    Location Should Be  ${ORDER_1_URL}
    Click Element  ${checkout_button_order_page1}
    Location Should Be  ${ORDER_URL}
    Select Checkbox  ${checkbox_order_page}
    Click Element  ${checkout_button_order_page2}

I Finish The Payment Process Without Checkoing Terms Of Service Checkbox
    Location Should Be  ${ORDER_URL}
    Click Element  ${proceed_to_checkout_order_page}
    Location Should Be  ${ORDER_1_URL}
    Click Element  ${checkout_button_order_page1}
    Location Should Be  ${ORDER_URL}
    Click Element  ${checkout_button_order_page2}

Pop Up Is Shown
    Wait Until Element Is Visible  ${pop_up_checkout}  timeout=None  error=None

I Am At The Payment Page
    Location Should Be  ${ORDER_SHIPPING}

I Finish The Payment Process
    Click Element  ${bankwire_payment_page}
    Click Element  ${submit_order_button}

The Order Is Done
    Wait Until Location Contains  ${ORDER_DONE}  timeout=None  message=None

I Am At The Basket
    Location Should Be  ${ORDER_URL}

I Try To Login
    Click Element  ${proceed_to_checkout_order_page}
    Input Text  ${email_auth_page}  ${KMAIL}
    Input Text  ${password_auth_page}  ${WPASSWORD}
    Click Element  ${submit_login_auth_page}

A Proper Error Is Shown
    Element Should Be Visible  ${alert_auth_page}








