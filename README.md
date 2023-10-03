# README

## Background

This is a demo web app to explore how we might enable users to save and view their results in one place after completing multiple embedded/external forms - which could be a potential feature for https://www.getaheatpump.org.uk/.

The current site is developed using Webflow and uses the form builder Tally to provide interactive quizes to users on multiple pages. It's also possible this site will need to interface with other external servics/APIs (e.g. to provide users with a cost estimation for a heat pump installation).

The challenge currently is that these various external services (e.g. Tally web forms; cost estmation API; etc) don't talk to each other, meaning users often have to input the same information multiple times and can't see their results all in one place.

> **Insight from user research** - Some participants cite desire to save or view their results in one place after going through the site (through email or as a summary).

This demo applicatin was developed in approx 4 hrs and is not intended to be production quality code but should suffice in demonstrating the viability of the approach.

## Approach taken

Summary of user journey and approach used in this demo...

1. Visit our custom web app.
2. Navigate to a page with an embedded external form (provided by Tally).
3. Login to proceed.
4. Redirected back to page with embedded external form (user identifier passed on via hidden field in Tally).
5. Submit embedded external form.
6. Webhook triggered by external web form and form data recieved/processed/saved in our custom web app and reconciled with user account.
7. Page updated with results.

![Demo of user journey](docs/images/demo.gif)

The following changes need to be made on Tally in order for this approach to work...

1. Webhook - The webhook integration needs to be added and configured in Tally to point to `https://<url-for-hosted-demo-app>/webhooks/new-response`.
2. Reconciliation - A hidden `user_email` field needs to be added to the Tally form.
3. Calculated fields - Caculated fields need to be returned rather than displaying results in the Tally form.

This approach can be repeated for multiple external web forms & adding API integrations to others services should also be reasonably straightforward.

There is possible a slight user experience trade off when it comes to requiring login, thought this could be managed with good design and added functionality we would be able to provide (e.g. saving results). In addition, monitoring user progress would be easier.

It should be noted however that the approach of embedding externally hosted interactive elements (e.g. Tally forms) developed in a no/low code tools is somewhat brittle. Meaning that it can be easy to introduce bugs into the form logic and hard to spot that they are there. Similarly, replacing these no/low code interactive elements with embedding custom built interactive elements could introduce an undue amount of architectural complexity if these elements are standalone services (i.e. a distributed system architecture). This added architectural complexity is likely not proportionate to the maturity of development of product and tech capacity we'd have (i.e. more complex architectures generally require more tech capacity as there are more moving parts). Thus there is an overall inclination to suggest a 'monolitic' architecture (i.e. all the code in one app) likely using a full-stack web-app framework, should a more sophisticated set of features be required for this product.

If it is decided that a more sophisticated product is required then software engineering capacity will be required as we would likely need to replace the current Webflow site with a coded web app.

If useful, possible next steps for this demo could include...

- Further developing the prototype to reflect an ideal user journey & functionality (e.g. reducing duplicate data entry; adding email features; etc).
- Trying alternative approaches to allow saving of results.
