---
layout: post
status: publish
published: publish
title: PostFix and SMTP
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 597
wordpress_url: http://misterblue.com/wwpp/archives/20050705-postfix-and-smtp
date: 2005-07-05 04:31:57
categories:
- Blogroll


---
<p>
I recently changed the MPA on my server from sendmail to postfix.
The only problem I had was configuring my mail relay -- my relay requires me to log
in.  How to do this in postfix?  The answer is not obvious and not explained.
In coming SMTP connections are covered extensivily but not out going.
</p>
<p>
After many hours of Googling, I came across 
<a href="http://www.numlock.ch/">Daniel Mettler</a>'s
<a href="http://www.numlock.ch/news/archives/000438.html">
Postfix outgoing/outbound SMTP authentication for smtp.hispeed.ch/cablecom.c
</a>.
Here he gives the secret which I shamelessly copy here for my own future edification.
</p>
<p>
Add to your <code>/etc/postfix/main.cf</code> file:
<pre>
relayhost = mail.your-relay.net
smtp_sasl_auth_enable = yes
smtp_sasl_mechanism_filter = plain
smtp_use_tls = no
smtp_sasl_password_maps = hash:/etc/postfix/sasl_password_outgoing_smtp
smtp_sasl_security_options = noanonymous
</pre>
where <code>mail.your-relay.net</code> is the name of your relay host computer.
This instructs that the mail relay is using sasl logins and the credentials are in the 
specified file.
</p>
<p>
Then, create <code>/etc/postfix/sasl_password_outgoing_smtp</code> containing:
<pre>
mail.your-relay.net login:password
</pre>
where <code>mail.your-relay.net</code> is your relay host,
<code>login</code> is your login account name and
<code>password</code> is the password for your account.
Then, has the file (creates
<code>/etc/postfix/sasl_password_outgoing_smtp.db</code>)
and have postfix reload it's parameters:
<pre>
/usr/sbin/posthash /etc/postfix/sasl_password_outgoing_smtp
/usr/sbin/postfix reload
</pre>
</p>
<p>
Viola, it works!!
</p>
