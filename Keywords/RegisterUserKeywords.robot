*** Keywords ***

I Am Registering A Customer
    Click Element  ${sign_in_button}
    Create Random Email
    Input Text  ${create_account_field_registration_page}  ${user_email}
    Click Element  ${create_account_button_registration_page}
    Location Should Be  ${REGISTER_URL}

I Am Entering Valid Information
#    Input Text  ${your_locator}  ${text, for example USER_NAME}
    Input Text  ${customer_firstname_registration_page}  ${FNAME}
    Input Text  ${customer_lastname_registration_page}  ${LNAME}
    Input Text  ${email_registration_page}  ${user_email}
    Input Text  ${password_registration_page}  ${PASS}
    Input Text  ${firstname_registration_page}  ${FNAME}
    Input Text  ${lastname_registration_page}  ${LNAME}
    Input Text  ${address_registration_page}  ${ADDRESS}
    Input Text  ${city_registration_page}  ${CITY}
    Click Element   ${state_registration_page}
    Select From List By Index   ${state_registration_page}   1
    Click Element   ${country_registration_page}
    Input Text  ${zip_registration_page}    ${ZIP}
    Select From List By Index   ${country_registration_page}    1
    Input Text  ${phone_mobile_registration_page}  ${MOBILE}
    Input Text  ${alias_registration_page}  ${ALIAS}
    Click Element  ${register_button_registration_page}

The Registration Is Successful
    Location Should Be  ${REGISTERED_URL}

I Am Entering Invalid Information
    Input Text  ${customer_firstname_registration_page}  ${FNAME}
    Input Text  ${customer_lastname_registration_page}  ${LNAME}
    Input Text  ${email_registration_page}  ${EMAIL2}
    Input Text  ${password_registration_page}  ${PASS2}
    Input Text  ${firstname_registration_page}  ${FNAME}
    Input Text  ${lastname_registration_page}  ${LNAME}
    Input Text  ${address_registration_page}  ${ADDRESS}
    Input Text  ${city_registration_page}  ${CITY}
    Click Element   ${state_registration_page}
    Select From List By Index   ${state_registration_page}   1
    Click Element   ${country_registration_page}
    Input Text  ${zip_registration_page}    ${ZIP}
    Select From List By Index   ${country_registration_page}    1
    Input Text  ${phone_mobile_registration_page}  ${MOBILE}
    Input Text  ${alias_registration_page}  ${ALIAS}
    Click Element  ${register_button_registration_page}

Then The Registration Is Not Successful
    Location Should Be  ${URL}
    Click Element  ${proceed_to_checkout}
