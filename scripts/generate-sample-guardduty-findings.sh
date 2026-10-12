#!/bin/bash
# Generates SAMPLE GuardDuty findings using AWS's own, official, safe API for
# this purpose. No real suspicious activity occurs — these findings are
# clearly marked as samples in the console.
#
# Usage: ./generate-sample-guardduty-findings.sh
set -euo pipefail

DETECTOR_ID=$(aws guardduty list-detectors --query 'DetectorIds[0]' --output text)

if [ -z "$DETECTOR_ID" ] || [ "$DETECTOR_ID" = "None" ]; then
  echo "No GuardDuty detector found — run 'terraform apply' in terraform/ first."
  exit 1
fi

echo "Generating sample findings for detector ${DETECTOR_ID}..."
aws guardduty create-sample-findings --detector-id "$DETECTOR_ID"

echo
echo "Done. Open the GuardDuty console — you should see findings tagged as samples"
echo "(e.g. 'Backdoor:EC2/C&CActivity.B!DNS') within a few minutes."
