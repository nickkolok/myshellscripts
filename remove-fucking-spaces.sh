#!/bin/bash
rename --verbose 's/\s\(1\)/___1/g' -- *\ \(1\).*
rename --verbose 's/[\s\!\(\)]/_/g' -- *

# Escape leading minus because it is treated as beginning of option list
rename --verbose 's/^-/_-/g' -- *
