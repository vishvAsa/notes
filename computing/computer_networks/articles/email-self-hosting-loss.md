+++
title = "Email self hosting loss"
+++

Source: [TW](After self-hosting my email for twenty-three years I have thrown in the towel. The oligopoly has won. )



After self-hosting my email for twenty-three years I have thrown in the towel. The oligopoly has won.

September 04, 2022 — Carlos Fenollosa

Many companies have been trying to disrupt email by making it proprietary. So far, they have failed. Email keeps being an open protocol. Hurray?

No hurray. Email is not _distributed_ anymore. You just cannot create another first-class node of this network.

**Email is now an oligopoly, a service gatekept by a few big companies which does not follow the principles of net neutrality.**

I have been self-hosting my email since I got my first broadband connection at home in 1999. I absolutely loved having a personal web+email server at home, paid extra for a static IP and a real router so people could connect from the outside. I felt like a first-class citizen of the Internet and I learned so much.

Over time I realized that residential IP blocks were banned on most servers. I moved my email server to a VPS. No luck. I quickly understood that **self-hosting email was a lost cause**. Nevertheless, I have been fighting back out of pure spite, obstinacy, and activism. In other words, because it was the right thing to do.

But my emails are just not delivered anymore. I might as well not have an email server.

So, starting today, the MX records of my personal domain no longer point to the IP of my personal server. They now point to one of the Big Email Providers.

I lost. We lost. One cannot reliably deploy independent email servers.

**This is unethical, discriminatory and uncompetitive.**

\*Record scratch\*  
\*Freeze frame\*

Wait, _uncompetitive?_

Please bear with me. We will be there in a minute.

First, some basics for people who may not be familiar with the issue.

## This doesn't only affect contrarian nerds

No need to trust my word. Google has half a billion results for "[my email goes directly to spam](https://www.google.com/search?q=my+email+goes+directly+to+spam)".  Search any technical forum on the internet and you will find plenty of legitimate people complaining that their emails are not delivered.

What's the usual answer from experienced sysadmins? _"Stop self-hosting your email and pay \[provider\]."_

Having to pay Big Tech to ensure deliverability is unfair, especially since lots of sites self-host their emails for multiple reasons; one if which is cost.

Newsletters from my alumni organization go to spam. Medical appointments from my doctor who has a self-hosted server with a patient intranet go to spam. Important withdrawal alerts from my bank go to spam. Purchase receipts from e-commerces go to spam. Email notifications to users of my company's SaaS go to spam.

**You can no longer set up postfix to manage transactional emails for your business**. The emails just go to spam or disappear.

## One strike and you're out. For the rest of your life.

Hey, I understand spam is a thing. I've managed an email server for twenty-three years. My spamassassin database contains almost one hundred thousand entries.

Everybody receives hundreds of spam emails per day. Fortunately, email servers run bayesian filtering algorithms which protect you and most spam doesn't reach your inbox.

Unfortunately, the computing power required to filter millions of emails per minute is huge. That's why the email industry has chosen a _shortcut_ to reduce that cost.

**The shortcut is to avoid processing some email altogether.**

Selected email does not either get bounced nor go to spam. That would need _processing_, which costs _money_.

Selected email is **deleted as it is received**. This is called **blackholing** or **hellbanning**.

Which email is selected, though?

_Who knows?_

Big email servers **permanently blacklist whole IP blocks** and delete their emails without processing or without notice. Some of those blacklists are public, some are not.

When you investigate the issue they give you instructions with false hopes to fix deliverability. "Do as you're told and everything will be fine".

It will not.

I implemented all the acronyms, secured antispam measures, verified my domain, made sure my server is neither breached nor used to relay actual spam, added new servers with supposedly clean IPs from reputable providers, tried all the silver bullets recommended by Hacker News, used kafkaesque request forms to prove legitimity, contacted the admins of some blacklists.

Please believe me. My current email server IP has been managed by me and used exclusively for my personal email with _zero spam, zero_, for the last ten years.

Nothing worked.

Maybe ten years of legitimate usage are not enough to establish a reputation?

