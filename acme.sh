#!/bin/bash

source ./lib/firewall-tester || {
  echo "Could not load library, exiting..."
  exit 1
}

# ----- BEGIN TESTS -----

# From Acme Web Server to Acme App Server 
DEV && test_url web-dev-01.acme.com https://acmeapp-dev.acme.com
INT && test_url web-int-01.acme.com https://acmeapp-int.acme.com 
QA  && test_url web-qa-01.acme.com  https://acmeapp-qa.acme.com 
PRD && test_url web-prd-01.acme.com https://acmeapp-prd.acme.com 

# From Acme App Server to Acme DB Server
DEV && test_fw_full app-dev-01 acme-dev-db.acme.com 1521 
INT && test_fw_full app-int-01 acme-int-db.acme.com 1521 
QA  && test_fw_full app-qa-01  acme-qa-db.acme.com  1521 
PRD && test_fw_full app-prd-01 acme-prd-db.acme.com 1521

# ----- REPORT TEST RESULTS -----

report_results
[[ "$failCount" -gt "0" ]] && exit 1 || exit 0
