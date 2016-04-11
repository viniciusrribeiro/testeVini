public class StringArrayTest {

    
    public static List<String> generateStringArray (Integer qtdArray){
        
        List<String> teste = new List<String>();
        
        for(Integer x = 0; x < qtdArray; x++ ){
            teste.add('Test ' + x);
        }
        
        System.debug(teste);
       return teste;
    }
}