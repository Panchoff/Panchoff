*** Settings ***
Resource        ${EXECDIR}/main.robot
Test Setup     Open Chrome To Storefront
Test Teardown  Close Browser


*** Test Cases ***

Scenario Search For Item
    Given I Am on the homepage
    And I Am Searching For Something
    Then The proper products Are Shown

Scenario Verify Products
    Given I Am on the homepage
    And I Am Opening The Blouses In Women Section
    Then The Products Are Corresponding To The Category

Scenario Add Item To Basket
    Given I Am on the homepage
    And I Am Opening A PDP
    When I Am Setting QTY & Size And Adding The Products To The Basket
    Then There Is a Success Message