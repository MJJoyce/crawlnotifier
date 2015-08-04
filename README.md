# crawlnotifier

This script runs the nutch crawl and makes sure that it notifies the relevent users after the crawl has ended.
After the crawl it transfers the output folder of the crawl to local. It stores the satus in a file called bashout.txt and 
gives the path to it in the email.

USAGE:

sh nutchrun.sh /<url seedlist folder/> <output folder> <crawl rounds> <nutch home directory path>

eg:
sh nutchrun.sh urls_seedlist_folder_name output_folder_name 10 $NUTCH_HOME


ASSUMPTIONS and TWEAKS:

-can change the local directory where the output folder is copied by changing the following lines:
  OUTPUT_PATH="/mnt/var/lib/hadoop/local_data/"
  
-can change the email address from memex-jpl@googlegroups.com to anything else


