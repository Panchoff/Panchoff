*** Keywords ***

#Scenario 1 - You are on homepage, go to the search field, search for something, press enter, verify that products on the search results page are corresponding to the searched item;
I Am Searching For Something
    Input Text  ${top_search}  ${SUMMER}
    Press Keys 	${top_search}  RETURN

The proper products Are Shown
    Element Should Be Visible  ${grid}
    Wait Until Element Is Visible  ${product_count}  timeout=None  error=None

#Scenario 2 - You are on homepage, go to the meganav WOMEN section, hover over, and click on the blouses section, verify
#that products on the product listing page are corresponding to the category;I Am Opening The Women Section
I Am Opening The Blouses In Women Section
    Mouse Over  ${women_navbar}
    Click Element  ${blouses_navbar}

The Products Are Corresponding To The Category
    Element Should Be Visible  ${grid}
    Wait Until Element Is Visible  ${blouse}  timeout=None  error=None

#Scenario 3 - You are on homepage, you navigate to some product listing page, click on some product details page,
#set quantity to 2 and the size to M, add the product to the basket, verify there is a success message;
I Am Opening A PDP
    Mouse Over  ${women_navbar}
    Click Element  ${blouses_navbar}
    Element Should Be Visible  ${grid}
    Wait Until Element Is Visible  ${blouse}  timeout=None  error=None
    Click Element  ${blouse}
    Wait Until Element Is Visible  ${PDP_heading}  timeout=None  error=None


I Navigate To Checkout
    Click Element  ${plus_element_pdp}
    Click Element  ${plus_element_pdp}
    Click Element  ${plus_element_pdp}
    Select From List By Index   ${size_selector_pdp}    2
    Click Element  ${add_to_cart}

There Is a Success Message
    Wait Until Element Is Visible  ${proceed_to_checkout}  timeout=None  error=None
    Click Element  ${proceed_to_checkout}


