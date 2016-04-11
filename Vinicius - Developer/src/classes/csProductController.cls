public class csProductController {
    
   public List<Product__c> lstProducts{ get;set;}
   public List<SelectOption> lstTypeProducts{ get;set;} 
    
   public final Product__c produto; 
   
   List<SelectOption> lists {get;set;}
          
   public csProductController() {
        
  		   //lstProducts.add(new SelectOption(produto.Id,produto.Name));
           //lstTypeProducts.add(new SelectOption(produto.id, produto.Tipo_de_produto__c));
    }
    
    public List<Product__c> getProducts(){
        
    //   Product__c prod = new Product__c();  
       lstProducts = new List<Product__c>([SELECT ID, NAME FROM Product__c]);
     //  lstTypeProducts = new List<SelectOption>();
       
       return lstProducts;
    }
    
    public PageReference atualizaProduto (){
       
       produto.Color__c = 'blue';
       update produto;
       System.debug('>>>>>>>>>>>>SSASASASAS>>>>>>>>>>' + produto);
       return null;
       
    }
}