*** Keywords ***
                ###     OPEN    BROWSER     ###

Open Chrome To Storefront
    Create Webdriver      Chrome
    Go To   ${STOREFRONT_URL}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}\

Open Chrome To Headless
   ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
   ${prefs} =    Create Dictionary    download.default_directory=${EXECDIR}
   Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}
   Call Method    ${chrome_options}    add_argument    --headless
   Call Method    ${chrome_options}    add_argument    --disable-gpu
   Call Method    ${chrome_options}    add_argument    --incognito
   Call Method    ${chrome_options}    add_argument     ${LEVEL}
   ${options}=     Call Method     ${chrome_options}    to_capabilities
   Log  ${options}
   Open Browser    ${STOREFRONT_URL}   browser=chrome     desired_capabilities=${options}
   Set Window Size    1920    1080
   Set Selenium Speed    ${DELAY}

#Important!!!
Create Random Email
    ${user_email_part_1}=  Generate Random String  ${NUMBER_8}  [LOWER]
    ${user_email}=  Catenate  SEPARATOR=  ${user_email_part_1}  ${user_email_part_2}
    Set Global Variable   ${user_email}

I Am on the homepage
    Location Should Be  ${STOREFRONT_URL}

I Am Logged In
    Click Element  ${sign_in_button}
    Input Text  ${email_login_page}  ${KMAIL}
    Input Text  ${password_login_page}  ${KPASSWORD}
    Click Element  ${submit_login}
