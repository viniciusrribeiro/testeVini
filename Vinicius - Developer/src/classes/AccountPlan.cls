global class AccountPlan {


	webservice String estado;
	webservice String descricao;

	global class AccountGeneretor{

		webservice Id accountGeneratorId;
		webservice Integer agNumber;
		webservice Date planningPeriod	;
		webservice String name;

	}


	webservice static AccountGeneretor createAccountPLan (AccountGeneretor ag){

		Account acc = new Account();

		acc.name = ag.name;
		acc.accountNumber = String.valueof(ag.agNumber);

		insert acc;

		ag.accountGeneratorId = acc.id;
		return ag;


	}

}