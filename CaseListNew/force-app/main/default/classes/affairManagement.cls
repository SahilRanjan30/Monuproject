public with sharing class affairManagement {
    public static void fetchRepresentatives() {
        String apiUrl = 'https://api.example.com/representatives';
        HttpRequest request = new HttpRequest();
        request.setEndpoint(apiUrl);
        request.setMethod('GET');
        
        
        request.setHeader('Authorization', 'Bearer YOUR_ACCESS_TOKEN');
        
        HttpResponse response = new Http().send(request);
        if (response.getStatusCode() == 200) {
            List<Representative__c> representatives = parseResponse(response.getBody());
            upsert representatives Representative__c.Unique_Field__c;
        } else {
            System.debug('API request failed with status code: ' + response.getStatusCode());
        }
    }
    private static List<Representative__c> parseResponse(String responseBody) {
        List<Representative__c> representatives = new List<Representative__c>();
        return representatives;
    }
}
