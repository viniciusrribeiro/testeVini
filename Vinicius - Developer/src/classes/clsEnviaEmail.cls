public class clsEnviaEmail {

    public static void enviaEmail (String endereco, String assunto, String corpoEmail){
        
        //Crio um objeto de email
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        String [] toAddresses = new String[] {endereco};
        email.setToAddresses(toAddresses);
        email.setSubject(assunto);
        email.setPlainTextBody(corpoEmail);
        
        Messaging.SendEmailResult[] resultado = Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
        
       //Chamo um método para validar se o e-mail foi enviado
      
       verificaResultadoEmail(resultado);       
    }
    private static Boolean verificaResultadoEmail (Messaging.SendEmailResult[] resultado){
        
        Boolean resultadoEnvio = true;
        
        /* O método enviaEmail retorna um array com o resultado.
         * Iteramos essa lista para verificar os resultados. Nessa classe,
         * só enviamos um e-mail, portanto, deveremos ter apenas um e-mail
         * na lista.
         */
        for (Messaging.SendEmailResult res : resultado){
            if(res.isSuccess()){
                System.debug('Email enviado com sucesso!');
            }
            else {
            	resultadoEnvio = false;
            	System.debug ('Falhou' + res.getErrors());
            }
        
        }   
        return resultadoEnvio;   
    }
}