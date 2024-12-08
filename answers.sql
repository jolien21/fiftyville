--Find City = NEW YORK CITY
SELECT city FROM airports WHERE id IN
  (SELECT destination_airport_id FROM flights 
   WHERE year = 2023 AND day = 29 AND month = 7 AND hour < 12 AND (id IN
    (SELECT flight_id FROM passengers WHERE passengers.passport_number IN
      (SELECT passport_number FROM people WHERE phone_number IN 
        (SELECT caller FROM phone_calls 
         WHERE year = 2023 AND day = 28 AND month = 7 AND duration < 60 AND (caller IN 
          (SELECT phone_number From people WHERE id IN
            (SELECT person_id FROM bank_accounts WHERE account_number IN
              (SELECT account_number FROM atm_transactions
               WHERE year = 2023 AND day = 28 AND month = 7 AND atm_location = 'Leggett Street' AND (account_number IN
                (SELECT account_number FROM bank_accounts WHERE person_id IN
                  (SELECT id FROM people WHERE people.license_plate IN
                    (SELECT license_plate FROM bakery_security_logs 
                     WHERE day = 28 AND month = 7 AND year = 2023 AND hour = 10 AND minute BETWEEN 15 AND 25
)))))))))))));


--Find thief = BRUCE
SELECT name FROM people WHERE license_plate IN
  (SELECT license_plate FROM bakery_security_logs
   WHERE day = 28 AND month = 7 AND year = 2023 AND hour = 10 AND minute BETWEEN 15 AND 25 AND license_plate IN
     (SELECT license_plate FROM people WHERE id IN
       (SELECT person_id FROM bank_accounts WHERE account_number IN
         (SELECT account_number FROM atm_transactions 
          WHERE year = 2023 AND day =28 AND month = 7 AND atm_location ='Leggett Street' AND (account_number IN
            (SELECT account_number FROM bank_accounts WHERE person_id IN
              (SELECT id FROM people WHERE phone_number IN
                (SELECT caller FROM phone_calls 
                 WHERE day = 28 AND year = 2023 AND month = 7 AND duration < 60 and (caller IN
                   (SELECT phone_number FROM people WHERE passport_number IN
                      (SELECT passport_number FROM passengers WHERE flight_id IN
                        (SELECT id FROM flights 
                         WHERE year = 2023 AND day = 29 AND month = 7 AND hour < 12 AND (id IN
                            (SELECT flight_id FROM passengers WHERE passengers.passport_number IN
                              (SELECT passport_number FROM people WHERE phone_number IN 
                                (SELECT caller FROM phone_calls 
                                 WHERE year = 2023 AND day = 28 AND month = 7 AND duration < 60 AND (caller IN 
                                    (SELECT phone_number From people WHERE id IN
                                        (SELECT person_id FROM bank_accounts WHERE account_number IN
                                          (SELECT account_number FROM atm_transactions
                                           WHERE year = 2023 AND day = 28 AND month = 7 AND atm_location = 'Leggett Street' AND (account_number IN
                                              (SELECT account_number FROM bank_accounts WHERE person_id IN
                                                  (SELECT id FROM people WHERE people.license_plate IN
                                                    (SELECT license_plate FROM bakery_security_logs 
                                                     WHERE day = 28 AND month = 7 AND year = 2023 AND hour = 10 AND minute BETWEEN 15 AND 25
))))))))))))))))))))))));


--find accomplice = ROBIN
SELECT name FROM people WHERE phone_number IN (
  SELECT receiver FROM phone_calls WHERE year = 2023 AND day = 28 AND month = 7 AND duration < 60 AND caller IN (
    SELECT phone_number FROM people WHERE name = 'Bruce'
));
