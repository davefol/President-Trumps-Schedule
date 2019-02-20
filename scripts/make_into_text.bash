./scripts/pdftotext ./data/trump_schedule.pdf - | sed "s/`echo -e '\xE2\x80\x8B'`//g" >./data/trump_schedule.txt
