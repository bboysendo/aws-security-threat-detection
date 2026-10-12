#!/bin/bash
# Sends one benign request and one with a classic SQL-injection pattern in
# the query string to a resource the Web ACL is associated with.
# Expected: benign request -> 200, SQLi-pattern request -> 403 (blocked).
#
# Usage: ./test-waf-rules.sh <protected-resource-url>
set -euo pipefail

TARGET="${1:?Usage: test-waf-rules.sh <protected-resource-url>}"

echo "== Benign request (expect 200) =="
curl -s -o /dev/null -w "HTTP %{http_code}\n" "${TARGET}/?search=hello"

echo
echo "== SQLi-pattern request (expect 403, blocked by AWSManagedRulesSQLiRuleSet) =="
curl -s -o /dev/null -w "HTTP %{http_code}\n" "${TARGET}/?search=' OR '1'='1"

echo
echo "If the second request did NOT return 403, confirm the Web ACL is actually"
echo "associated with this resource: aws wafv2 get-web-acl-for-resource --resource-arn <arn>"
