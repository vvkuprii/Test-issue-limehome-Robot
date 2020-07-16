*** Settings ***
Documentation   This is a demonstration of RobotFramework
Library         SeleniumLibrary
Library         String
Suite Teardown  Suite shutdown
Resource        ../Resources/Locators/CheckInLocators.robot
Resource        ../Resources/Locators/BookingDetailsLocators.robot
Resource        ../Resources/Keywords/RetrieveYourBookingKeywords.robot

*** Variables ***
${URL}                  https://limehome-qa-task.herokuapp.com/
${BROWSER}              Chrome
${USER_LAST_NAME}       Test
${BOOKING_REFERENCE}    test1234
${BIRTH_DATE}           01/01/1999
${TYPE_OF_STAY}         Business

*** Test Cases ***
User should be able to retrieve booking info
    [Tags]  BOOKING
    ${random_string}=   Generate Random String                  6
    Open Retrieve Your Booking Page
    Fill Last Name on retrieving your booking page              ${USER_LAST_NAME}       ${random_string}
    Fill Booking Reference on retrieving your booking page      ${BOOKING_REFERENCE}    ${random_string}
    Submit Booking Reference form
    Assert booking details page                                 ${URL}                  ${random_string}    ${USER_LAST_NAME}   ${BOOKING_REFERENCE}
    Fill Date of birth on booking details page                  ${BIRTH_DATE}
    Select Type of Stay                                         ${TYPE_OF_STAY}
    Submit Booking details
    Assert Thank you page                                       ${URL}
    [Teardown]  Close Browser