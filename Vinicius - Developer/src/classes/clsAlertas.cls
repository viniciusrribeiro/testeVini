/*
* Descrição: Classe criada para disparar metodos com alertas e erros
* Autor: @Vinicius
* Data de criação: 10/04/2016
*/

public class clsAlertas{

	/*
	* Descrição: Quando o caso é fechado, o usuário proprietário é notificado
	* Autor: @ViniciusReis
	* Data de criação: 10/04/2016
	*/
	public static void alertaFechamentoCaso(List<Case> lstCasos){

		for(Case c : lstCasos){

			if(c.status == 'Fechado'){

				User emailUser = [SELECT EMAIL FROM USER WHERE ID =: c.OwnerId LIMIT 1];

				String emailUsuario  = String.valueof(emailUser.EMAIL);
				String assunto = 'Caso encerrado: nº caso' + String.valueof(c.casenumber);
				String descricao = 'O caso nº: ' + String.valueof(c.casenumber) + ' foi encerrado';

				clsEnviaEmail.enviaEmail(emailUsuario, assunto, descricao); 
			}
		}

	}

	/*
	* Descrição: Se o status antigo do caso for New e o usuário tentar encerrar, disparar um erro.
	* Autor: @ViniciusReis
	* Data de criação: 10/04/2016
	*/
	 
	public static void alertaFechamentoCasoIndevido (List<Case> lstCasos, List<Case> listOldCases){
	//Percorro a lista do caso e a lista do caso com informações antigas e as comparo.
		for(Case c: lstCasos){
			for(Case cs : listOldCases){
				if(c.status == 'Fechado' && cs.status == 'New'){
					c.addError(' Você tentou encerrar um caso sem atualizações de status. Por gentileza atualize antes de encerrar');

				}
				
			}

		}
	}

	
}