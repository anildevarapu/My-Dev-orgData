<opensmsconfig>
<gateways>
<gateway id="nexmo" htmlfilename="nexmo" isactive="true" isdefault="true" bulksmsposturl="https://rest.nexmo.com/sms/json" bulksmstolist="noneed" limit="100" credentials="apiKey=$apiKey$;apiSecret=$apiSecret$;From=$From$" smsposturl="https://rest.nexmo.com/sms/json" smstolist="NoNeed" separator="," signupurl="https://dashboard.nexmo.com/sign-in"/>
<gateway id="beepsend" htmlfilename="beepsend" isactive="true" isdefault="true" bulksmsposturl="https://api.beepsend.com/2/sms/" bulksmstolist="noneed" limit="100" credentials="token=$token$;from=$from$" smsposturl="https://api.beepsend.com/2/sms/" smstolist="NoNeed" separator="," signupurl="http://signup.beepsend.com/"/>
<gateway id="twilio" htmlfilename="twilio" isactive="true" isdefault="true" bulksmsposturl="https://api.twilio.com/" bulksmstolist="noneed" limit="100" credentials="accountId=$accountId$;token=$token$;From=$From$;DEFAULT_VERSION=2010-04-01;VERSION=3.2.0" smsposturl="https://api.twilio.com/" smstolist="NoNeed" separator="," signupurl="https://www.twilio.com/try-twilio"/>
<gateway id="smsglobal" htmlfilename="smsglobal" isactive="true" isdefault="true" bulksmsposturl="https://www.smsglobal.com/http-api.php" bulksmstolist="noneed" limit="100" credentials="action=sendsms;user=$user$;password=$password$;from=$from$" smsposturl="https://www.smsglobal.com/http-api.php" smstolist="NoNeed" separator="," signupurl="https://www.smsglobal.com"/>
</gateways>
<countrylist>
<country>
<name>United States of America</name>
<isocode>US</isocode>
<preferedgateways>
<gateway id="nexmo" istwoway="yes" primary="yes"/>
<gateway id="beepsend" istwoway="no" primary="no"/>
</preferedgateways>
<supportedgateways>
<gateway id="smsglobal" istwoway="no" displayorder="4"/>
<gateway id="twilio" istwoway="yes" displayorder="1"/>
</supportedgateways>
</country>
<country>
<name>Australia</name>
<isocode>AU</isocode>
<preferedgateways>
<gateway id="beepsend" istwoway="yes" primary="no"/>
<gateway id="beepsend" istwoway="no" primary="yes"/>
</preferedgateways>
<supportedgateways>
<gateway id="smsglobal" istwoway="no" displayorder="4"/>
<gateway id="twilio" istwoway="yes" displayorder="1"/>
</supportedgateways>
</country>
<country>
<name>Brazil</name>
<isocode>BR</isocode>
<preferedgateways>
<gateway id="beepsend" istwoway="yes" primary="yes"/>
<gateway id="beepsend" istwoway="no" primary="no"/>
</preferedgateways>
<supportedgateways>
<gateway id="smsglobal" istwoway="no" displayorder="4"/>
<gateway id="twilio" istwoway="yes" displayorder="1"/>
</supportedgateways>
</country>
<country>
<name>Canada</name>
<isocode>CA</isocode>
<preferedgateways>
<gateway id="beepsend" istwoway="yes" primary="yes"/>
<gateway id="beepsend" istwoway="no" primary="no"/>
</preferedgateways>
<supportedgateways>
<gateway id="smsglobal" istwoway="no" displayorder="4"/>
<gateway id="twilio" istwoway="yes" displayorder="1"/>
</supportedgateways>
</country>
<country>
<name>India</name>
<isocode>IN</isocode>
<preferedgateways>
<gateway id="beepsend" istwoway="yes" primary="yes"/>
<gateway id="beepsend" istwoway="no" primary="no"/>
</preferedgateways>
<supportedgateways>
<gateway id="smsglobal" istwoway="no" displayorder="4"/>
<gateway id="twilio" istwoway="yes" displayorder="1"/>
</supportedgateways>
</country>
<country>
<name>KSA</name>
<isocode>SA</isocode>
<preferedgateways>
<gateway id="beepsend" istwoway="yes" primary="yes"/>
<gateway id="beepsend" istwoway="no" primary="no"/>
</preferedgateways>
<supportedgateways>
<gateway id="smsglobal" istwoway="no" displayorder="4"/>
<gateway id="twilio" istwoway="yes" displayorder="1"/>
</supportedgateways>
</country>
<country>
<name>Pakistan</name>
<isocode>PK</isocode>
<preferedgateways>
<gateway id="beepsend" istwoway="yes" primary="yes"/>
<gateway id="beepsend" istwoway="no" primary="no"/>
</preferedgateways>
<supportedgateways>
<gateway id="smsglobal" istwoway="no" displayorder="4"/>
<gateway id="twilio" istwoway="yes" displayorder="1"/>
</supportedgateways>
</country>
<country>
<name>South Africa</name>
<isocode>ZA</isocode>
<preferedgateways>
<gateway id="beepsend" istwoway="yes" primary="yes"/>
<gateway id="beepsend" istwoway="no" primary="no"/>
</preferedgateways>
<supportedgateways>
<gateway id="smsglobal" istwoway="no" displayorder="4"/>
<gateway id="twilio" istwoway="yes" displayorder="1"/>
</supportedgateways>
</country>
<country>
<name>Srilanka</name>
<isocode>LK</isocode>
<preferedgateways>
<gateway id="beepsend" istwoway="yes" primary="yes"/>
<gateway id="beepsend" istwoway="no" primary="no"/>
</preferedgateways>
<supportedgateways>
<gateway id="smsglobal" istwoway="no" displayorder="4"/>
<gateway id="twilio" istwoway="yes" displayorder="1"/>
</supportedgateways>
</country>
<country>
<name>Sweden</name>
<isocode>SE</isocode>
<preferedgateways>
<gateway id="nexmo" istwoway="yes" primary="yes"/>
<gateway id="beepsend" istwoway="no" primary="no"/>
</preferedgateways>
<supportedgateways>
<gateway id="smsglobal" istwoway="no" displayorder="4"/>
<gateway id="twilio" istwoway="yes" displayorder="1"/>
</supportedgateways>
</country>
<country>
<name>Denmark</name>
<isocode>DK</isocode>
<preferedgateways>
<gateway id="beepsend" istwoway="yes" primary="yes"/>
<gateway id="beepsend" istwoway="no" primary="no"/>
</preferedgateways>
<supportedgateways>
<gateway id="smsglobal" istwoway="no" displayorder="4"/>
<gateway id="twilio" istwoway="yes" displayorder="1"/>
</supportedgateways>
</country>
<country>
<name>Norway</name>
<isocode>NO</isocode>
<preferedgateways>
<gateway id="beepsend" istwoway="yes" primary="yes"/>
<gateway id="beepsend" istwoway="no" primary="no"/>
</preferedgateways>
<supportedgateways>
<gateway id="smsglobal" istwoway="no" displayorder="4"/>
<gateway id="twilio" istwoway="yes" displayorder="1"/>
</supportedgateways>
</country>
<country>
<name>Finland</name>
<isocode>FI</isocode>
<preferedgateways>
<gateway id="beepsend" istwoway="yes" primary="yes"/>
<gateway id="beepsend" istwoway="no" primary="no"/>
</preferedgateways>
<supportedgateways>
<gateway id="smsglobal" istwoway="no" displayorder="4"/>
<gateway id="twilio" istwoway="yes" displayorder="1"/>
</supportedgateways>
</country>
<country>
<name>Serbia</name>
<isocode>RS</isocode>
<preferedgateways>
<gateway id="beepsend" istwoway="yes" primary="yes"/>
<gateway id="beepsend" istwoway="no" primary="no"/>
</preferedgateways>
<supportedgateways>
<gateway id="smsglobal" istwoway="no" displayorder="4"/>
<gateway id="twilio" istwoway="yes" displayorder="1"/>
</supportedgateways>
</country>
<country>
<name>Spain</name>
<isocode>ES</isocode>
<preferedgateways>
<gateway id="beepsend" istwoway="yes" primary="yes"/>
<gateway id="beepsend" istwoway="no" primary="no"/>
</preferedgateways>
<supportedgateways>
<gateway id="smsglobal" istwoway="no" displayorder="4"/>
<gateway id="twilio" istwoway="yes" displayorder="1"/>
</supportedgateways>
</country>
<country>
<name>Turkey</name>
<isocode>TR</isocode>
<preferedgateways>
<gateway id="beepsend" istwoway="yes" primary="yes"/>
<gateway id="beepsend" istwoway="no" primary="no"/>
</preferedgateways>
<supportedgateways>
<gateway id="smsglobal" istwoway="no" displayorder="4"/>
<gateway id="twilio" istwoway="yes" displayorder="1"/>
</supportedgateways>
</country>
<country>
<name>Hungary</name>
<isocode>HU</isocode>
<preferedgateways>
<gateway id="beepsend" istwoway="yes" primary="yes"/>
<gateway id="beepsend" istwoway="no" primary="no"/>
</preferedgateways>
<supportedgateways>
<gateway id="smsglobal" istwoway="no" displayorder="4"/>
<gateway id="twilio" istwoway="yes" displayorder="1"/>
</supportedgateways>
</country>
<country>
<name>Poland</name>
<isocode>PL</isocode>
<preferedgateways>
<gateway id="beepsend" istwoway="yes" primary="yes"/>
<gateway id="beepsend" istwoway="no" primary="no"/>
</preferedgateways>
<supportedgateways>
<gateway id="smsglobal" istwoway="no" displayorder="4"/>
<gateway id="twilio" istwoway="yes" displayorder="1"/>
</supportedgateways>
</country>
<country>
<name>Germany</name>
<isocode>DE</isocode>
<preferedgateways>
<gateway id="beepsend" istwoway="yes" primary="yes"/>
<gateway id="beepsend" istwoway="no" primary="no"/>
</preferedgateways>
<supportedgateways>
<gateway id="smsglobal" istwoway="no" displayorder="4"/>
<gateway id="twilio" istwoway="yes" displayorder="1"/>
</supportedgateways>
</country>
</countrylist>
</opensmsconfig>