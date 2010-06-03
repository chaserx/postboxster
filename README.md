# PostBoxster

Another useless project. Ahem, I mean:

An experiment in *Receiving* and *Processing* email with Rails on the Heroku and SendGrid services. 

## Setup

Add into your repository: 

1) .gems file

right_aws --version '2.0.0'  
paperclip --version '2.1.2'  
will_paginate --version '2.3.11'  


====

2) configuration yml files (see example files)

* s3.yml
* passwords_config.yml

## Tutorial

http://nanceskitchen.com/2010/02/21/accept-incoming-emails-into-a-heroku-app-using-sendgrid/

Very helpful. Attribution: the method for receiving email comes from the code presented in this post. 


## Notes

1. Setup DNS including MX records

2. Get Heroku config information

3. Setup incoming email parser for SendGrid using Heroku config login info and the URL for incoming email method



## License
&copy; 2010 Chase Southard

Released under the MIT license