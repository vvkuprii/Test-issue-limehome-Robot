*** Keywords ***
Suite shutdown
    Close All Browsers

Open Retrieve Your Booking Page
    Open Browser        ${URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be     Online check-in | Limehome

Fill Last Name on retrieving your booking page
    [Arguments]     ${user_last_name}   ${random_string}
    Input Text      ${LAST_NAME_INPUT_FIELD}    ${user_last_name}_${random_string}

Fill Booking Reference on retrieving your booking page
    [Arguments]     ${booking_reference}    ${random_string}
    Input Text      ${BOOKING_REFERENCE_INPUT_FIELD}    ${booking_reference}_${random_string}

Submit Booking Reference form
    Wait Until Element Is Visible   ${RETREVE_BOOKING_SUBMIT_BTN}     5s
    Click Element                   ${RETREVE_BOOKING_SUBMIT_BTN}

Assert booking details page
    [Arguments]     ${url}    ${random_string}    ${user_last_name}   ${booking_reference}
    Wait Until Element Is Visible   ${BOOKING_DETAILS_HEADER}                   5s
    Element Text Should Be          ${BOOKING_DETAILS_HEADER}                   Your booking details.
    ${current_url} =                Execute Javascript                          return window.location.href;
    Should Contain                  ${current_url}                              ${url}registrationForm/${booking_reference}_${random_string}/${user_last_name}_${random_string}
    Element Text Should Be          ${BOOKING_REFERENCE_FROM_DETAILS_PAGE}      ${booking_reference}_${random_string}
    ${user_last_name_from_page}=    Get Value                                   ${USER_LAST_NAME_FROM_DETAILS_PAGE}
    Should Be Equal                 ${user_last_name_from_page}                 ${user_last_name}_${random_string}

Fill Date of birth on booking details page
    [Arguments]     ${birth_date}
    Wait Until Element Is Visible   ${BOOKING_DETAILS_BIRTH_DATE}       5s
    Input Text                      ${BOOKING_DETAILS_BIRTH_DATE}       ${birth_date}

Select Type of Stay
    [Arguments]                     ${type_of_stay}
    Page Should Contain Element     ${TYPE_OF_STAY_DROP_DOWN}       5s
    Mouse over                      ${CUSTOMER_SUPPORT_HEADER}
    Wait Until Element Is Visible   ${CUSTOMER_SUPPORT_HEADER}      5s
    Click Element                   ${TYPE_OF_STAY_DROP_DOWN}
    Wait Until Element Is Visible   ${BOOKING_DETAILS_HEADER}       5s
    ${type_of_stay_option}          Set Variable                    xpath = //*[@class='mat-option-text' and normalize-space(.)='${type_of_stay}']
    Wait Until Element Is Visible   ${type_of_stay_option}          5s
    Mouse Down                      ${type_of_stay_option}
    Click Element                   ${type_of_stay_option}

Submit Booking details
    Page Should Contain Element     ${SUBMITBOOKING_DETAILS_BTN}    5s
    Mouse over                      ${SUBMITBOOKING_DETAILS_BTN}
    Wait Until Element Is Visible   ${SUBMITBOOKING_DETAILS_BTN}    5s
    Click Element                   ${SUBMITBOOKING_DETAILS_BTN}

Assert Thank you page
    [Arguments]                     ${url}
    Wait Until Element Is Visible   ${THANK_YOU_HEADER}     5s
    Element Text Should Be          ${THANK_YOU_HEADER}     Thank you.
    ${current_url} =                Execute Javascript      return window.location.href;
    Should Contain                  ${current_url}          ${url}complete