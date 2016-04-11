/*
* Classe para calculos à partir das horas de trabalho da org
* Autor: @ViníciusReis
* Data de criação: 10/04/2016
*/

public class clsBusinessHours {
    
   /*
   * Descrição: Método que retorna próximo dia util à partir de uma váriavel com nº de dias do prazo
   * Autor: @ViníciusReis
   * Data de criação: 10/04/2016
   */
    public static Datetime retornaProximoDiaUtil (Decimal prazo){

    	BusinessHours bh = [SELECT Id FROM BusinessHours WHERE IsDefault=true];
        //Estabeleço que meu dia util irá partir da data atual (Inserção do caso) somada ao números de dias (Prazo)
        Datetime targetTime = Datetime.now() + prazo;
        //À partir da targetTime, retorna o dia e hora util
        Datetime nextStart = BusinessHours.nextStartDate(bh.id, targetTime);
        
    	return nextStart;
    }

}