*** Settings ***
Resource        ${EXECDIR}/main.robot
Test Setup     Open Chrome To Storefront
Test Teardown  Close Browser


*** Test Cases ***
Scenario Successful Registration Of A Customer
    Given I Am Registering A Customer
    And I Am Entering Valid Information
    Then The Registration Is Successful

Full Positive Scenario
    Given I Am Logged In
    And I Am Opening A PDP
    When I Navigate To Checkout
    Then There Is a Success Message
    When I Am At The Basket
    Then Basket Total Price Is Correct
    When I Finish The Checkout
    Then I Am At The Payment Page
    When I Finish The Payment Process
    Then The Order Is Done

Unchecked Terms Of Service
    Given I Am Logged In
    And I Am Opening A PDP
    When I Navigate To Checkout
    Then There Is a Success Message
    When I Am At The Basket
    Then Basket Total Price Is Correct
    When I Finish The Payment Process Without Checkoing Terms Of Service Checkbox
    Then Pop Up Is Shown

Wrong User Login
    Given I Am Opening A PDP
    When I Navigate To Checkout
    Then There Is a Success Message
    When I Try To Login
    Then A Proper Error Is Shown






