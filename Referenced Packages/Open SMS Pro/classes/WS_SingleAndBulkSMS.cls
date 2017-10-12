/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class WS_SingleAndBulkSMS {
    global WS_SingleAndBulkSMS() {

    }
    webService static String bulkSMS(List<String> PhoneNumbers, String Message) {
        return null;
    }
    @InvocableMethod(label='Called from ProcessBuilder' description='Prepare a JSON and pass it to singleSMS Method')
    global static void prepareJSON(List<OpenSMSPro.WS_SingleAndBulkSMS.Request> lstRequest) {

    }
    webService static String singleSMS(String strSMSInfo, String message) {
        return null;
    }
global class Request {
    @InvocableVariable(label='Mobile Field Name' required=true)
    global String mobileField;
    @InvocableVariable(label='Mobile Number' required=true)
    global String mobileNo;
    @InvocableVariable(label='Object Name' required=true)
    global String objName;
    @InvocableVariable(label='Record Id' required=true)
    global String recId;
    global Request() {

    }
}
}
