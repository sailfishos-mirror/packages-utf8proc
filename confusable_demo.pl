/*  Part of SWI-Prolog

    Author:        Jan Wielemaker
    E-mail:        jan@swi-prolog.org
    WWW:           https://www.swi-prolog.org
    Copyright (c)  2026, SWI-Prolog Solutions b.v.

    This file is **deliberately** confusing.  It is a fixture for
    library(unicode_security)'s confusable-identifier linter
    (list_confusable_identifiers/0); the code is valid Prolog but is
    semantically nonsense.  Loading it from a normal program is not
    useful — see test_uts39.pl, suite uts39_check_integration.
*/

:- module(confusable_demo,
          [ paypal/1,
            pаypal/1,      %#  Cyrillic а (U+0430) — look-alike of Latin a
            helloΩ/1,      %#  Latin + Greek Omega — moderately restrictive
            中文/1,         %#  Pure Han — single-script, should NOT warn
            hello/1        %#  Pure ASCII — should NOT warn
          ]).
:- encoding(utf8).

paypal(_).
pаypal(_).
helloΩ(_).
中文(_).
hello(_).
