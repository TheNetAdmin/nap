# HotCrp COI Matching

1. Download a html copy of HotCrp submission site
2. Parse the html file with command `python3 extract_pc.py hotcrp.html hotcrp.txt`,
   this generates a list of PC members
3. Download a list of coi file, each line in format `FirstName SecondName (Affiliation)`
4. Compare the conference PC members with coi `python3 compare_pc.py hotcrp.txt coi.txt`
