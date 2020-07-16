*** Variables ***
${BOOKING_DETAILS_HEADER}                   css = .registration-form .header
${BOOKING_DETAILS_BIRTH_DATE}               css = input[ng-reflect-mat-datepicker='[object Object]']
${TYPE_OF_STAY_DROP_DOWN}                   xpath = //div[@class='mat-form-field-infix' and descendant::mat-label[contains(., 'Type of Stay')]]//div[@class='mat-select-arrow']
${SUBMITBOOKING_DETAILS_BTN}                css = .right button .mat-button-wrapper
${THANK_YOU_HEADER}                         css = .section-title
${CUSTOMER_SUPPORT_HEADER}                  xpath = //*[@class='section-title' and normalize-space(.)='Customer Support']
${BOOKING_REFERENCE_FROM_DETAILS_PAGE}      xpath = (//div[@class='value departure-date'])[2]
${USER_LAST_NAME_FROM_DETAILS_PAGE}         xpath = //div[@class='mat-form-field-flex' and descendant::*[@class='ng-star-inserted' and normalize-space(.)='Last Name']]//input