My online community [SDF](https://sdf.org) was founded in 1987, _four years before Tim Berners Lee invented the web_. They are so old that their FAQ still refers to email as "[Arpanet email](https://sdf.org/?faq?EMAIL?01)". Guess what? Emails from SDF don't reach Big Tech servers. I'm positive that the beards of their admins are grayer than mine and they will have tried to tweak every nook and cranny available.

## What are we left with?

You cannot set up a home email server.

You cannot set it up on a VPS.

You cannot set it up on your own datacenter.

At some point your IP range is bound to be banned, either by one asshole IP neighbor sending spam, one of your users being pwned, due to arbitrary reasons, by mistake, it doesn't matter. It's not _if_, it's _when_. Say goodbye to your email. Game over. No recourse.

The era of distributed, independent email servers is over.

## Email deliverability is deliberately nerfed by Big Tech

_Deliberately?_

Yes. I think we (they) can do better, but we (they) have decided not to.

Hellbanning everybody except for other big email providers is lazy and conveniently dishonest. It uses spam as a scapegoat to nerf deliverability and stifle competition.

Nowadays, **if you want to build services on top of email, you have to pay** an email sending API which has been blessed by others in the industry. One of _them_.

This concept may sound familiar to you. It's called a **racket**.

It's only a matter of time that regulators realize that internet email is a for-profit oligopoly. And we should avoid that.[^1]

The industry must self-establish clear rules which are harsh on spammers but give everybody a fair chance.

## A simple proposal where everybody wins

Again, I understand spam is a problem which cannot be ignored. But let's do better.

We already have the technology in place but **the industry has no incentives to move in this direction**. Nobody is making a great fuss when small servers are being discriminated against, so they don't care.

But I believe the risk of facing external regulation should be a big enough incentive.

I'm not asking for a revolution. Please hear my simple proposal out:

- **Let's keep antispam measures.** Of course. Continue using filters and crowdsourced/AI signals to reinforce the outputs of those algorithms.
- **Change blacklisting protocols so they are not permanent and use an exponential cooldown penalty.** After spam is detected from an IP, it should be banned for, say, ten minutes. Then, a day. A week. A month, and so on. This discourages spammers from reusing IPs after the ban is lifted and will allow the IP pool to be cleaned over time by legitimate owners.
- **Blacklists should not include whole IP blocks.** I am not responsible for what my IP neighbor is doing with their server.
- **Stop blackholing.** No need to bounce every email, which adds overhead, but please send a daily notification to postmaster alerting them.
- **There should be a recourse for legitimate servers.** I'm not asking for a blank check. I don't mind doing some paperwork or paying a fee to prove I'm legit. Spammers will not do that, and if they do, they will get blacklisted anyways after sending more spam.

These changes are very minor, they mostly keep the status quo, and have almost no cost. Except for the last item, all the others require no human overhead and can be implemented by just tweaking the current policies and algorithms.

## Email discrimination is not only unethical; it's a risk for the industry

Big Tech companies are under serious scrutiny and being asked to provide interoperability between closed silos such as instant messaging and social networks.

Well, email usage is [fifteen points](https://www.statista.com/statistics/183910/internet-activities-of-us-users/) above social networking.

Talk about missing the forest for the trees. Nobody noticed the irony of _regulating things that matter less than email._

Right now institutions don't talk about regulating email simply because they take it for granted, but it's not.

In many countries politicians are forced to deploy their own email servers for security and confidentiality reasons. **We only need one politician's emails not delivered due to poorly implemented or arbitrary hellbans and this will be a hot button issue.**

We are all experiencing what happened when politicians regulated the web. I hope you are enjoying your cookie modals; browsing the web in 2022 is an absolute hell.

What would they do with email?

The industry should fix email interoperability before politicians do. We will all win.

* * *

[^1]: Hey, I get it. Surely my little conspiracy theory is exaggerated. Some guy on Hacker News will tell me that they work as a SRE on Gmail and that I'm super wrong and that there are 100% legit reasons as to why things are this way. Okay. Do something for me, will you? Please unread this last section, I retract it. I just needed to get it out of my system. Thanks for indulging me. Done? Good. Everything else above is a fact. Email in 2022 is anti-competitive. The Gmail guy can go explain himself to the US Senate or the European Commission. 

