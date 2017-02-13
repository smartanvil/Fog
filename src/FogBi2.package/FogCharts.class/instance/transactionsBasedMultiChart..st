transactions
transactionsBasedMultiChart: txToAnalyze
	| composer from to acc txxEther txEtherGasPrice |
	composer := RTComposer new.
	composer gap: 100.
	from := self transactionBasedAccountsByFromKindPie: txToAnalyze on: composer view.
	composer group: #BriefFrom.
	to := self transactionBasedAccountsByToKindPie: txToAnalyze on: composer view.
	composer group: #BriefTo.
	acc := self transactionBasedAccountsParticipantsFromPie: txToAnalyze on: composer view.
	composer group: #AccountsFrom.
	acc := self transactionBasedAccountsParticipantsToPie: txToAnalyze on: composer view.
	composer group: #AccountsTo.
	txxEther := self transactionsBasedEtherOfTxBar: txToAnalyze on: composer view.
	composer group: #txEther.
	txEtherGasPrice := self transactionsBasedGasPriceEther: txToAnalyze on: composer view.
	composer group: #txEtherGasPrice.
	composer
		move: #AccountsFrom onTheRightOf: #BriefFrom;
		move: #BriefTo onTheRightOf: #AccountsFrom;
		move: #AccountsTo onTheRightOf: #BriefTo;
		move: #txEther below: #BriefFrom;
		move: #txEtherGasPrice onTheRightOf: #txEther;
		nameGroup: #BriefFrom as: 'From';
		nameGroup: #BriefTo as: 'To';
		nameGroup: #AccountsFrom as: 'Accounts From';
		nameGroup: #AccountsTo as: 'Accounts To';
		nameBelowGroup: #txEther as: 'Ether x Tx ';
		nameBelowGroup: #txEtherGasPrice as: 'Gas x Gas Price x Value';
		propagateHighlightToAll.
	^ composer view