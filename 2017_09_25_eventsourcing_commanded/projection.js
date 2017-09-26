fromCategory('account').foreachStream().when({

        "Elixir.Bank.Events.AccountOpened": function(state, ev){
            return {balance: extractInitialBalance(ev.bodyRaw)}; },
        "Elixir.Bank.Events.MoneyDeposited": function(state, ev){
            state.balance = state.balance + extractAmount(ev.bodyRaw);
            return state; },
        "Elixir.Bank.Events.MoneyWithdrawn": function(state, ev){
            state.balance = state.balance - extractAmount(ev.bodyRaw);
            return state; }
    })
function extractInitialBalance(msg){
    return parseInt(msg.match(/initial_balance":(\d+)/)[1]);
}
function extractAmount(msg){
    return parseInt(msg.match(/amount":(\d+)/)[1]);
}