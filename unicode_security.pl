/*  Part of SWI-Prolog

    Author:        Jan Wielemaker
    E-mail:        jan@swi-prolog.org
    WWW:           https://www.swi-prolog.org
    Copyright (c)  2026, SWI-Prolog Solutions b.v.
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions
    are met:

    1. Redistributions of source code must retain the above copyright
       notice, this list of conditions and the following disclaimer.

    2. Redistributions in binary form must reproduce the above copyright
       notice, this list of conditions and the following disclaimer in
       the documentation and/or other materials provided with the
       distribution.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
    FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
    COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
    BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
    LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
    ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
    POSSIBILITY OF SUCH DAMAGE.
*/

:- module(unicode_security,
          [ unicode_script/2,             % +Code, -Script
            unicode_script_extensions/2,  % +Code, -Scripts
            unicode_identifier_status/2,  % +Code, -Status
            unicode_identifier_type/2,    % +Code, -Types

            unicode_skeleton/2,           % +Text, -Skeleton
            unicode_confusable/2,         % +T1, +T2
            unicode_confusable/3,         % +T1, +T2, +Options

            unicode_resolved_scripts/2,   % +Text, -Scripts
            unicode_restriction_level/2   % +Text, -Level
          ]).
:- use_foreign_library(foreign(unicode_security4pl)).

/** <module> Unicode security helpers (UTS #39, UAX #24)

This library implements helpers from
[UTS #39 (Unicode Security Mechanisms)](https://www.unicode.org/reports/tr39/)
and the script properties of [UAX #24](https://www.unicode.org/reports/tr24/):
confusable skeletons, mixed-script detection, and identifier restriction
levels.

It is independent from `library(unicode)`: that module wraps libutf8proc
for normalization and per-codepoint properties; this one ships its own
UCD-derived tables built from the files under
`packages/utf8proc/data/`.  See `etc/gen_uts39.pl` to regenerate.
*/
