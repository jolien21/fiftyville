-- Keep a log of any SQL queries you execute as you solve the mystery

-- look in crimescene reports for information about the crime
SELECT description FROM crime_scene_reports 
  WHERE year = 2023 AND month = 7 AND day = 28;

-- look for the tree witnesses and find their interviews
  SELECT name, transcript FROM interviews 
     WHERE year = 2023 AND day = 2 AND month = 7;

-- look security logs between 10,15 and 10.25
  SELECT license_plate, hour, minute, ativity FROM bakery_security_logs
    WHERE day = 28 AND year = 2023 AND month = 7 AND hour = 10 AND minute BETWEEN 15 AND 25;

-- look for the names of the people exiting between 10.15 and 10.25SELECT license_plate, name FROM people WHERE people.license_plate IN 
  SELECT id FROM people WHERE people.license_plate IN 
    (SELECT license_plate FROM bakery_security_logs 
      WHERE day = 28 AND year =2023 AND month = 7 AND hour = 10 AND minute BETWEEN 15 AND 25);

--look if those people have a bankaccount
  SELECT account_number FROM bank_accounts WHERE person_id IN
    (SELECT id FROM people WHERE people.license_plate IN
      (SELECT license_plate FROM bakery_security_logs
        WHERE day = 28 AND month = 7 AND year = 2023 AND hour = 10 AND minute BETWEEN 15 AND 25));

--look if those people withdrew monty earlier that day
SELECT account_number FROM atm_transactions WHERE (account_number IN 
  (SELECT account_number FROM bank_accounts WHERE person_id IN 
    (SELECT id FROM people WHERE people.license_plate IN 
      (SELECT license_plate FROM bakery_security_logs
        WHERE day = 28 AND month = 7 AND year = 2023 AND hour = 10 AND minute BETWEEN 15 AND 25))))
   AND year = 2023 AND day = 28 AND month = 7 AND atm_location = 'Leggett Street' AND transaction_type = 'withdraw';

--lookup the names of those people
sqlite> SELECT person_id FROM bank_accounts WHERE account_number IN
   ...>   (SELECT account_number FROM atm_transactions
(x1...>     WHERE (account_number IN
(x2...>     (SELECT account_number FROM bank_accounts WHERE person_id IN
(x3...>        (SELECT id FROM people WHERE people.license_plate IN
(x4...>           (SELECT license_plate FROM bakery_security_logs
(x5...>              WHERE day = 28 AND month = 7 AND year = 2023 AND hour = 10 AND minute BETWEEN 15 AND 25))))
(x1...>    AND year = 2023 AND day = 28 AND month = 7 AND atm_location = 'Leggett Street');

--lookup those names
SELECT name FROM people WHERE id IN
   ...>   (SELECT person_id FROM bank_accounts WHERE account_number IN
(x1...>     (SELECT account_number FROM atm_transactions
(x2...>      WHERE (account_number IN
(x3...>        (SELECT account_number FROM bank_accounts WHERE person_id IN
(x4...>           (SELECT id FROM people WHERE people.license_plate IN
(x5...>              (SELECT license_plate FROM bakery_security_logs
(x6...>               WHERE day = 28 AND month = 7 AND year = 2023 AND hour = 10 AND minute BETWEEN 15 AND 25))))
(x2...>      AND year = 2023 AND day = 28 AND month = 7 AND atm_location = 'Leggett S
treet')
(x1...> )
   ...> ;

--Look if they called someone in the timeframe 
 SELECT caller, receiver FROM phone_calls
   ...> WHERE year = 2023 AND day = 28 AND 7 AND duration < 60 AND (caller IN
(x1...>   (SELECT phone_number FROM people WHERE id IN
(x2...>      (SELECT person_id FROM bank_accounts WHERE account_number IN
(x3...>         (SELECT account_number FROM atm_transactions WHERE (account_number IN
(x5...>           (SELECT account_number FROM bank_accounts WHERE person_id IN
(x6...>              (SELECT id FROM people WHERE people.license_plate IN
(x7...>                 (SELECT license_plate FROM bakery_security_logs
(x8...>                  WHERE day = 28 AND month = 7 AND year = 2023 AND hour = 10 AND minute BETWEEN 15 AND 25))))
(x4...>          AND year = 2023 AND day = 28 AND month = 7 AND atm_location = 'Leggett Street')
(x3...> )))
   ...> ;

--find the names of the callers and receivers

