package com.bootcamp.contracts;

import com.bootcamp.states.TokenState;
import net.corda.core.contracts.CommandData;
import net.corda.core.contracts.CommandWithParties;
import net.corda.core.contracts.Contract;
import net.corda.core.contracts.ContractState;
import net.corda.core.transactions.LedgerTransaction;

import java.util.List;

import static net.corda.core.contracts.ContractsDSL.requireSingleCommand;
import static net.corda.core.contracts.ContractsDSL.requireThat;

public class TokenContract implements Contract {
    public static String ID = "com.bootcamp.contracts.TokenContract";


    public void verify(LedgerTransaction tx) throws IllegalArgumentException {
////all rules are given here
//        if(tx.getInputStates().size()!=0){
//            throw new IllegalArgumentException("input state should be 0");
//        }
//        if(tx.getOutputStates().size()!=1){
//            throw new IllegalArgumentException("only 1 output required");
//        }
//        if(tx.getCommands().size()!=1){
//            throw new IllegalArgumentException("only 1 command requires");
//        }
//        if(!(tx.getOutput(0) instanceof TokenState)){
//            throw new IllegalArgumentException("TokenContract requires Tokenstate instance");
//        }
//        TokenState tokenState= (TokenState)tx.getOutput(0);
//        if(tokenState.getAmount()<0){
//            throw new IllegalArgumentException("amount should be positive");
//        }
//        if(!(tx.getCommands() instanceof TokenContract.Commands.Issue)){
//            throw new IllegalArgumentException("command should be instance of TokenContract.Commands.Issue");
//        }
//        if(!(tx.getCommand(0).getSigners().contains(tokenState.getOwner().getOwningKey()))){
////signer has to be node A
//            throw new IllegalArgumentException("token contract required signer has to be node A");
//        }
    }


    public interface Commands extends CommandData {
        //defines the commands that takes places in states ex: settle, transfer, issue
        class Issue implements Commands { }
    }
}