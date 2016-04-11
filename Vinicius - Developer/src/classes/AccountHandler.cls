public class AccountHandler {
	
    public static Account insertNewAccount (String nomeConta){
        Account ac = new Account (Name = nomeConta);
        try{ 
            insert ac;
            System.debug('------------->'+ ac);
            return ac;
        }catch(DmlException e){
            
            System.debug(e);
            
            return null;
        }
    }
}