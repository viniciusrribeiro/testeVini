public class ContactSearch {

    public static List<Contact> searchForContacts (String name1, String name2){
        
       	List<Contact> tmp = [SELECT ID, NAME FROM Contact WHERE name =: name1 OR MailingPostalCode =: name2 LIMIT 1];
          	
        System.debug('>>>>>>>>>>>>>>>>>' + tmp);
		
        return tmp;        
    } 


}